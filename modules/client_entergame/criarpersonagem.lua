-- Arquivo em Latin-1: a fonte do cliente desenha Latin-1 (UTF-8 sai embaralhado).
-- Janela "Criar personagem", aberta pela lista de personagens.
--
-- O jogador escolhe a classe (descrição do papel e arte animada da outfit inicial dela), o sexo e o nome.
-- Decisão do Robson em 26/11/2026: a classe é escolhida na criação (antes era no despertar, nível 8).
--
-- O pedido vai por HTTP ao serviço de contas (ver docs/protocolo.md, "Criar personagem"):
--   POST <url>  {"conta": "...", "senha": "...", "nome": "...", "sexo": 0|1, "looktype": N, "vocacao": N}
--   resposta    {"ok": true}  ou  {"ok": false, "erro": "texto para o jogador"}
-- URL: Services.criarPersonagem, ou http://<host do login>:8089/criar-personagem.

CriarPersonagem = {}

local PORTA_PADRAO = 8089

-- Classes escolhidas na criação (docs/classes-v2.md). Cada uma tem a sua outfit inicial exclusiva
-- (looktype): a arte da janela mostra essa outfit e o personagem nasce com ela.
-- Arte: data/images/criar_personagem/<looktype>_<direcao>_<quadro>.png (tools/assets/gerar_arte_criacao.py). O Restringido não aparece aqui
-- (decisão do Robson em 26/11/2026). vocacao = id em datapack/xml/vocations.xml.
-- Textos neutros (valem nas duas peles).
local CLASSES = {
    {
        id = 'lutador', vocacao = 1, nome = 'Lutador', looktype = 136, outfit = 'Lutador',
        descricao = 'Linha de frente. Luta com os punhos envoltos em energia, aguenta muito castigo e '
            .. 'encadeia combos até acertar o golpe crítico no tempo certo.',
        atributos = 'Vida: muito alta  |  Energia: média  |  Alcance: curto'
    },
    {
        id = 'combate', vocacao = 2, nome = 'Mestre das Armas', looktype = 141, outfit = 'Mestre das Armas',
        descricao = 'O atirador moderno. Usa armas de fogo de curta, média e longa distância com munição '
            .. 'amaldiçoada, e armas de haste que alcançam 2 quadros.',
        atributos = 'Vida: alta  |  Energia: média  |  Alcance: longo'
    },
    {
        id = 'tecnica', vocacao = 6, nome = 'Mestre das Técnicas', looktype = 128,
        outfit = 'Mestre das Técnicas',
        descricao = 'Conjurador. Tem a maior reserva de energia e o maior dano de técnica do jogo, '
            .. 'mas pouca vida: precisa manter o inimigo longe.',
        atributos = 'Vida: baixa  |  Energia: muito alta  |  Alcance: longo'
    },
    {
        id = 'controlador', vocacao = 3, nome = 'Controlador', looktype = 140, outfit = 'Controlador',
        descricao = 'Invocador. Cria e comanda entidades que lutam por ele e domina o campo de batalha '
            .. 'enquanto fica na retaguarda.',
        atributos = 'Vida: baixa  |  Energia: alta  |  Alcance: médio'
    },
    {
        id = 'suporte', vocacao = 4, nome = 'Suporte', looktype = 145, outfit = 'Suporte',
        descricao = 'O pilar do grupo. Cura os aliados, ergue barreiras, fortalece o time e enfraquece '
            .. 'as maldições inimigas.',
        atributos = 'Vida: baixa  |  Energia: alta  |  Alcance: médio'
    }
}

local janela = nil
local grupoSexo = nil
local grupoClasse = nil
local indiceClasse = 1
local direcao = 2 -- sul
local eventoGiro = nil
local eventoPasso = nil
local quadro = 0 -- 0 parado, 1..4 andar
local pedidoAtivo = false

local function urlServico()
    if Services and Services.criarPersonagem then
        return Services.criarPersonagem
    end
    -- Com login HTTP o G.host e uma URL inteira (ex.: http://127.0.0.1:8088/login): fica so o nome da maquina.
    local host = (G and G.host and G.host ~= '') and G.host or '127.0.0.1'
    host = host:gsub('^%a+://', ''):match('^([^/:]+)') or '127.0.0.1'
    return string.format('http://%s:%d/criar-personagem', host, PORTA_PADRAO)
end

local function mostrarMensagem(texto, cor)
    if not janela then
        return
    end
    janela.mensagem:setColor(cor or '#ff7070')
    janela.mensagem:setText(texto or '')
end

local function sexoEscolhido()
    local w = grupoSexo and grupoSexo:getSelectedWidget()
    if w and w:getId() == 'sexoFeminino' then
        return 0
    end
    return 1
end

local LETRAS_DIRECAO = { [0] = 'n', [1] = 'l', [2] = 's', [3] = 'o' }

local function desenharQuadro()
    if not janela then
        return
    end
    local v = CLASSES[indiceClasse]
    janela.painelArte.arte:setImageSource(string.format('/images/criar_personagem/%d_%s_%d',
        v.looktype, LETRAS_DIRECAO[direcao], quadro))
end

local function atualizarClasse()
    if not janela then
        return
    end
    local c = CLASSES[indiceClasse]
    janela.painelDescricao.tituloClasse:setText(c.nome)
    janela.painelDescricao.descricao:setText(c.descricao)
    janela.painelDescricao.atributos:setText(c.atributos)
end

local function atualizarArte()
    if not janela then
        return
    end
    desenharQuadro()
    janela.painelArte.nomeVisual:setText(CLASSES[indiceClasse].outfit)
end

-- Validação local (o servidor valida de novo): 3 a 20 letras, espaços simples entre palavras,
-- cada palavra começando com maiúscula.
local function validarNome(nome)
    if #nome < 3 or #nome > 20 then
        return false, 'O nome precisa ter de 3 a 20 letras.'
    end
    if not nome:match("^[A-Za-z ]+$") then
        return false, 'Use só letras (sem acento, número ou símbolo).'
    end
    if nome:find('  ') or nome:sub(1, 1) == ' ' or nome:sub(-1) == ' ' then
        return false, 'Não use espaços duplos nem no começo ou no fim.'
    end
    for palavra in nome:gmatch('%S+') do
        if not palavra:sub(1, 1):match('%u') then
            return false, 'Cada palavra do nome começa com letra maiúscula.'
        end
    end
    return true
end

local function aoResponder(dados, erro)
    pedidoAtivo = false
    if not janela then
        return
    end
    janela.botaoCriar:setEnabled(true)

    if erro then
        mostrarMensagem('Servidor de contas fora do ar. Tente mais tarde.')
        g_logger.warning('[CriarPersonagem] erro HTTP: ' .. tostring(erro))
        return
    end

    local resposta = dados
    if type(resposta) ~= 'table' then
        mostrarMensagem('Resposta inválida do servidor de contas.')
        g_logger.warning('[CriarPersonagem] resposta invalida: ' .. tostring(dados))
        return
    end

    if not resposta.ok then
        mostrarMensagem(resposta.erro or 'O servidor recusou o pedido.')
        return
    end

    local nome = janela.campoNome:getText()
    CriarPersonagem.fechar()
    g_settings.set('last-used-character', nome)
    -- Refaz o login para a lista trazer o personagem novo.
    if CharacterList and CharacterList.isVisible() then
        CharacterList.hide(false)
    end
    if EnterGame and EnterGame.relogar then
        EnterGame.relogar()
    end
end

function CriarPersonagem.abrir()
    if janela then
        janela:raise()
        janela:focus()
        return
    end
    janela = g_ui.createWidget('CriarPersonagemWindow', rootWidget)

    grupoSexo = UIRadioGroup.create()
    grupoSexo:addWidget(janela.sexoMasculino)
    grupoSexo:addWidget(janela.sexoFeminino)
    grupoSexo:selectWidget(janela.sexoMasculino)

    grupoClasse = UIRadioGroup.create()
    for i, c in ipairs(CLASSES) do
        local botao = g_ui.createWidget('Button', janela.botoesClasse)
        botao:setText(c.nome)
        botao:setFont('verdana-11px-rounded')
        botao.indiceClasse = i
        grupoClasse:addWidget(botao)
    end
    grupoClasse.onSelectionChange = function(_, selecionado)
        if selecionado then
            indiceClasse = selecionado.indiceClasse
            atualizarClasse()
            atualizarArte()
        end
        -- destaque da classe escolhida (o estado "checked" do botao quase nao aparece)
        for _, botao in ipairs(janela.botoesClasse:getChildren()) do
            botao:setColor(botao == selecionado and '#ffd75e' or '#dfdfdf')
        end
    end
    indiceClasse = 1
    grupoClasse:selectWidget(janela.botoesClasse:getChildByIndex(1))
    atualizarClasse()

    direcao = 2
    atualizarArte()
    mostrarMensagem('')

    -- O boneco anda no lugar e vira sozinho a cada 2,5 s, para mostrar todos os lados da arte.
    quadro = 1
    eventoPasso = cycleEvent(function()
        quadro = (quadro % 4) + 1
        desenharQuadro()
    end, 180)
    eventoGiro = cycleEvent(function()
        CriarPersonagem.girar()
    end, 2500)

    janela:show()
    janela:raise()
    janela:focus()
    janela.campoNome:focus()
end

function CriarPersonagem.fechar()
    if eventoGiro then
        removeEvent(eventoGiro)
        eventoGiro = nil
    end
    if eventoPasso then
        removeEvent(eventoPasso)
        eventoPasso = nil
    end
    if grupoSexo then
        grupoSexo:destroy()
        grupoSexo = nil
    end
    if grupoClasse then
        grupoClasse:destroy()
        grupoClasse = nil
    end
    if janela then
        janela:destroy()
        janela = nil
    end
    pedidoAtivo = false
end

function CriarPersonagem.girar()
    if not janela then
        return
    end
    -- norte(0) -> leste(1) -> sul(2) -> oeste(3)
    direcao = (direcao + 1) % 4
    desenharQuadro()
end

function CriarPersonagem.confirmar()
    if not janela or pedidoAtivo then
        return
    end
    local nome = janela.campoNome:getText()
    local valido, motivo = validarNome(nome)
    if not valido then
        mostrarMensagem(motivo)
        return
    end
    if not G or not G.account or G.account == '' then
        mostrarMensagem('Entre na conta antes de criar um personagem.')
        return
    end

    pedidoAtivo = true
    janela.botaoCriar:setEnabled(false)
    mostrarMensagem('Criando o personagem...', '#c0c0c0')

    HTTP.postJSON(urlServico(), {
        conta = G.account,
        senha = G.password,
        nome = nome,
        sexo = sexoEscolhido(),
        looktype = CLASSES[indiceClasse].looktype,
        vocacao = CLASSES[indiceClasse].vocacao
    }, aoResponder)
end

function CriarPersonagem.terminar()
    CriarPersonagem.fechar()
end
