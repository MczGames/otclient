local UI = nil
local virtualFloor = 7
local viewRadioGroup = nil
local loadedAssetsDir = nil
local loadedFloorSet = {} -- floors already indexed for loadedAssetsDir

-- Forward declaration — defined later in the file.
local refreshVirtualFloors
local mostrarCoordenada -- definida mais abaixo (coordenada exata do mapa)

-- FusionTsu: nomes do mapa-mundi (cidades, bairros, areas de caca, cavernas) e o marcador seguindo o personagem.
-- Os nomes vem de /data/mundo_lugares.json (gerado por tools/mundo/gerar_minimapa.py no repositorio do jogo).
local LUGARES_ARQ = '/data/mundo_lugares.json'
local DISTANCIA_ANDAR = 250 -- igual ao limite do UIMinimap para o "andar ate la"
local CORES_LUGAR = { cidade = '#ffffff', bairro = '#d6d6e6', caca = '#ffd85a', caverna = '#e6b47a', estacao = '#8fd3ff' }
local seguirEvento = nil
local ultimaPos = nil

-- Clique num nome ou nos monstros: o personagem vai ANDANDO ate la (nunca teleporta). Se o lugar fica em outro andar
-- ou longe demais para o caminho automatico (limite de 250 tiles do cliente), so avisa: o jogador segue pela estrada.
local function irParaLugar(lugar)
    local player = g_game.getLocalPlayer()
    if not player then
        return
    end
    local alvo = { x = lugar.x, y = lugar.y, z = lugar.z }
    local pos = player:getPosition()
    if not pos then
        return
    end
    if pos.z ~= alvo.z then
        modules.game_textmessage.displayFailureMessage('Esse lugar fica em outro andar: va ate a entrada e desca.')
    elseif Position.distance(pos, alvo) > DISTANCIA_ANDAR then
        modules.game_textmessage.displayFailureMessage('Fica longe demais para ir direto: siga pela estrada e clique de novo mais perto.')
    else
        player:autoWalk(alvo)
    end
end

-- Monstros de uma area de caca ou caverna: um icone so, com os bichos da area juntos (o principal na frente e o outro
-- um pouco atras); o nome e o nivel aparecem ao passar o mouse. Clique leva ate la, como nos nomes.
local TAM_MONSTRO = 32
local DESLOCA = 12 -- quanto o bicho de tras fica para a direita e para cima
local function criarMonstros(lugar)
    local n = #lugar.monstros
    local caixa = g_ui.createWidget('UIWidget')
    caixa:resize(TAM_MONSTRO + (n - 1) * DESLOCA + 4, TAM_MONSTRO + (n - 1) * 4 + 4)
    caixa:setBackgroundColor('#00000090')
    caixa:setBorderWidth(1)
    caixa:setBorderColor('#7a3cc8')
    caixa:setPhantom(false)
    local linhas = {}
    -- desenha de tras para a frente: o ultimo criado fica por cima
    for i = n, 1, -1 do
        local m = lugar.monstros[i]
        local bicho = g_ui.createWidget('UICreature', caixa)
        bicho:setOutfit({ type = m.outfit })
        bicho:setCreatureSize(TAM_MONSTRO)
        bicho:setCenter(true)
        bicho:addAnchor(AnchorTop, 'parent', AnchorTop)
        bicho:addAnchor(AnchorLeft, 'parent', AnchorLeft)
        bicho:setMarginTop(2 + (n - i) * 4)
        bicho:setMarginLeft(2 + (i - 1) * DESLOCA)
        bicho:setPhantom(true)
    end
    for _, m in ipairs(lugar.monstros) do
        linhas[#linhas + 1] = m.nome .. (m.forte and ' (forte)' or '')
    end
    local nivel = lugar.niveis and string.format('\nNivel %d-%d', lugar.niveis[1], lugar.niveis[2]) or ''
    caixa:setTooltip(table.concat(linhas, '\n') .. nivel .. '\n(clique para ir andando)')
    return caixa
end

-- Os monstros so aparecem no andar em que estao (os das cavernas no andar 8); os nomes valem para todos os andares.
local function filtrarAndar(minimapWidget)
    local cam = minimapWidget:getCameraPosition()
    if not cam then
        return
    end
    for _, w in pairs(minimapWidget.alternatives or {}) do
        if w.andar and w.andar ~= cam.z then
            w:hide()
        end
    end
end

local function criarNomesDoMundo(minimapWidget)
    if minimapWidget.nomesDoMundo or not g_resources.fileExists(LUGARES_ARQ) then
        return
    end
    local ok, dados = pcall(function()
        return json.decode(g_resources.readFileContents(LUGARES_ARQ))
    end)
    if not ok or type(dados) ~= 'table' or type(dados.lugares) ~= 'table' then
        g_logger.warning('[cyclopedia] nao foi possivel ler ' .. LUGARES_ARQ)
        return
    end
    minimapWidget.nomesDoMundo = true
    for _, lugar in ipairs(dados.lugares) do
        if lugar.tipo == 'boss' then
            -- so um pontinho amarelo, sem nome (como uma escada), no andar do boss
            local ponto = modules.game_minimap.criarPontoBoss()
            ponto.andar = lugar.z
            minimapWidget:addAlternativeWidget(ponto, { x = lugar.x, y = lugar.y, z = lugar.z }, lugar.zoom)
        elseif lugar.tipo == 'monstros' and type(lugar.monstros) == 'table' then
            local caixa = criarMonstros(lugar)
            caixa.andar = lugar.z
            caixa.onMouseRelease = function(widget, mousePos, button)
                if button == MouseLeftButton then
                    irParaLugar(lugar)
                    return true
                end
                return false
            end
            minimapWidget:addAlternativeWidget(caixa, { x = lugar.x, y = lugar.y, z = lugar.z }, lugar.zoom)
        else
        local rotulo = g_ui.createWidget('UILabel')
        rotulo:setFont(lugar.tipo == 'cidade' and 'verdana-11px-rounded' or 'verdana-9px-bold')
        rotulo:setText(lugar.nome)
        rotulo:setColor(CORES_LUGAR[lugar.tipo] or '#ffffff')
        rotulo:setBackgroundColor('#000000aa')
        rotulo:setTextAutoResize(true)
        rotulo:setPhantom(false)
        rotulo:setTooltip(lugar.nome .. ' (clique para ir andando)')
        rotulo.onMouseRelease = function(widget, mousePos, button)
            if button == MouseLeftButton then
                irParaLugar(lugar)
                return true
            end
            return false
        end
        minimapWidget:addAlternativeWidget(rotulo, { x = lugar.x, y = lugar.y, z = lugar.z }, lugar.zoom)
        end
    end
    -- depois do zoom e da troca de andar, esconde os monstros de outro andar
    local zoomOriginal = minimapWidget.onZoomChange
    minimapWidget.onZoomChange = function(self, ...)
        zoomOriginal(self, ...)
        filtrarAndar(self)
    end
    local cameraOriginal = minimapWidget.onCameraPositionChange
    minimapWidget.onCameraPositionChange = function(self, ...)
        if cameraOriginal then
            cameraOriginal(self, ...)
        end
        self:onZoomChange(self:getZoom())
    end
    minimapWidget:setAlternativeWidgetsVisible(true)
    minimapWidget:onZoomChange(minimapWidget:getZoom())
end

-- O marcador do personagem acompanha o boneco: confere a posicao 4 vezes por segundo enquanto o mapa estiver aberto.
local function seguirJogador()
    if not UI or UI:isDestroyed() then
        if seguirEvento then
            removeEvent(seguirEvento)
            seguirEvento = nil
        end
        return
    end
    local player = g_game.getLocalPlayer()
    local pos = player and player:getPosition()
    if not pos then
        return
    end
    if ultimaPos and ultimaPos.x == pos.x and ultimaPos.y == pos.y and ultimaPos.z == pos.z then
        return
    end
    ultimaPos = { x = pos.x, y = pos.y, z = pos.z }
    local minimapWidget = UI.MapBase.minimap
    if not minimapWidget:isDragging() then
        minimapWidget:setCameraPosition({ x = pos.x, y = pos.y, z = pos.z })
    end
    minimapWidget:setCrossPosition({ x = pos.x, y = pos.y, z = pos.z })
    if not minimapWidget:isHovered() then
        mostrarCoordenada(pos)
    end
end

-- Surface View is only available for floors 0-7 (surface and above).
-- Underground floors (8-15) always use Map View.
local SEA_FLOOR = 7

local function ensureViewFloorsLoaded()
    local assetsDir = string.format("/data/things/%d", g_game.getClientVersion())

    -- Reset when switching game versions
    if assetsDir ~= loadedAssetsDir then
        g_satelliteMap.clear()
        loadedFloorSet = {}
        loadedAssetsDir = assetsDir
    end

    -- For surface floors: composite view needs [virtualFloor, SEA_FLOOR].
    -- For underground: only the current floor is needed (static minimap, map view only).
    local floorMax = (virtualFloor <= SEA_FLOOR) and SEA_FLOOR or virtualFloor

    local minNeeded, maxNeeded
    for f = virtualFloor, floorMax do
        if not loadedFloorSet[f] then
            if not minNeeded then
                minNeeded = f
            end
            maxNeeded = f
        end
    end

    if minNeeded then
        g_satelliteMap.loadFloors(assetsDir, minNeeded, maxNeeded)
        for f = minNeeded, maxNeeded do
            loadedFloorSet[f] = true
        end
    end
end

local function isSurfaceFloor(floor)
    return floor <= SEA_FLOOR
end

local function updateViewMode()
    if not UI or not viewRadioGroup then
        return
    end

    local minimapWidget = UI.MapBase.minimap
    local viewBase = UI.InformationBase.InternalBase.DisplayBase.ViewBase1
    local surfaceCheck = viewBase.SurfaceCheck
    local separatorScroll = viewBase.SeparatorScroll
    local separatorLabel = viewBase.SeparatorLabel

    local canUseSurface = isSurfaceFloor(virtualFloor) and g_satelliteMap.hasChunksForView(virtualFloor)

    -- Underground: force Map View and lock the Surface option.
    -- selectWidget must come BEFORE setEnabled: UIRadioGroup calls setChecked(false)
    -- on the deselected widget, which does not work correctly on a disabled widget.
    if not canUseSurface then
        viewRadioGroup:selectWidget(viewBase.MapCheck)
    end
    surfaceCheck:setEnabled(canUseSurface)

    -- Level separator scroll is only meaningful in Surface View on floors above z7 (z < 7).
    -- At z7 itself the composite has no lower floor to blend with, so the scroll is unused.
    local inSurfaceMode = canUseSurface and surfaceCheck:isChecked() and virtualFloor < SEA_FLOOR
    separatorScroll:setEnabled(inSurfaceMode)
    separatorLabel:setEnabled(inSurfaceMode)
end

function showMap()
    g_minimap.saveOtmm('/minimap.otmm')
    UI = g_ui.loadUI("map", contentContainer)
    UI:show()
    controllerCyclopedia:registerEvents(LocalPlayer, {
        onPositionChange = Cyclopedia.onUpdateCameraPosition
    }):execute()

    Cyclopedia.loadMap()

    ultimaPos = nil
    if seguirEvento then
        removeEvent(seguirEvento)
    end
    seguirEvento = cycleEvent(seguirJogador, 250)
    seguirJogador()

    controllerCyclopedia.ui.CharmsBase:setVisible(false)
    controllerCyclopedia.ui.GoldBase:setVisible(true)
    controllerCyclopedia.ui.BestiaryTrackerButton:setVisible(false)
    if g_game.getClientVersion() >= 1410 then
        controllerCyclopedia.ui.CharmsBase1410:setVisible(false)
    end
end

-- FusionTsu: coordenada exata e barra de botoes do mapa.
-- A caixa embaixo mostra a posicao do quadradinho debaixo do mouse; com o mouse fora do mapa, mostra onde o jogador
-- esta. Clicar nela copia a posicao do jogador ("x, y, z") para mandar a alguem; quem recebe cola na lupa e o mapa
-- vai direto para o ponto, com um alfinete vermelho.
local ALFINETE = '/images/game/mapa/alfinete'
local alfinete = nil

local function textoPos(pos)
    return string.format('%d, %d, %d', pos.x, pos.y, pos.z)
end

mostrarCoordenada = function(pos)
    if not UI or UI:isDestroyed() or not pos then
        return
    end
    UI.MapBase.coordenada:setText(textoPos(pos))
end

local function posicaoDoJogador()
    local player = g_game.getLocalPlayer()
    return player and player:getPosition()
end

local function trocarAndar(z)
    if z == virtualFloor then
        return
    end
    virtualFloor = z
    ensureViewFloorsLoaded()
    refreshVirtualFloors()
    updateViewMode()
end

function Cyclopedia.centralizarNoJogador()
    local pos = posicaoDoJogador()
    if not UI or not pos then
        return
    end
    local minimapWidget = UI.MapBase.minimap
    minimapWidget:setCameraPosition({ x = pos.x, y = pos.y, z = pos.z })
    minimapWidget:setCrossPosition({ x = pos.x, y = pos.y, z = pos.z })
    trocarAndar(pos.z)
end

-- aceita "1080, 2496, 7", "1080 2496 7", "(1080,2496,7)" ou so "x, y" (fica no andar que o mapa mostra)
local function lerCoordenada(texto)
    local n = {}
    for numero in tostring(texto):gmatch('%d+') do
        n[#n + 1] = tonumber(numero)
    end
    if #n < 2 then
        return nil
    end
    local z = n[3] or virtualFloor
    if z < 0 or z > 15 then
        return nil
    end
    return { x = n[1], y = n[2], z = z }
end

local function irParaCoordenada(pos)
    local minimapWidget = UI.MapBase.minimap
    if alfinete and not alfinete:isDestroyed() then
        alfinete:destroy()
    end
    alfinete = nil
    minimapWidget:setCameraPosition(pos)
    trocarAndar(pos.z)
    minimapWidget:addFlag(pos, ALFINETE, 'Coordenada ' .. textoPos(pos), true)
    alfinete = minimapWidget:getFlag(pos)
    mostrarCoordenada(pos)
end

function Cyclopedia.abrirBuscaCoordenada()
    if not UI then
        return
    end
    local caixa = UI.MapBase.buscaCoordenada
    if caixa:isVisible() then
        caixa:hide()
        return
    end
    caixa:show()
    caixa:focus()
    caixa:setText(g_window.getClipboardText() and lerCoordenada(g_window.getClipboardText()) and
                      g_window.getClipboardText() or '')
    caixa:setCursorPos(-1)
end

local function configurarFerramentas()
    local minimapWidget = UI.MapBase.minimap
    local coordenada = UI.MapBase.coordenada
    local caixa = UI.MapBase.buscaCoordenada

    minimapWidget.onMouseMove = function(self, mousePos, mouseMoved)
        local pos = self:getTilePosition(mousePos)
        if pos then
            mostrarCoordenada(pos)
        end
        return false
    end
    minimapWidget.onHoverChange = function(self, hovered)
        if not hovered then
            mostrarCoordenada(posicaoDoJogador())
        end
    end

    coordenada.onClick = function()
        local pos = posicaoDoJogador()
        if not pos then
            return
        end
        g_window.setClipboardText(textoPos(pos))
        modules.game_textmessage.displayStatusMessage('Sua posicao foi copiada: ' .. textoPos(pos) ..
                                                          ' (cole no chat para mandar)')
    end

    caixa.onKeyPress = function(self, keyCode, keyboardModifiers)
        if keyCode == KeyEnter or keyCode == KeyReturn then
            local pos = lerCoordenada(self:getText())
            if not pos then
                modules.game_textmessage.displayFailureMessage('Digite a coordenada assim: 1080, 2496, 7')
                return true
            end
            irParaCoordenada(pos)
            self:hide()
            return true
        elseif keyCode == KeyEscape then
            self:hide()
            return true
        end
        return false
    end

    mostrarCoordenada(posicaoDoJogador())
end

function Cyclopedia.loadMap()
    local clientVersion = g_game.getClientVersion()
    local minimapWidget = UI.MapBase.minimap

    -- Prime virtualFloor from current player position before any floor-dependent logic
    local player = g_game.getLocalPlayer()
    if player then
        local pos = player:getPosition()
        if pos then
            virtualFloor = pos.z
        end
    end

    g_minimap.clean()

    local loaded = false
    local minimapFile = "/minimap.otmm"
    local dataMinimapFile = "/data" .. minimapFile
    local versionedMinimapFile = "/minimap" .. clientVersion .. ".otmm"

    if g_resources.fileExists(dataMinimapFile) then
        loaded = g_minimap.loadOtmm(dataMinimapFile)
    end

    if not loaded and g_resources.fileExists(versionedMinimapFile) then
        loaded = g_minimap.loadOtmm(versionedMinimapFile)
    end

    if not loaded and g_resources.fileExists(minimapFile) then
        loaded = g_minimap.loadOtmm(minimapFile)
    end

    if not loaded then
        print("Minimap couldn't be loaded, file missing?")
    end

    -- Preserve the zoom declared in the OTUI style — load() overwrites it with the
    -- HUD minimap's saved settings zoom, which we don't want for Cyclopedia.
    local initialZoom = minimapWidget:getZoom()
    minimapWidget:load()
    minimapWidget:setZoom(initialZoom)
    minimapWidget:setUseStaticMinimap(true)

    -- Load satellite chunks for the floors needed by the current view only.
    -- Additional floors are indexed on demand when the user navigates deeper.
    ensureViewFloorsLoaded()
    local chunkCount = g_satelliteMap.hasChunksForView(virtualFloor) and 1 or 0

    -- Views panel is always visible; satellite chunks determine whether Surface View is enabled.
    local viewBase = UI.InformationBase.InternalBase.DisplayBase.ViewBase1
    local surfaceCheck = viewBase.SurfaceCheck
    local mapCheck = viewBase.MapCheck

    -- Clean up previous radio group if the map tab was reopened
    if viewRadioGroup then
        viewRadioGroup:destroy()
        viewRadioGroup = nil
    end

    viewRadioGroup = UIRadioGroup.create()
    viewRadioGroup:addWidget(surfaceCheck)
    viewRadioGroup:addWidget(mapCheck)

    viewRadioGroup.onSelectionChange = function(self, selected)
        local inSurface = selected == surfaceCheck and isSurfaceFloor(virtualFloor) and
                              g_satelliteMap.hasChunksForView(virtualFloor)
        minimapWidget:setSatelliteMode(inSurface)

        -- Sync separator scroll enabled state (only for floors above z7)
        local separatorScroll = viewBase.SeparatorScroll
        local separatorLabel = viewBase.SeparatorLabel
        local canUseSeparator = inSurface and virtualFloor < SEA_FLOOR
        separatorScroll:setEnabled(canUseSeparator)
        separatorLabel:setEnabled(canUseSeparator)
    end

    -- Default: Surface View when satellite data exists and on a surface floor, else Map View
    viewRadioGroup:selectWidget((chunkCount > 0 and isSurfaceFloor(virtualFloor)) and surfaceCheck or mapCheck)

    -- Hook separator scroll: adjusts floor compositing opacity (1.0 = all visible, 0.0 = target only)
    local separatorScroll = viewBase.SeparatorScroll
    separatorScroll.onValueChange = function(self, value)
        minimapWidget:setFloorSeparatorOpacity(value / 100.0)
    end
    -- Reset opacity on (re-)open
    minimapWidget:setFloorSeparatorOpacity(separatorScroll:getValue() / 100.0)

    updateViewMode()

    -- Sync flags from main minimap's live table (avoids stale g_settings on first open).
    local mainMinimap = modules.game_minimap and modules.game_minimap.getMiniMapUi and
                            modules.game_minimap.getMiniMapUi()
    if mainMinimap then
        for _, flag in pairs(mainMinimap.flags) do
            if not minimapWidget:getFlag(flag.pos) then
                minimapWidget:addFlag(flag.pos, flag.icon, flag.description)
            end
        end
    end

    -- Apply initial filter state: hide flags whose filter checkbox is unchecked.
    local markList = UI.InformationBase.InternalBase.DisplayBase.MarkList
    for _, flag in pairs(minimapWidget.flags) do
        local btn = markList:getChildById(tostring(flag.icon))
        flag:setVisible(btn ~= nil and btn:isChecked())
    end

    criarNomesDoMundo(minimapWidget)
    configurarFerramentas()

    refreshVirtualFloors()
end

function Cyclopedia.toggleMapFlag(widget, checked)
    local flagType = tonumber(widget:getId())
    if not flagType then
        return
    end
    local minimapWidget = UI.MapBase.minimap
    for _, flag in pairs(minimapWidget.flags) do
        if flag.icon == flagType then
            flag:setVisible(checked)
        end
    end
end

function Cyclopedia.showAllFlags(checked)
    local list = UI.InformationBase.InternalBase.DisplayBase.MarkList
    for i = 0, list:getChildCount() - 1 do
        local btn = list:getChildByIndex(i)
        if btn then
            btn:setChecked(checked)
        end
    end
    local minimapWidget = UI.MapBase.minimap
    for _, flag in pairs(minimapWidget.flags) do
        flag:setVisible(checked)
    end
end

function Cyclopedia.moveMap(widget)
    local distance = 5
    local direction = widget:getId()
    if direction == "n" then
        UI.MapBase.minimap:move(0, distance)
    elseif direction == "ne" then
        UI.MapBase.minimap:move(-distance, distance)
    elseif direction == "e" then
        UI.MapBase.minimap:move(-distance, 0)
    elseif direction == "se" then
        UI.MapBase.minimap:move(-distance, -distance)
    elseif direction == "s" then
        UI.MapBase.minimap:move(0, -distance)
    elseif direction == "sw" then
        UI.MapBase.minimap:move(distance, -distance)
    elseif direction == "w" then
        UI.MapBase.minimap:move(distance, 0)
    elseif direction == "nw" then
        UI.MapBase.minimap:move(distance, distance)
    end
end

function Cyclopedia.floorScrollBar(oldValue, value)
    if value < oldValue then
        UI.MapBase.minimap:floorUp()
    elseif oldValue < value then
        UI.MapBase.minimap:floorDown()
    end

    if value < 0 then
        value = 0
    elseif value > 15 then
        value = 15
    end
end

function ConvertLayer(Value)
    if Value == 150 then
        return 7
    elseif Value == 300 then
        return 15
    elseif Value >= 1 and Value <= 300 then
        return math.floor((Value - 1) / 20)
    else
        return 0
    end
end

refreshVirtualFloors = function()
    local mark = UI.InformationBase.InternalBase.NavigationBase.layersMark
    mark:setMarginTop(((virtualFloor + 1) * 4) - 3)
    UI.InformationBase.InternalBase.NavigationBase.automapLayers:setImageClip((virtualFloor * 14) .. ' 0 14 67')

    -- Update player marker (cross) visibility on the minimap
    local cross = UI.MapBase.minimap.cross
    if cross then
        if virtualFloor > SEA_FLOOR then
            cross:setVisible(false)
        elseif virtualFloor < SEA_FLOOR then
            cross:setVisible(true)
            cross:setIconColor("#ffffff80")
        else
            cross:setVisible(true)
            cross:setIconColor("#ffffffff")
        end
    end
end

function Cyclopedia.onUpdateCameraPosition()
    local player = g_game.getLocalPlayer()
    if not player then
        return
    end

    local pos = player:getPosition()
    if not pos then
        return
    end

    local minimapWidget = UI.MapBase.minimap
    if not minimapWidget:isDragging() then
        if not fullmapView then
            minimapWidget:setCameraPosition(player:getPosition())
        end

        minimapWidget:setCrossPosition(player:getPosition(), true)
    end

    local prevFloor = virtualFloor
    virtualFloor = pos.z

    -- When the player changes floor, sync the visual floor indicator and
    -- satellite/map view toggle (e.g. walking underground disables Surface View).
    if virtualFloor ~= prevFloor then
        ensureViewFloorsLoaded()
        refreshVirtualFloors()
        updateViewMode()
    end
end

function Cyclopedia.onClickRoseButton(dir)
    if dir == 'north' then
        UI.MapBase.minimap:move(0, 1)
    elseif dir == 'north-east' then
        UI.MapBase.minimap:move(-1, 1)
    elseif dir == 'east' then
        UI.MapBase.minimap:move(-1, 0)
    elseif dir == 'south-east' then
        UI.MapBase.minimap:move(-1, -1)
    elseif dir == 'south' then
        UI.MapBase.minimap:move(0, -1)
    elseif dir == 'south-west' then
        UI.MapBase.minimap:move(1, -1)
    elseif dir == 'west' then
        UI.MapBase.minimap:move(1, 0)
    elseif dir == 'north-west' then
        UI.MapBase.minimap:move(1, 1)
    end
end

function Cyclopedia.setZoom(zoom)
    if zoom then
        UI.MapBase.minimap:zoomIn()
    else
        UI.MapBase.minimap:zoomOut()
    end
end

function Cyclopedia.downLayer()
    if virtualFloor == 15 then
        return
    end

    UI.MapBase.minimap:floorDown(1)
    virtualFloor = virtualFloor + 1
    ensureViewFloorsLoaded()
    refreshVirtualFloors()
    updateViewMode()
end

function Cyclopedia.upLayer()
    if virtualFloor == 0 then
        return
    end

    UI.MapBase.minimap:floorUp(1)
    virtualFloor = virtualFloor - 1
    ensureViewFloorsLoaded()
    refreshVirtualFloors()
    updateViewMode()
end
