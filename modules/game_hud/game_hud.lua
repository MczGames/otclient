-- HUD em tela cheia do projeto (visao estendida do game_interface, modo 2).
--
-- O game_interface ja poe o mapa ocupando a janela inteira no modo 2; este modulo
-- arruma o resto da tela no estilo do jogo:
--   * menu do topo: so os botoes do jogo, icones proprios, numa barra centralizada;
--   * barras de vida, energia (EA) e XP no rodape, centralizadas;
--   * barra de habilidades (acoes) logo acima delas, com slots redondos e sem fundo;
--   * chat no canto inferior esquerdo, com fundo transparente.
-- Fora do modo 2 (Ctrl+. troca o modo) tudo volta ao layout original do OTClient.
-- Arte gerada por tools/assets/gerar_hud_cliente.py (repositorio mmo-jjk).

local IMG = '/modules/game_hud/images/'

-- Botoes do menu do topo que o jogo usa, na ordem em que aparecem, com o icone novo.
-- Qualquer outro botao (recursos do Tibia: prey, forja, roda, imbuements...) fica
-- escondido na barra do topo enquanto o HUD esta ativo.
local BOTOES = {
    { id = 'inventory',           icone = 'inventario' },
    { id = 'skillsButton',        icone = 'habilidades' },
    { id = 'spelllistButton',     icone = 'tecnicas' },
    { id = 'passivasButton',      icone = 'passivas' },
    { id = 'battleButton',        icone = 'batalha' },
    { id = 'vipListButton',       icone = 'amigos' },
    { id = 'questLogButton',      icone = 'missoes' },
    { id = 'QuestLogTracker',     icone = 'rastreador' },
    { id = 'analyzerButton',      icone = 'analisador' },
    { id = 'highscore',           icone = 'ranking' },
    { id = 'CyclopediaButton',    icone = 'enciclopedia' },
    { id = 'miniMap',             icone = 'minimapa' },
    { id = 'healthMana',          icone = 'vida' },
    { id = 'hotkeysWindowButton', icone = 'atalhos' },
    { id = 'optionsButton',       icone = 'opcoes' },
    { id = 'audioButton',         icone = 'som' },
    { id = 'logoutButton',        icone = 'sair' },
}
local ICONE_POR_ID = {}
for _, b in ipairs(BOTOES) do
    ICONE_POR_ID[b.id] = b.icone
end

local SLOTS_BARRA = 12          -- slots visiveis da barra de habilidades
local LARGURA_SLOT = 36         -- ActionButton (34) + margem (2)
local LARGURA_CHAT = 440
local ALTURA_CHAT = 200
local MARGEM = 6

local hud = nil
local ativo = false
local eventoIcones = nil

-- ------------------------------------------------------------------ barras

local function ajustarBarra(barra, valor, maximo, imagem, texto)
    local fill = barra:getChildById('preenchimento')
    fill:setImageSource(IMG .. imagem)
    local largura = barra:getWidth()
    local w = 0
    if maximo and maximo > 0 then
        w = math.floor(largura * math.max(0, math.min(1, valor / maximo)))
    end
    if w > 0 and w < 12 then
        w = 12 -- abaixo disso o 9-slice (borda 6) deforma
    end
    fill:setWidth(w)
    fill:setVisible(w > 0)
    barra:getChildById('texto'):setText(texto)
end

local function atualizarBarras()
    if not hud then
        return
    end
    local player = g_game.getLocalPlayer()
    if not player then
        return
    end
    local vida, vidaMax = player:getHealth(), player:getMaxHealth()
    local ea, eaMax = player:getMana(), player:getMaxMana()
    local nivel, pct = player:getLevel(), player:getLevelPercent()
    ajustarBarra(hud:getChildById('vida'), vida, vidaMax, 'barra_vida', string.format('Vida  %d / %d', vida, vidaMax))
    ajustarBarra(hud:getChildById('energia'), ea, eaMax, 'barra_energia', string.format('EA  %d / %d', ea, eaMax))
    ajustarBarra(hud:getChildById('xp'), pct, 100, 'barra_xp', string.format('Nv. %d   %d%%', nivel, pct))
end

-- ------------------------------------------------------------------ menu do topo

local function botoesDoTopo()
    return modules.client_topmenu.getRightGameButtonsPanel()
end

local function aplicarIcones()
    local painel = botoesDoTopo()
    if not painel then
        return
    end
    local vistos = {}
    for _, botao in ipairs(painel:getChildren()) do
        local id = botao:getId()
        local icone = ICONE_POR_ID[id]
        if icone then
            botao:setIcon(IMG .. 'icones/' .. icone)
        end
        if ativo then
            if not botao.hudEstiloOriginal then
                botao.hudEstiloOriginal = botao:getStyleName()
            end
            -- o botao de sair aparece duas vezes (topo e painel principal): mostra um so
            local mostrar = icone ~= nil and not vistos[id]
            vistos[id] = true
            if botao.hudVisivelOriginal == nil then
                botao.hudVisivelOriginal = botao:isVisible()
            end
            botao:setVisible(mostrar)
            if mostrar then
                botao:setStyle('HudBotaoTopo')
                botao:setIcon(IMG .. 'icones/' .. icone)
            end
        end
    end
end

-- Poe os botoes na ordem de BOTOES. Nao usa moveChildToIndex: no motor ele indexa
-- m_children com o indice em cache do filho, que fica desatualizado nos botoes que
-- o game_mainpanel move de painel, e corrompe a memoria (o cliente fecha).
local function ordenarBotoes()
    local painel = botoesDoTopo()
    if not (ativo and painel) then
        return
    end
    local porId = {}
    for _, botao in ipairs(painel:getChildren()) do
        if botao:isExplicitlyVisible() and not porId[botao:getId()] then
            porId[botao:getId()] = botao
        end
    end
    for _, b in ipairs(BOTOES) do
        local botao = porId[b.id]
        if botao then
            painel:removeChild(botao)
            painel:addChild(botao)
        end
    end
end

local function restaurarBotoes()
    local painel = botoesDoTopo()
    if not painel then
        return
    end
    for _, botao in ipairs(painel:getChildren()) do
        if botao.hudEstiloOriginal then
            botao:setStyle(botao.hudEstiloOriginal)
            botao.hudEstiloOriginal = nil
        end
        local icone = ICONE_POR_ID[botao:getId()]
        if icone then
            botao:setIcon(IMG .. 'icones/' .. icone)
        end
        if botao.hudVisivelOriginal ~= nil then
            botao:setVisible(botao.hudVisivelOriginal)
            botao.hudVisivelOriginal = nil
        end
    end
end

local OUTROS_DO_TOPO = { 'topLeftButtonsPanel', 'leftButtonsPanel', 'rightButtonsPanel', 'rightGameButtonsPanel',
    'fpsLabel', 'pingLabel', 'topLeftOnlinePlayers', 'topLeftDiscord', 'topLeftYoutube' }

-- largura calculada aqui (sem onGeometryChange: redimensionar o pai dentro do
-- layout do filho derruba o cliente)
local function esconderOutrosDoTopo()
    local topMenu = modules.client_topmenu.getTopMenu()
    if not (ativo and topMenu) then
        return
    end
    for _, id in ipairs(OUTROS_DO_TOPO) do
        local w = topMenu:getChildById(id)
        if w then
            w:setVisible(false)
        end
    end
end

local function ajustarLarguraTopo()
    local topMenu = modules.client_topmenu.getTopMenu()
    local painel = botoesDoTopo()
    if not (ativo and topMenu and painel) then
        return
    end
    local n = 0
    for _, botao in ipairs(painel:getChildren()) do
        if botao:isExplicitlyVisible() then
            n = n + 1
        end
    end
    local largura = n * 30 + math.max(0, n - 1) * 4 + 8
    topMenu:setWidth(largura + 12)
end

local function layoutTopo(estendido)
    local topMenu = modules.client_topmenu.getTopMenu()
    local painel = botoesDoTopo()
    if not topMenu or not painel then
        return
    end
    local root = modules.game_interface.getRootPanel()
    if estendido then
        topMenu:breakAnchors()
        topMenu:addAnchor(AnchorTop, 'parent', AnchorTop)
        topMenu:addAnchor(AnchorHorizontalCenter, 'parent', AnchorHorizontalCenter)
        topMenu:setMarginTop(4)
        topMenu:setHeight(40)
        topMenu:setImageSource(IMG .. 'barra_topo')
        topMenu:setImageRepeated(false)
        topMenu:setImageBorder(14)
        for _, id in ipairs(OUTROS_DO_TOPO) do
            local w = topMenu:getChildById(id)
            if w then
                w:setVisible(false)
            end
        end
        painel:breakAnchors()
        painel:addAnchor(AnchorTop, 'parent', AnchorTop)
        painel:addAnchor(AnchorBottom, 'parent', AnchorBottom)
        painel:addAnchor(AnchorHorizontalCenter, 'parent', AnchorHorizontalCenter)
        painel:setPadding(5)
        painel:setPaddingLeft(4)
        painel:setPaddingRight(4)
        -- o mapa passa por baixo do menu: nada de faixa no topo
        root:addAnchor(AnchorTop, 'parent', AnchorTop)
        ajustarLarguraTopo()
    else
        topMenu:setMarginTop(0)
        topMenu:setHeight(36)
        topMenu:setImageSource('/images/ui/panel_top')
        topMenu:setImageRepeated(true)
        topMenu:setImageBorder(0)
        painel:breakAnchors()
        painel:addAnchor(AnchorTop, 'parent', AnchorTop)
        painel:addAnchor(AnchorBottom, 'parent', AnchorBottom)
        painel:addAnchor(AnchorRight, 'parent', AnchorRight)
        painel:setPadding(4)
        painel:setPaddingTop(6)
        painel:setPaddingBottom(6)
        for _, id in ipairs({ 'topLeftButtonsPanel', 'leftButtonsPanel', 'rightButtonsPanel', 'rightGameButtonsPanel' }) do
            local w = topMenu:getChildById(id)
            if w then
                w:setVisible(true)
            end
        end
    end
end

-- ------------------------------------------------------------------ barra de habilidades

local function barrasDeAcao()
    local painel = modules.game_interface.getBottomActionPanel()
    return painel and painel:getChildren() or {}
end

local function layoutAcoes(estendido)
    local gi = modules.game_interface
    local acoes = gi.getBottomActionPanel()
    local root = gi.getRootPanel()
    local cooldown = root:getChildById('gameBottomCooldownPanel')
    if not acoes or not cooldown then
        return
    end
    acoes:breakAnchors()
    cooldown:breakAnchors()
    if estendido then
        local largura = SLOTS_BARRA * LARGURA_SLOT + 40
        acoes:addAnchor(AnchorBottom, 'hudPainel', AnchorTop)
        acoes:addAnchor(AnchorHorizontalCenter, 'parent', AnchorHorizontalCenter)
        acoes:setMarginBottom(4)
        acoes:setMarginRight(0)
        acoes:setWidth(largura)
        cooldown:addAnchor(AnchorBottom, 'gameBottomActionPanel', AnchorTop)
        cooldown:addAnchor(AnchorLeft, 'gameBottomActionPanel', AnchorLeft)
        cooldown:addAnchor(AnchorRight, 'gameBottomActionPanel', AnchorRight)
        for _, barra in ipairs(barrasDeAcao()) do
            barra:setImageSource('')
        end
        local trava = root:recursiveGetChildById('lockPanel')
        if trava then
            trava:setImageSource('')
            trava:setBorderWidthTop(0)
        end
    else
        acoes:addAnchor(AnchorLeft, 'bottomSplitter', AnchorLeft)
        acoes:addAnchor(AnchorRight, 'bottomSplitter', AnchorRight)
        acoes:addAnchor(AnchorTop, 'gameBottomStatsBarPanel', AnchorBottom)
        acoes:setMarginBottom(0)
        acoes:setMarginRight(12)
        cooldown:addAnchor(AnchorLeft, 'bottomSplitter', AnchorLeft)
        cooldown:addAnchor(AnchorRight, 'bottomSplitter', AnchorRight)
        cooldown:addAnchor(AnchorTop, 'gameBottomActionPanel', AnchorBottom)
        for _, barra in ipairs(barrasDeAcao()) do
            barra:setImageSource('/images/ui/actionbar/actionbar_background-light')
        end
        local trava = root:recursiveGetChildById('lockPanel')
        if trava then
            trava:setImageSource('/images/ui/actionbar/background-dark')
            trava:setBorderWidthTop(1)
        end
    end
    if modules.game_actionbar and modules.game_actionbar.updateVisibleWidgets then
        addEvent(modules.game_actionbar.updateVisibleWidgets)
    end
end

-- ------------------------------------------------------------------ chat

local function barraDeAbas()
    local bottom = modules.game_interface.getBottomPanel()
    local console = bottom and bottom:getChildById('consolePanel')
    return console and console:getChildById('consoleTabBar')
end

local function abasDoChat(fn)
    local tabBar = barraDeAbas()
    if not tabBar then
        return
    end
    for _, aba in ipairs(tabBar.tabs or {}) do
        local buffer = aba.tabPanel and aba.tabPanel:getChildById('consoleBuffer')
        if buffer then
            fn(buffer)
        end
    end
end

local function fundoDoChat(buffer)
    if ativo then
        buffer:setImageSource(IMG .. 'chat_fundo')
        buffer:setImageBorder(8)
    else
        buffer:setImageSource('/images/ui/3pixel_frame_borderimage')
        buffer:setImageBorder(4)
    end
end

local function layoutChat(estendido)
    local gi = modules.game_interface
    local bottom = gi.getBottomPanel()
    local console = bottom and bottom:getChildById('consolePanel')
    if not console then
        return
    end
    -- primeiro filho do console.otui: UIWidget sem id com a moldura do console
    local moldura = console:getChildByIndex(1)
    if moldura and moldura:getId() == 'consoleContentPanel' then
        moldura = nil
    end
    local arrastar = console:getChildById('extendedViewDraggable')
    local somenteLeitura = console:getChildById('readOnlyButton')
    local recarga = modules.game_cooldown and modules.game_cooldown.cooldownWindow
    local esquerdo = gi.getLeftPanel()
    if estendido then
        bottom:breakAnchors()
        bottom:addAnchor(AnchorLeft, 'parent', AnchorLeft)
        bottom:addAnchor(AnchorBottom, 'parent', AnchorBottom)
        bottom:setMarginLeft(MARGEM)
        bottom:setMarginBottom(MARGEM)
        -- a borda de redimensionamento guarda a largura antiga como maximo
        local bordaDireita = bottom:getChildById('rightResizeBorder')
        if bordaDireita then
            bordaDireita:setMaximum(900)
        end
        bottom:setSize({ width = LARGURA_CHAT, height = ALTURA_CHAT })
        bottom:setImageSource('')
        if moldura then
            moldura:setVisible(false)
        end
        if arrastar then
            arrastar:hide()
        end
        -- sem o botao de somente leitura (96 px) cabem as abas do chat
        if somenteLeitura then
            somenteLeitura:hide()
            local exiva = console:getChildById('exivaOption')
            if exiva then
                exiva:addAnchor(AnchorRight, 'parent', AnchorRight)
            end
        end
        -- icones de recarga dos grupos de tecnica: saem do chat e vao para cima da barra
        if recarga and not recarga:isDestroyed() then
            recarga:setParent(gi.getRootPanel())
            recarga:breakAnchors()
            recarga:addAnchor(AnchorBottom, 'gameBottomActionPanel', AnchorTop)
            recarga:addAnchor(AnchorLeft, 'gameBottomActionPanel', AnchorLeft)
            recarga:addAnchor(AnchorRight, 'gameBottomActionPanel', AnchorRight)
            recarga:setMarginBottom(2)
        end
        -- as janelas do painel esquerdo terminam acima do chat
        esquerdo:setMarginBottom(ALTURA_CHAT + MARGEM * 2)
    else
        bottom:setImageSource('/images/ui/background_dark')
        bottom:setMarginLeft(0)
        bottom:setMarginBottom(0)
        if moldura then
            moldura:setVisible(true)
        end
        if somenteLeitura then
            somenteLeitura:show()
            local exiva = console:getChildById('exivaOption')
            if exiva then
                exiva:addAnchor(AnchorRight, 'readOnlyButton', AnchorLeft)
            end
        end
        if recarga and not recarga:isDestroyed() then
            recarga:setParent(bottom)
            recarga:breakAnchors()
            recarga:addAnchor(AnchorTop, 'parent', AnchorTop)
            recarga:addAnchor(AnchorLeft, 'parent', AnchorLeft)
            recarga:addAnchor(AnchorRight, 'parent', AnchorRight)
            recarga:setMarginBottom(0)
        end
        esquerdo:setMarginBottom(0)
    end
    abasDoChat(fundoDoChat)
end

-- ------------------------------------------------------------------ geral

local function esconderBarrasOriginais(estendido)
    local gi = modules.game_interface
    local topo = gi.getGameTopStatsBar()
    local baixo = gi.getGameBottomStatsBar()
    local divisor = gi.getBottomSplitter()
    for _, w in ipairs({ topo, baixo, divisor }) do
        if w then
            w:setVisible(not estendido)
        end
    end
end

function aplicarLayout(estendido)
    if g_platform.isMobile() then
        return
    end
    estendido = estendido and true or false
    if estendido == ativo then
        if estendido then
            aplicarIcones()
        end
        return
    end
    ativo = estendido
    if not hud then
        hud = g_ui.createWidget('HudPainel', modules.game_interface.getRootPanel())
        hud:setId('hudPainel')
        hud:addAnchor(AnchorBottom, 'parent', AnchorBottom)
        hud:addAnchor(AnchorHorizontalCenter, 'parent', AnchorHorizontalCenter)
        hud:setMarginBottom(MARGEM)
        hud:setWidth(SLOTS_BARRA * LARGURA_SLOT + 40)
    end
    hud:setVisible(estendido)
    esconderBarrasOriginais(estendido)
    layoutTopo(estendido)
    layoutAcoes(estendido)
    layoutChat(estendido)
    if estendido then
        aplicarIcones()
        ordenarBotoes()
        ajustarLarguraTopo()
        -- as barras dependem da largura final do HUD, calculada no proximo quadro
        addEvent(atualizarBarras)
    else
        restaurarBotoes()
    end
end

function estaAtivo()
    return ativo
end

local function aoMudarAba(tabBar, aba)
    if aba and aba.tabPanel then
        local buffer = aba.tabPanel:getChildById('consoleBuffer')
        if buffer then
            fundoDoChat(buffer)
        end
    end
end

local function aoIniciarJogo()
    -- os botoes do topo sao criados pelos modulos em momentos diferentes
    -- (alguns so depois do login); reaplica os icones algumas vezes
    if eventoIcones then
        removeEvent(eventoIcones)
    end
    local vezes = 0
    local function repetir()
        vezes = vezes + 1
        if ativo and modules.game_mainpanel and modules.game_mainpanel.toggleExtendedViewButtons then
            -- botoes criados depois da troca de modo ficaram no painel principal (escondido)
            modules.game_mainpanel.toggleExtendedViewButtons(true)
        end
        aplicarIcones()
        ordenarBotoes()
        esconderOutrosDoTopo()
        ajustarLarguraTopo()
        atualizarBarras()
        if vezes < 4 then
            eventoIcones = scheduleEvent(repetir, 700)
        else
            eventoIcones = nil
        end
    end
    eventoIcones = scheduleEvent(repetir, 200)
end

function init()
    g_ui.importStyle('game_hud')
    connect(LocalPlayer, {
        onHealthChange = atualizarBarras,
        onManaChange = atualizarBarras,
        onLevelChange = atualizarBarras,
        onExperienceChange = atualizarBarras
    })
    connect(g_game, { onGameStart = aoIniciarJogo })
    local tabBar = barraDeAbas()
    if tabBar then
        connect(tabBar, { onTabChange = aoMudarAba })
    end
    if g_game.isOnline() then
        aoIniciarJogo()
        aplicarLayout(modules.game_interface.currentViewMode == 2)
    end
end

function terminate()
    disconnect(LocalPlayer, {
        onHealthChange = atualizarBarras,
        onManaChange = atualizarBarras,
        onLevelChange = atualizarBarras,
        onExperienceChange = atualizarBarras
    })
    disconnect(g_game, { onGameStart = aoIniciarJogo })
    local tabBar = barraDeAbas()
    if tabBar then
        disconnect(tabBar, { onTabChange = aoMudarAba })
    end
    if eventoIcones then
        removeEvent(eventoIcones)
        eventoIcones = nil
    end
    if ativo then
        aplicarLayout(false)
    end
    if hud then
        hud:destroy()
        hud = nil
    end
end
