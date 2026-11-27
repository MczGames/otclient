-- Janela de passivas, toda pela interface (sem comandos de chat). Servidor: datapack lib/core/passivas.lua, opcode estendido 123.
-- Cliente -> servidor (texto): "pedir" (abre a janela) e "equipar <espaco> <indice>" (indice 1..15; 0 esvazia o espaco).
-- Servidor -> cliente (JSON): acao "abrir" (mostra a janela) ou "estado" (so atualiza: depois de equipar, ao subir de nivel),
-- com nivel, slots, passivas, recarga (s ate poder trocar de novo) e, em resposta a equipar, ok e msg.
-- Abre pelo menu Personagem do topo, pelo botao Passivas da janela de Habilidades ou por Ctrl+Shift+P.
local OPCODE = 123 -- 121 e da entrada de instancia (game_instancias)
local ICONES = '/images/passivas/'

local janela, lista, botao = nil, nil, nil
local dados = nil
local recargaAte = 0
local relogio = nil
local esperandoAbrir = false

local function enviar(texto)
    local protocolo = g_game.getProtocolGame()
    if g_game.isOnline() and protocolo then
        protocolo:sendExtendedOpcode(OPCODE, texto)
    end
end

local function porIndice(i)
    for _, p in ipairs(dados.passivas) do
        if p.i == i then
            return p
        end
    end
    return nil
end

local function emRecarga()
    return recargaAte > os.time()
end

-- Pode colocar uma passiva no espaco? (trocar uma passiva ja equipada tem recarga; espaco vazio nao)
local function podeUsarEspaco(s)
    return (dados.slots[s] or 0) == 0 or not emRecarga()
end

local function equipar(s, i)
    if janela then
        janela:getChildById('mensagem'):setText(tr('Equipando...'))
        janela:getChildById('mensagem'):setColor('#9fa6b2')
    end
    enviar('equipar ' .. s .. ' ' .. i)
end

local function atualizarRecarga()
    if not janela or not dados then
        return
    end
    local rotulo = janela:getChildById('recarga')
    local falta = recargaAte - os.time()
    if falta > 0 then
        rotulo:setText(tr('Troca de passiva liberada em %d s', falta))
        rotulo:setColor('#e0a040')
    else
        rotulo:setText(tr('Troca de passiva liberada'))
        rotulo:setColor('#7fd18a')
    end
end

local function atualizar()
    if not janela or not dados then
        return
    end
    for s = 1, 2 do
        local w = janela:getChildById('equipada' .. s)
        local idx = dados.slots[s] or 0
        local p = idx > 0 and porIndice(idx) or nil
        w:getChildById('espaco'):setText(tr('Espaco %d', s))
        local icone = w:getChildById('icone')
        if p then
            icone:setImageSource(ICONES .. p.id)
            icone:setOpacity(1)
            icone:setTooltip(p.desc)
            w:getChildById('texto'):setText(p.nome)
            w:getChildById('texto'):setColor('#f2c14e')
            w:setBorderColor('#f2c14e')
        else
            icone:setImageSource('')
            icone:setTooltip('')
            w:getChildById('texto'):setText(tr('vazio'))
            w:getChildById('texto'):setColor('#7a7f88')
            w:setBorderColor('#6a5cff80')
        end
        local tirar = w:getChildById('tirar')
        tirar:setEnabled(p ~= nil)
        tirar.onClick = function()
            equipar(s, 0)
        end
    end
    atualizarRecarga()

    lista:destroyChildren()
    for _, p in ipairs(dados.passivas) do
        local linha = g_ui.createWidget('PassivaLinha', lista)
        local equipadaEm = (dados.slots[1] == p.i and 1) or (dados.slots[2] == p.i and 2) or nil
        linha:setOn(equipadaEm ~= nil)
        local icone = linha:getChildById('icone')
        icone:setImageSource(ICONES .. p.id)
        icone:setOpacity(p.liberada and 1 or 0.35)
        local nome = linha:getChildById('nome')
        nome:setText(p.nome)
        nome:setColor(p.liberada and (equipadaEm and '#f2c14e' or '#ffffff') or '#7a7f88')
        local nivel
        if not p.liberada then
            nivel = tr('(libera no nivel %d)', p.nivel)
        elseif equipadaEm then
            nivel = tr('(equipada no espaco %d)', equipadaEm)
        else
            nivel = tr('(nivel %d)', p.nivel)
        end
        linha:getChildById('nivel'):setText(nivel)
        linha:getChildById('desc'):setText(p.desc)
        for s = 1, 2 do
            local b = linha:getChildById('slot' .. s)
            b:setEnabled(p.liberada and equipadaEm == nil and podeUsarEspaco(s))
            b.onClick = function()
                equipar(s, p.i)
            end
        end
        -- dois cliques: primeiro espaco vazio (ou o 1, se os dois estiverem ocupados e a troca liberada)
        linha.onDoubleClick = function()
            if not p.liberada or equipadaEm then
                return true
            end
            local alvo = ((dados.slots[1] or 0) == 0 and 1) or ((dados.slots[2] or 0) == 0 and 2) or 1
            if podeUsarEspaco(alvo) then
                equipar(alvo, p.i)
            end
            return true
        end
    end
end

local function pararRelogio()
    if relogio then
        removeEvent(relogio)
        relogio = nil
    end
end

local function iniciarRelogio()
    pararRelogio()
    relogio = cycleEvent(function()
        if not janela or not janela:isVisible() then
            return
        end
        local antes = janela.recargaAtiva
        atualizarRecarga()
        local agora = emRecarga()
        janela.recargaAtiva = agora
        if antes and not agora then
            atualizar() -- recarga acabou: libera os botoes
        end
    end, 1000)
end

local function aoReceber(protocolo, opcode, d)
    if type(d) ~= 'table' or (d.acao ~= 'abrir' and d.acao ~= 'estado') then
        return
    end
    dados = d
    dados.slots = dados.slots or {}
    recargaAte = os.time() + (tonumber(d.recarga) or 0)
    janela.recargaAtiva = emRecarga()
    atualizar()
    if d.msg and d.msg ~= '' then
        local m = janela:getChildById('mensagem')
        m:setText(d.msg)
        m:setColor(d.ok and '#7fd18a' or '#e05a4a')
    end
    if d.acao == 'abrir' or esperandoAbrir then
        esperandoAbrir = false
        janela:getChildById('mensagem'):setText('')
        janela:show()
        janela:raise()
        janela:focus()
        iniciarRelogio()
        if botao then
            botao:setOn(true)
        end
    end
end

function fechar()
    esperandoAbrir = false
    pararRelogio()
    if janela then
        janela:hide()
    end
    if botao then
        botao:setOn(false)
    end
end

function abrir()
    if not g_game.isOnline() then
        return
    end
    esperandoAbrir = true
    enviar('pedir')
end

function alternar()
    if janela and janela:isVisible() then
        fechar()
    else
        abrir()
    end
end

local function aoMudarNivel(jogador, nivel)
    -- onLevelChange tambem dispara com a % do nivel; so pede de novo quando o nivel muda
    if dados and nivel ~= dados.nivel and janela and janela:isVisible() then
        dados.nivel = nivel
        enviar('pedir') -- novas passivas podem ter liberado
    end
end

function init()
    janela = g_ui.displayUI('passivas')
    janela:hide()
    lista = janela:getChildById('lista')
    ProtocolGame.registerExtendedJSONOpcode(OPCODE, aoReceber)
    botao = modules.client_topmenu.addRightGameToggleButton('passivasButton', tr('Passivas') .. ' (Ctrl+Shift+P)',
        '/images/options/button_skills', alternar)
    g_keyboard.bindKeyDown('Ctrl+Shift+P', alternar)
    connect(g_game, { onGameEnd = fechar })
    connect(LocalPlayer, { onLevelChange = aoMudarNivel })
end

function terminate()
    disconnect(g_game, { onGameEnd = fechar })
    disconnect(LocalPlayer, { onLevelChange = aoMudarNivel })
    pararRelogio()
    g_keyboard.unbindKeyDown('Ctrl+Shift+P')
    ProtocolGame.unregisterExtendedJSONOpcode(OPCODE)
    if botao then
        botao:destroy()
        botao = nil
    end
    if janela then
        janela:destroy()
        janela = nil
    end
end
