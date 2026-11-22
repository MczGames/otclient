-- Janela de passivas: o servidor (datapack lib/core/passivas.lua) envia a lista pelo opcode estendido 121 quando o jogador
-- digita !passivas ou clica no botao do menu (atalho Ctrl+Shift+P); equipar e remover usam o comando !passiva <espaco> <id> (0 remove).
local OPCODE = 121

local janela, lista, botao = nil, nil, nil
local dados = nil

local function nomePorIndice(i)
    for _, p in ipairs(dados.passivas) do
        if p.i == i then
            return p.nome
        end
    end
    return nil
end

local function atualizar()
    if not janela or not dados then
        return
    end
    for s = 1, 2 do
        local w = janela:getChildById('equipada' .. s)
        local idx = dados.slots[s] or 0
        local nome = idx > 0 and nomePorIndice(idx) or nil
        w:getChildById('texto'):setText(tr('Espaco %d: %s', s, nome or tr('vazio')))
        local tirar = w:getChildById('tirar')
        tirar:setEnabled(nome ~= nil)
        tirar.onClick = function()
            g_game.talk('!passiva ' .. s .. ' 0')
        end
    end
    lista:destroyChildren()
    for _, p in ipairs(dados.passivas) do
        local linha = g_ui.createWidget('PassivaLinha', lista)
        local equipadaEm = (dados.slots[1] == p.i and 1) or (dados.slots[2] == p.i and 2) or nil
        local nome = linha:getChildById('nome')
        nome:setText(p.nome)
        nome:setColor(p.liberada and (equipadaEm and '#ffd27a' or '#ffffff') or '#7a7f88')
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
            b:setEnabled(p.liberada and equipadaEm == nil)
            b.onClick = function()
                g_game.talk('!passiva ' .. s .. ' ' .. p.id)
            end
        end
    end
end

local function aoReceber(protocolo, opcode, d)
    if type(d) ~= 'table' or d.acao ~= 'abrir' then
        return
    end
    dados = d
    atualizar()
    janela:show()
    janela:raise()
    janela:focus()
    if botao then
        botao:setOn(true)
    end
end

function fechar()
    if janela then
        janela:hide()
    end
    if botao then
        botao:setOn(false)
    end
end

function alternar()
    if janela and janela:isVisible() then
        fechar()
    elseif g_game.isOnline() then
        g_game.talk('!passivas')
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
end

function terminate()
    disconnect(g_game, { onGameEnd = fechar })
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
