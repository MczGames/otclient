-- FusionTsu: clique longe no mapa (minimapa, mapa da Cyclopedia ou tela) e o personagem vai ate la, de qualquer distancia.
--
-- O motor do cliente corta o caminho em 127 passos e, nesta versao, nao continua sozinho depois do primeiro trecho; a busca
-- de caminho tambem desiste em trajetos muito longos. Aqui, em Lua (sem recompilar o cliente):
--   * guardamos o destino de cada player:autoWalk e, a cada ~120 passos andados, pedimos o resto do caminho de novo;
--   * se a busca falhar por ser longe demais, tentamos um ponto no meio do caminho e seguimos dali.
-- Andar com o teclado, clicar em outro lugar ou chegar ao destino cancela tudo.
-- Instalado no inicio de cada partida (WalkController:onGameStart), depois de todos os modulos carregados, para envolver o
-- aviso "There is no way." do game_textmessage (so aparece se nem o ponto do meio der caminho).

AndarLonge = {}

local TRECHO = 120          -- passos andados antes de pedir o proximo trecho (o motor anda no maximo 127 por pedido)
local TENTATIVAS_MEIO = 6   -- quantas vezes encurta o alvo pela metade quando a busca falha

local autoWalkOriginal = nil
local destino = nil         -- destino final pedido pelo jogador
local passos = 0            -- passos desde o ultimo pedido de trecho
local encurtar = 0          -- quantas vezes ja encurtou o alvo nesta tentativa
local alvoAtual = nil       -- ponto do meio pedido ao motor (quando a busca ate o destino falhou)
local pedindo = false       -- true enquanto esta lua chama o autoWalk original (nao e um clique novo)
local falhaOriginal = nil

local function limpar()
    destino, passos, encurtar, alvoAtual = nil, 0, 0, nil
end

local function pedir(player, alvo)
    pedindo = true
    local ok = autoWalkOriginal(player, alvo, false)
    pedindo = false
    passos = 0
    alvoAtual = alvo
    return ok
end

-- alvo no meio do caminho entre a posicao atual e o destino (encurta 1/2, 1/4...)
local function pontoNoMeio(pos, final, vezes)
    local f = 0.5 ^ vezes
    return { x = math.floor(pos.x + (final.x - pos.x) * f + 0.5), y = math.floor(pos.y + (final.y - pos.y) * f + 0.5),
             z = final.z }
end

local function onPositionChange(player, novaPos)
    if not destino or player ~= g_game.getLocalPlayer() then
        return
    end
    if novaPos.x == destino.x and novaPos.y == destino.y and novaPos.z == destino.z then
        limpar()
        return
    end
    if alvoAtual and novaPos.x == alvoAtual.x and novaPos.y == alvoAtual.y then -- chegou no ponto do meio: segue
        encurtar = 0
        pedir(player, destino)
        return
    end
    if novaPos.z ~= destino.z then -- desceu/subiu escada no caminho: para aqui
        limpar()
        return
    end
    if not player:isAutoWalking() then -- andou com o teclado ou o motor cancelou: esquece o destino
        limpar()
        return
    end
    passos = passos + 1
    if passos >= TRECHO then
        encurtar = 0
        pedir(player, destino)
    end
end

local function onAutoWalkFail(player, status)
    if destino and player:getPosition() and encurtar < TENTATIVAS_MEIO then
        encurtar = encurtar + 1
        local pos = player:getPosition()
        local meio = pontoNoMeio(pos, destino, encurtar)
        if Position.distance(pos, meio) >= 2 then
            pedir(player, meio)
            return
        end
    end
    limpar()
    if falhaOriginal then
        falhaOriginal(player, status)
    end
end

function AndarLonge.init()
    if autoWalkOriginal then
        return
    end
    autoWalkOriginal = LocalPlayer.autoWalk
    function LocalPlayer:autoWalk(alvo, retry)
        if not pedindo then
            limpar()
            if alvo then
                destino = { x = alvo.x, y = alvo.y, z = alvo.z }
            end
        end
        return autoWalkOriginal(self, alvo, retry or false)
    end
    falhaOriginal = LocalPlayer.onAutoWalkFail
    LocalPlayer.onAutoWalkFail = onAutoWalkFail
    connect(LocalPlayer, { onPositionChange = onPositionChange })
end

function AndarLonge.terminate()
    if not autoWalkOriginal then
        return
    end
    LocalPlayer.autoWalk = autoWalkOriginal
    LocalPlayer.onAutoWalkFail = falhaOriginal
    disconnect(LocalPlayer, { onPositionChange = onPositionChange })
    autoWalkOriginal, falhaOriginal = nil, nil
    limpar()
end
