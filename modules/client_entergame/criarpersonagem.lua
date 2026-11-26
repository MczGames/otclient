-- Arquivo em Latin-1: a fonte do cliente desenha Latin-1 (UTF-8 sai embaralhado).
-- Janela "Criar personagem", aberta pela lista de personagens.
--
-- O jogador escolhe o visual (arte animada + descrição), o sexo e o nome. A classe e a técnica
-- inata NÃO são escolhidas aqui: o personagem nasce sem classe e desperta no Colégio no nível 8
-- (documento de design v1.04).
--
-- O pedido vai por HTTP ao serviço de contas (ver docs/protocolo.md, "Criar personagem"):
--   POST <url>  {"conta": "...", "senha": "...", "nome": "...", "sexo": 0|1, "looktype": N}
--   resposta    {"ok": true}  ou  {"ok": false, "erro": "texto para o jogador"}
-- URL: Services.criarPersonagem, ou http://<host do login>:8089/criar-personagem.

CriarPersonagem = {}

local PORTA_PADRAO = 8089

-- Visuais que o servidor aceita na criação (datapack/xml/outfits.xml). Para incluir outro,
-- basta acrescentar uma linha aqui e no outfits.xml do servidor.
local VISUAIS = {
    {
        looktype = 142,
        nome = 'Lutador de Rua',
        descricao = 'Cresceu nas ruas de Sendai resolvendo as coisas no braço. Não teme briga, '
            .. 'protege os amigos e aprende rápido apanhando. Dizem que já viu coisas estranhas '
            .. 'nos becos à noite, e que foi isso que o trouxe até o Colégio.',
        cores = { head = 78, body = 94, legs = 114, feet = 76 }
    },
    {
        looktype = 143,
        nome = 'Estudante do Oculto',
        descricao = 'Passou a infância lendo sobre maldições e lendas antigas. Calmo e observador, '
            .. 'prefere entender o inimigo antes de agir. Sente a energia amaldiçoada desde '
            .. 'pequeno e agora quer aprender a controlá-la.',
        cores = { head = 0, body = 114, legs = 57, feet = 95 }
    }
}

local AVISO = 'A classe e a técnica inata são escolhidas mais tarde, no despertar com o diretor '
    .. 'do Colégio (nível 8). Antes disso, o tutorial deixa você provar cada estilo de luta.'

local janela = nil
local grupoSexo = nil
local indiceVisual = 1
local direcao = 2 -- sul
local eventoGiro = nil
local eventoPasso = nil
local quadro = 0 -- 0 parado, 1..4 andar
local pedidoAtivo = false

local function urlServico()
    if Services and Services.criarPersonagem then
        return Services.criarPersonagem
    end
    local host = (G and G.host and G.host ~= '') and G.host or '127.0.0.1'
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
    local v = VISUAIS[indiceVisual]
    janela.painelArte.arte:setImageSource(string.format('/images/criar_personagem/%d_%s_%d',
        v.looktype, LETRAS_DIRECAO[direcao], quadro))
end

local function atualizarArte()
    if not janela then
        return
    end
    local v = VISUAIS[indiceVisual]
    desenharQuadro()
    janela.painelArte.nomeVisual:setText(v.nome)
    janela.painelArte.contadorVisual:setText(string.format('%d de %d', indiceVisual, #VISUAIS))
    janela.painelDescricao.descricao:setText(v.descricao)
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
    janela:recursiveGetChildById('aviso'):setText(AVISO)

    grupoSexo = UIRadioGroup.create()
    grupoSexo:addWidget(janela.sexoMasculino)
    grupoSexo:addWidget(janela.sexoFeminino)
    grupoSexo:selectWidget(janela.sexoMasculino)

    indiceVisual = 1
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
    if janela then
        janela:destroy()
        janela = nil
    end
    pedidoAtivo = false
end

function CriarPersonagem.trocarVisual(passo)
    indiceVisual = ((indiceVisual - 1 + passo) % #VISUAIS) + 1
    atualizarArte()
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
        looktype = VISUAIS[indiceVisual].looktype
    }, aoResponder)
end

function CriarPersonagem.terminar()
    CriarPersonagem.fechar()
end
