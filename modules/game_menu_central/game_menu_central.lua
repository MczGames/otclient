-- FusionTsu: menu "Mais" no centro da tela. Icones grandes e coloridos (arte em images/, desenhada por
-- tools/assets/desenhar_icones_menu.py no repositorio do jogo) que abrem as janelas do jogo: estado, aparencia, magias,
-- missoes, amigos, mapa, bestiario, chefes, passivas, batalha, montarias, personagem e opcoes.
-- Abre pelo botao de tres barras no topo ou Ctrl+Shift+N; Esc ou clicar num icone fecha.
local IMG = '/modules/game_menu_central/images/'

local janela, botao = nil, nil

local function chamar(modulo, funcao, ...)
    local m = modules[modulo]
    if m and type(m[funcao]) == 'function' then
        local ok, erro = pcall(m[funcao], ...)
        if not ok then
            g_logger.warning('[menu central] ' .. modulo .. '.' .. funcao .. ': ' .. tostring(erro))
        end
        return ok
    end
    modules.game_textmessage.displayFailureMessage(tr('Essa janela ainda nao esta disponivel.'))
    return false
end

local ITENS = {
    { 'estado', tr('Estado'), function() chamar('game_skills', 'toggle') end },
    { 'aparencia', tr('Aparencia'), function() g_game.requestOutfit() end },
    { 'magias', tr('Magias'), function() chamar('game_spelllist', 'toggle') end },
    { 'missoes', tr('Missoes'), function() chamar('game_questlog', 'show') end },
    { 'amigos', tr('Amigos'), function() chamar('game_viplist', 'toggle') end },
    { 'mapa', tr('Mapa'), function() chamar('game_cyclopedia', 'show', 'map') end },
    { 'bestiario', tr('Bestiario'), function() chamar('game_cyclopedia', 'show', 'bestiary') end },
    { 'chefes', tr('Chefes'), function() chamar('game_cyclopedia', 'show', 'bosstiary') end },
    { 'passivas', tr('Passivas'), function() g_game.talk('!passivas') end },
    { 'batalha', tr('Batalha'), function() chamar('game_battle', 'toggle') end },
    { 'montarias', tr('Montarias'), function()
        g_game.requestOutfit()
        scheduleEvent(function() chamar('game_outfit', 'showMounts') end, 400)
    end },
    { 'personagem', tr('Personagem'), function() chamar('game_cyclopedia', 'show', 'character') end },
    { 'opcoes', tr('Opcoes'), function() chamar('client_options', 'show') end },
}

function fechar()
    if janela then
        janela:hide()
    end
    if botao then
        botao:setOn(false)
    end
end

function abrir()
    if not janela or not g_game.isOnline() then
        return
    end
    janela:show()
    janela:raise()
    janela:focus()
    if botao then
        botao:setOn(true)
    end
end

function alternar()
    if janela and janela:isVisible() then
        fechar()
    else
        abrir()
    end
end

local function montar()
    local grade = janela:getChildById('grade')
    grade:destroyChildren()
    for _, it in ipairs(ITENS) do
        local w = g_ui.createWidget('MenuCentralItem', grade)
        w:getChildById('icone'):setImageSource(IMG .. it[1])
        w:getChildById('nome'):setText(it[2])
        w.onClick = function()
            fechar()
            it[3]()
        end
    end
end

function init()
    janela = g_ui.displayUI('game_menu_central')
    janela:hide()
    montar()
    botao = modules.client_topmenu.addLeftGameToggleButton('menuCentralButton', tr('Mais') .. ' (Ctrl+Shift+N)',
        IMG .. 'botao_topo', alternar, true)
    g_keyboard.bindKeyDown('Ctrl+Shift+N', alternar)
    connect(g_game, { onGameEnd = fechar })
end

function terminate()
    disconnect(g_game, { onGameEnd = fechar })
    g_keyboard.unbindKeyDown('Ctrl+Shift+N')
    if botao then
        botao:destroy()
        botao = nil
    end
    if janela then
        janela:destroy()
        janela = nil
    end
end
