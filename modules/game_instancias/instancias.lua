-- Janela "Entrada de Instancia". O servidor (datapack/data-jjk/scripts/movements/porta_instancia.lua) abre esta janela pelo opcode
-- estendido 121 (JSON) quando o jogador pisa ou usa uma porta de instancia, e reenvia a lista em "atualizar". O jogador escolhe uma
-- copia e "Entrar" chama /instanciaentrar <masmorra> <n>. O que existe DENTRO da instancia e do servidor (lib/core/masmorra.lua).
-- Protocolo: docs/protocolo.md.
local OPCODE = 121
local ATUALIZAR_MS = 4000

local janela, lista = nil, nil
local dados = nil          -- ultimo JSON recebido (acao, masmorra, nome, criatura, outfit, nivel, seu_nivel, jogadores_area, instancias)
local selecionada = nil    -- numero (n) da copia selecionada
local aguardando = false   -- pediu para entrar e espera: se o servidor recusar, reenvia "atualizar" e a janela volta
local relogio = nil

local ESTADOS = {
    livre = { 'Sem jogadores', '#9fa6b2' },
    ativa = { nil, '#7fe39b' },
    lotada = { nil, '#ff7a7a' },
    concluida = { 'Concluida', '#9fa6b2' },
}

local function podeEntrar()
    if not dados or not selecionada then
        return false
    end
    if dados.seu_nivel < dados.nivel then
        return false
    end
    for _, i in ipairs(dados.instancias) do
        if i.n == selecionada then
            return i.estado == 'livre' or i.estado == 'ativa'
        end
    end
    return false
end

local function atualizarBotao()
    janela:getChildById('botaoEntrar'):setEnabled(podeEntrar())
end

local function rotuloEstado(i)
    local e = ESTADOS[i.estado] or ESTADOS.livre
    local texto = e[1]
    if i.estado == 'ativa' then
        texto = i.jogadores .. (i.jogadores == 1 and ' jogador' or ' jogadores')
    elseif i.estado == 'lotada' then
        texto = 'Lotada (' .. i.jogadores .. '/' .. i.max .. ')'
    end
    return texto, e[2]
end

local function selecionar(n)
    selecionada = n
    for _, linha in ipairs(lista:getChildren()) do
        linha:setOn(linha.n == n)
    end
    atualizarBotao()
end

function entrar()
    if not g_game.isOnline() or not podeEntrar() then
        return
    end
    aguardando = true
    g_game.talk('/instanciaentrar ' .. dados.masmorra .. ' ' .. selecionada)
    fechar(true)
end

local function montarLista()
    lista:destroyChildren()
    local livres = 0
    for _, i in ipairs(dados.instancias) do
        local linha = g_ui.createWidget('InstanciaLinha', lista)
        linha.n = i.n
        linha:getChildById('nome'):setText('Instancia ' .. i.n)
        local texto, cor = rotuloEstado(i)
        local estado = linha:getChildById('estado')
        estado:setText(texto)
        estado:setColor(cor)
        linha.onClick = function() selecionar(i.n) end
        linha.onDoubleClick = function()
            selecionar(i.n)
            entrar()
        end
        if i.estado == 'livre' or i.estado == 'ativa' then
            livres = livres + 1
        end
    end
    janela:getChildById('contagem'):setText(livres .. ' disponiveis')
    -- mantem a selecao se a copia continua existindo
    local existe = false
    for _, i in ipairs(dados.instancias) do
        existe = existe or i.n == selecionada
    end
    selecionar(existe and selecionada or nil)
end

local function montarCartao()
    local criatura = janela:recursiveGetChildById('criatura')
    if dados.outfit and dados.outfit > 0 then
        criatura:setOutfit({ type = dados.outfit })
    else
        criatura:setOutfit({ type = 0 })
    end
    janela:recursiveGetChildById('nomeCriatura'):setText(dados.criatura)
    local nivel = janela:recursiveGetChildById('nivelMinimo')
    if dados.seu_nivel >= dados.nivel then
        nivel:setText('Nivel ' .. dados.nivel .. '+')
        nivel:setColor('#7fd0ff')
    else
        nivel:setText('Nivel ' .. dados.nivel .. '+ (voce: ' .. dados.seu_nivel .. ')')
        nivel:setColor('#ff7a7a')
    end
    local n = dados.jogadores_area
    janela:recursiveGetChildById('jogadoresArea'):setText(n .. (n == 1 and ' jogador nesta area' or ' jogadores nesta area'))
    janela:setText(dados.nome ~= '' and ('Entrada de Instancia: ' .. dados.nome) or 'Entrada de Instancia')
end

local function pararRelogio()
    if relogio then
        removeEvent(relogio)
        relogio = nil
    end
end

local function agendar()
    pararRelogio()
    relogio = scheduleEvent(function()
        relogio = nil
        if janela and janela:isVisible() and g_game.isOnline() then
            g_game.talk('/instanciaatualizar')
            agendar()
        end
    end, ATUALIZAR_MS)
end

function fechar(manterEstado)
    pararRelogio()
    if janela then
        janela:hide()
    end
    if not manterEstado then
        aguardando = false
    end
end

local function mostrar()
    montarCartao()
    montarLista()
    janela:show()
    janela:raise()
    janela:focus()
    agendar()
end

local function aoReceber(protocolo, opcode, d)
    if type(d) ~= 'table' or type(d.instancias) ~= 'table' then
        return
    end
    if d.acao == 'abrir' then
        dados = d
        selecionada = nil
        aguardando = false
        mostrar()
    elseif d.acao == 'atualizar' then
        dados = d
        if aguardando then -- o servidor recusou a entrada: a janela volta com a lista atual
            aguardando = false
            mostrar()
        elseif janela:isVisible() then
            montarCartao()
            montarLista()
        end
    end
end

function init()
    janela = g_ui.displayUI('instancias')
    janela:hide()
    lista = janela:getChildById('lista')
    ProtocolGame.registerExtendedJSONOpcode(OPCODE, aoReceber)
    connect(g_game, { onGameEnd = fechar })
end

function terminate()
    disconnect(g_game, { onGameEnd = fechar })
    ProtocolGame.unregisterExtendedJSONOpcode(OPCODE)
    pararRelogio()
    if janela then
        janela:destroy()
        janela = nil
    end
end
