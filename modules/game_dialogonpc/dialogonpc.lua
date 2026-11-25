-- Conversa com NPC por janela. Clicar no NPC (game_interface chama modules.game_dialogonpc.falar) manda "falar <id>" no
-- opcode estendido 124; o servidor (datapack lib/core/dialogo_npc.lua) responde em JSON com o texto do NPC e as opcoes.
-- Clicar numa opcao manda "escolher <n>"; fechar a janela manda "fechar". Teclas 1 a 9 escolhem a opcao. Protocolo: docs/protocolo.md.
local OPCODE = 124
local DISTANCIA = 4 -- igual a Balanceamento.npcs.dialogo.distancia_max do servidor

local janela = nil
local npcAberto = nil
local totalOpcoes = 0

local function enviar(texto)
    local protocolo = g_game.getProtocolGame()
    if protocolo then
        protocolo:sendExtendedOpcode(OPCODE, texto)
    end
end

local function esconder()
    npcAberto = nil
    if janela then
        janela:hide()
    end
end

-- Fecha a janela e avisa o servidor (Escape, botao de fechar, ao se afastar).
function fechar()
    if npcAberto then
        enviar('fechar')
    end
    esconder()
end

function escolher(n)
    if not npcAberto or n < 1 or n > totalOpcoes then
        return
    end
    enviar('escolher ' .. n)
end

-- Chamado pelo clique no NPC (game_interface). Devolve true se tratou o clique.
function falar(creature)
    if not g_game.isOnline() or not creature or not creature:isNpc() then
        return false
    end
    local jogador = g_game.getLocalPlayer()
    if not jogador then
        return false
    end
    local a, b = jogador:getPosition(), creature:getPosition()
    if a.z ~= b.z or math.max(math.abs(a.x - b.x), math.abs(a.y - b.y)) > DISTANCIA then
        modules.game_textmessage.displayFailureMessage(tr('Chegue mais perto para conversar.'))
        return true
    end
    enviar('falar ' .. creature:getId())
    return true
end

local function ajustarAltura()
    local texto = janela:recursiveGetChildById('texto')
    local cartao = janela:getChildById('cartao')
    cartao:setHeight(math.max(76, texto:getHeight() + 34))
    local opcoes = janela:getChildById('opcoes')
    local altura = cartao:getHeight() + 6 + totalOpcoes * 28
    janela:setHeight(altura + janela:getPaddingTop() + janela:getPaddingBottom() + 8)
    opcoes:setHeight(totalOpcoes * 28)
end

local function mostrar(d)
    npcAberto = d.npc
    local criatura = g_map.getCreatureById(d.npc)
    local retrato = janela:recursiveGetChildById('retrato')
    if criatura then
        retrato:setCreature(criatura)
    else
        retrato:setOutfit({ type = 0 })
    end
    janela:setText(d.nome or '')
    janela:recursiveGetChildById('nome'):setText(d.nome or '')
    janela:recursiveGetChildById('texto'):setText(d.texto or '')

    local opcoes = janela:getChildById('opcoes')
    opcoes:destroyChildren()
    totalOpcoes = 0
    for i, rotulo in ipairs(d.opcoes or {}) do
        local b = g_ui.createWidget('DialogoOpcao', opcoes)
        b:setText(i .. '. ' .. rotulo)
        b.onClick = function()
            escolher(i)
        end
        totalOpcoes = i
    end
    if not janela:isVisible() then
        janela:show()
        local tela = g_ui.getRootWidget():getSize()
        janela:setPosition({ x = math.floor((tela.width - janela:getWidth()) / 2), y = math.floor(tela.height * 0.55) })
    end
    janela:raise()
    janela:focus()
    -- a altura do texto so e conhecida depois do layout
    scheduleEvent(ajustarAltura, 1)
    ajustarAltura()
end

local function aoReceber(protocolo, opcode, d)
    if type(d) ~= 'table' then
        return
    end
    if d.acao == 'abrir' then
        mostrar(d)
    elseif d.acao == 'fechar' then
        esconder()
    end
end

local function aoTecla(widget, tecla)
    local n = tecla - KeyNumpad1 + 1
    if n < 1 or n > 9 then
        n = tecla - Key1 + 1
    end
    if n >= 1 and n <= 9 and n <= totalOpcoes then
        escolher(n)
        return true
    end
    return false
end

function init()
    janela = g_ui.displayUI('dialogonpc')
    janela:hide()
    janela.onKeyPress = function(w, tecla, mods)
        if mods == KeyboardNoModifier then
            return aoTecla(w, tecla)
        end
        return false
    end
    local botaoFechar = janela:recursiveGetChildById('closeButton')
    if botaoFechar then
        botaoFechar.onClick = fechar
    end
    ProtocolGame.registerExtendedJSONOpcode(OPCODE, aoReceber)
    connect(g_game, { onGameEnd = esconder })
end

function terminate()
    disconnect(g_game, { onGameEnd = esconder })
    ProtocolGame.unregisterExtendedJSONOpcode(OPCODE)
    if janela then
        janela:destroy()
        janela = nil
    end
end
