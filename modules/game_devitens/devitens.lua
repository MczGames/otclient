-- Janela de desenvolvimento /itens: lista todos os itens do jogo como uma loja a 0 gold, com filtros e subfiltros.
-- O servidor (scripts/talkactions/itens_dev.lua) envia o catalogo pelo opcode estendido 120 quando o jogador digita /itens;
-- "Pegar" pede o item com o comando /itensdar. REMOVER ANTES DO LANCAMENTO (junto do script do servidor).
local OPCODE = 120

local CATEGORIAS = {
    { 'todos', 'Todos' }, { 'armas', 'Armas' }, { 'escudos', 'Escudos' }, { 'armaduras', 'Armaduras' },
    { 'calcas', 'Calcas' }, { 'botas', 'Botas' }, { 'capacetes', 'Capacetes' }, { 'colares', 'Colares' },
    { 'aneis', 'Aneis' }, { 'potions', 'Potions' }, { 'comidas', 'Comidas' }, { 'backpacks', 'Backpacks' },
    { 'outros', 'Outros' },
}
local GRAUS = {
    { '', 'Todos os graus' }, { 'treino', 'Treino' }, { 'reforcado', 'Reforcado' }, { 'g4', '4o grau' }, { 'g3', '3o grau' },
    { 'g2', '2o grau' }, { 'g1', '1o grau' }, { 'gesp', 'Grau especial' }, { 'rel1', 'Reliquia I' }, { 'rel2', 'Reliquia II' },
    { 'rel3', 'Reliquia III' }, { 'rel4', 'Reliquia IV' }, { 'rel5', 'Reliquia V' }, { 'lend', 'Lendaria' }, { 'comum', 'Comum' },
    { 'forte', 'Forte' },
}
local CLASSES = {
    { '', 'Todas as classes' }, { 'lutador', 'Lutador' }, { 'combate', 'Mestre das Armas' }, { 'tecnica', 'Mestre das Tecnicas' },
    { 'controlador', 'Controlador' }, { 'suporte', 'Suporte' }, { 'restringido', 'Restringido' },
}
local ORDENS = {
    { 'nome', 'Ordem: nome' }, { 'id', 'Ordem: id' }, { 'atk', 'Maior ataque' }, { 'df', 'Maior defesa' },
    { 'arm', 'Maior armadura' }, { 'peso', 'Menor peso' },
}
local MAX_LINHAS = 400

local janela, lista, botoesCategoria = nil, nil, {}
local itens = {}
local filtro = { cat = 'todos', tipo = '', grau = '', classe = '', ordem = 'nome' }
local carregando = false

local function combo(id)
    return janela:recursiveGetChildById(id)
end

local function preencherCombo(c, opcoes)
    carregando = true
    c:clearOptions()
    for _, o in ipairs(opcoes) do
        c:addOption(o[2], o[1])
    end
    c:setCurrentIndex(1)
    carregando = false
end

-- Tipos existentes na categoria atual (subfiltro "tipo").
local function atualizarTipos()
    local vistos, opcoes = {}, { { '', 'Todos os tipos' } }
    for _, it in ipairs(itens) do
        if (filtro.cat == 'todos' or it.cat == filtro.cat) and it.tipo ~= '' and not vistos[it.tipo] then
            vistos[it.tipo] = true
            opcoes[#opcoes + 1] = { it.tipo, it.tipo:gsub('_', ' ') }
        end
    end
    table.sort(opcoes, function(a, b)
        return a[1] == '' or (b[1] ~= '' and a[2] < b[2])
    end)
    preencherCombo(combo('tipo'), opcoes)
    filtro.tipo = ''
end

local function detalhe(it)
    local p = {}
    if it.atk > 0 then p[#p + 1] = 'Atq ' .. it.atk end
    if it.df > 0 then p[#p + 1] = 'Def ' .. it.df end
    if it.arm > 0 then p[#p + 1] = 'Arm ' .. it.arm end
    if it.peso > 0 then p[#p + 1] = string.format('%.1f oz', it.peso / 100) end
    p[#p + 1] = it.cat .. (it.tipo ~= '' and (' / ' .. it.tipo:gsub('_', ' ')) or '')
    if it.grau ~= '' then p[#p + 1] = it.grau end
    if it.classe ~= '' then p[#p + 1] = it.classe end
    p[#p + 1] = 'id ' .. it.id
    return table.concat(p, '  |  ')
end

local function quantidade()
    local q = tonumber(janela:getChildById('qtd'):getText()) or 1
    return math.max(1, math.min(100, math.floor(q)))
end

local function pegar(it)
    if not g_game.isOnline() then
        return
    end
    g_game.talk('/itensdar ' .. it.id .. ' ' .. quantidade())
end

local function passa(it, busca)
    if filtro.cat ~= 'todos' and it.cat ~= filtro.cat then return false end
    if filtro.tipo ~= '' and it.tipo ~= filtro.tipo then return false end
    if filtro.grau ~= '' and it.grau ~= filtro.grau then return false end
    if filtro.classe ~= '' and it.classe ~= filtro.classe then return false end
    if busca ~= '' then
        local alvo = (it.nome .. ' ' .. it.id .. ' ' .. it.tipo .. ' ' .. it.grau .. ' ' .. it.classe):lower()
        for palavra in busca:gmatch('%S+') do
            if not alvo:find(palavra, 1, true) then return false end
        end
    end
    return true
end

function atualizar()
    if not janela then return end
    local busca = janela:recursiveGetChildById('busca'):getText():lower()
    local visiveis = {}
    for _, it in ipairs(itens) do
        if passa(it, busca) then
            visiveis[#visiveis + 1] = it
        end
    end
    local o = filtro.ordem
    table.sort(visiveis, function(a, b)
        if o == 'nome' then
            if a.nome ~= b.nome then return a.nome < b.nome end
        elseif o == 'peso' then
            if a.peso ~= b.peso then return a.peso < b.peso end
        elseif o ~= 'id' then
            if a[o] ~= b[o] then return a[o] > b[o] end
        end
        return a.id < b.id
    end)

    lista:destroyChildren()
    for i, it in ipairs(visiveis) do
        if i > MAX_LINHAS then break end
        local linha = g_ui.createWidget('DevItemLinha', lista)
        linha:getChildById('icone'):setItemId(it.id)
        linha:getChildById('nome'):setText(it.nome)
        linha:getChildById('detalhe'):setText(detalhe(it))
        linha:getChildById('pegar').onClick = function() pegar(it) end
        linha.onDoubleClick = function() pegar(it) end
    end
    janela:getChildById('contagem'):setText(#visiveis .. ' item(ns)' .. (#visiveis > MAX_LINHAS and (' (mostrando ' .. MAX_LINHAS .. ')') or ''))
end

function aoMudarFiltro()
    if carregando or not janela then return end
    local function valor(id, padrao)
        local c = combo(id)
        return c:getCurrentOption().data or padrao
    end
    filtro.tipo = valor('tipo', '')
    filtro.grau = valor('grau', '')
    filtro.classe = valor('classe', '')
    filtro.ordem = valor('ordem', 'nome')
    atualizar()
end

local function escolherCategoria(cat)
    filtro.cat = cat
    for c, b in pairs(botoesCategoria) do
        b:setOn(c == cat)
    end
    atualizarTipos()
    atualizar()
end

local function construirCategorias()
    local painel = janela:getChildById('categorias')
    painel:destroyChildren()
    botoesCategoria = {}
    for _, par in ipairs(CATEGORIAS) do
        local b = g_ui.createWidget('DevFiltroBotao', painel)
        b:setText(par[2])
        b.onClick = function() escolherCategoria(par[1]) end
        botoesCategoria[par[1]] = b
    end
end

local function abrir(dados)
    itens = dados.itens or {}
    for _, it in ipairs(itens) do
        it.nome = it.nome or ('item ' .. it.id)
    end
    preencherCombo(combo('grau'), GRAUS)
    preencherCombo(combo('classe'), CLASSES)
    preencherCombo(combo('ordem'), ORDENS)
    filtro = { cat = 'todos', tipo = '', grau = '', classe = '', ordem = 'nome' }
    janela:recursiveGetChildById('busca'):setText('')
    escolherCategoria('todos')
    janela:show()
    janela:raise()
    janela:focus()
end

local function aoReceber(protocolo, opcode, dados)
    if type(dados) == 'table' and dados.acao == 'abrir' then
        abrir(dados)
    end
end

function fechar()
    if janela then
        janela:hide()
    end
end

function init()
    janela = g_ui.displayUI('devitens')
    janela:hide()
    lista = janela:getChildById('lista')
    construirCategorias()
    ProtocolGame.registerExtendedJSONOpcode(OPCODE, aoReceber)
    connect(g_game, { onGameEnd = fechar })
end

function terminate()
    disconnect(g_game, { onGameEnd = fechar })
    ProtocolGame.unregisterExtendedJSONOpcode(OPCODE)
    if janela then
        janela:destroy()
        janela = nil
    end
end
