SpelllistSettings = {
    ['Default'] = {
        iconFile = '/images/game/spells/spell-icons-32x32',
        iconsForGameCooldown = '/images/game/spells/spell-icons-20x20',
        iconSize = {
            width = 32,
            height = 32
        },
        iconSizeCooldown = {
            width = 20,
            height = 22
        },
        spellListWidth = 210,
        spellWindowWidth = 550,
    } --[[,
['Custom'] =  {
  iconFile = '/images/game/spells/custom',
  iconSize = {width = 32, height = 32},
  spellOrder = {
    'Chain Lighting'
    ,'Chain Healing'
    ,'Divine Chain'
    ,'Berserk Chain'
    ,'Cheat death'
    ,'Brutal Charge'
    ,'Empower Summons'
    ,'Summon Doppelganger'
  }
}]]
}

-- check "/docs/generate_spell_data.py"
-- spells from canary
-- GERADO por tools/assets/gerar_spells_cliente.py (nao editar a mao): magias do projeto, sem dados do Tibia.
SpellInfo = {
    Default = {
        ["Arremesso Certeiro"] = {id = 9002, name = "Arremesso Certeiro", words = "tecn2", type = 'Instant', level = 1, mana = 25, soul = 0, maglevel = 0, icon = '', clientId = 55, group = {[1] = 3000}, needTarget = false, parameter = false, range = -1, exhaustion = 3000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica inata. Arremesso no alvo (alcance 5): dano de 12 a 22 + 0,8x o seu nível.", custo = "25 de energia"},
        ["Chuva de Ferro"] = {id = 9007, name = "Chuva de Ferro", words = "tecb2", type = 'Instant', level = 15, mana = 60, soul = 0, maglevel = 0, icon = '', clientId = 56, group = {[1] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica inata. Arremesso pesado no alvo (alcance 5) que também acerta em volta dele: dano de 35 a 60 + 1,6x o seu nível.", custo = "60 de energia"},
        ["Lâmina em Fio"] = {id = 9012, name = "Lâmina em Fio", words = "tecc2", type = 'Instant', level = 1, mana = 45, soul = 0, maglevel = 0, icon = '', clientId = 57, group = {[1] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica inata. Lâmina em linha à sua frente: dano de 25 a 40 + 1,2x o seu nível.", custo = "45 de energia"},
        ["Chamado das Sombras"] = {id = 9003, name = "Chamado das Sombras", words = "tecn3", type = 'Instant', level = 1, mana = 60, soul = 0, maglevel = 0, icon = '', clientId = 58, group = {[3] = 20000}, needTarget = false, parameter = false, range = -1, exhaustion = 20000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica inata. Chama uma sombra aliada que luta por você por 60 s (até 2 ao mesmo tempo).", custo = "60 de energia"},
        ["Coro de Sombras"] = {id = 9008, name = "Coro de Sombras", words = "tecb3", type = 'Instant', level = 15, mana = 120, soul = 0, maglevel = 0, icon = '', clientId = 59, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica inata. Chama 2 sombras aliadas por 60 s (até 4 ao mesmo tempo).", custo = "120 de energia"},
        ["Sentinela de Sombra"] = {id = 9013, name = "Sentinela de Sombra", words = "tecc3", type = 'Instant', level = 1, mana = 80, soul = 0, maglevel = 0, icon = '', clientId = 60, group = {[3] = 40000}, needTarget = false, parameter = false, range = -1, exhaustion = 40000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica inata. Chama uma sombra forte por 120 s (só uma ao mesmo tempo).", custo = "80 de energia"},
        ["Maré Baixa"] = {id = 9001, name = "Maré Baixa", words = "tecn1", type = 'Instant', level = 1, mana = 30, soul = 0, maglevel = 0, icon = '', clientId = 61, group = {[1] = 4000}, needTarget = false, parameter = false, range = -1, exhaustion = 4000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica inata. Golpe em área em volta de você: dano de 10 a 20 + 1x o seu nível.", custo = "30 de energia"},
        ["Vaga Funda"] = {id = 9006, name = "Vaga Funda", words = "tecb1", type = 'Instant', level = 15, mana = 70, soul = 0, maglevel = 0, icon = '', clientId = 62, group = {[1] = 8000}, needTarget = false, parameter = false, range = -1, exhaustion = 8000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica inata. Golpe forte em área em volta de você: dano de 40 a 70 + 2x o seu nível.", custo = "70 de energia"},
        ["Punho Veloz"] = {id = 9011, name = "Punho Veloz", words = "tecc1", type = 'Instant', level = 1, mana = 20, soul = 0, maglevel = 0, icon = '', clientId = 63, group = {[1] = 3000}, needTarget = false, parameter = false, range = -1, exhaustion = 3000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica inata. Golpe rápido em volta de você (3x3): dano de 8 a 16 + 0,8x o seu nível.", custo = "20 de energia"},
        ["Casco Firme"] = {id = 9004, name = "Casco Firme", words = "tecn4", type = 'Instant', level = 1, mana = 35, soul = 0, maglevel = 0, icon = '', clientId = 64, group = {[3] = 20000}, needTarget = false, parameter = false, range = -1, exhaustion = 20000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica inata. Escudo: +25 de defesa por 15 s.", custo = "35 de energia"},
        ["Fôlego Restaurador"] = {id = 9005, name = "Fôlego Restaurador", words = "tecn5", type = 'Instant', level = 1, mana = 25, soul = 0, maglevel = 0, icon = '', clientId = 65, group = {[3] = 2000}, needTarget = false, parameter = false, range = -1, exhaustion = 2000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica inata. Cura você: 15 a 25 + 0,6x o seu nível.", custo = "25 de energia"},
        ["Aura Restauradora"] = {id = 9015, name = "Aura Restauradora", words = "tecc5", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 66, group = {[3] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica inata. Cura você e os aliados em volta: 10 a 18 + 0,5x o seu nível.", custo = "40 de energia"},
        ["Disparo Concentrado"] = {id = 9016, name = "Disparo Concentrado", words = "tecn6", type = 'Instant', level = 1, mana = 45, soul = 0, maglevel = 0, icon = '', clientId = 67, group = {[1] = 3000}, needTarget = false, parameter = false, range = -1, exhaustion = 3000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica inata. Disparo de energia no alvo (alcance 5): dano de 22 a 38 + 1,4x o seu nível.", custo = "45 de energia"},
        ["Explosão de Energia"] = {id = 9017, name = "Explosão de Energia", words = "tecb6", type = 'Instant', level = 1, mana = 90, soul = 0, maglevel = 0, icon = '', clientId = 68, group = {[1] = 9000}, needTarget = false, parameter = false, range = -1, exhaustion = 9000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica inata. Explosão de energia em área grande em volta de você: dano de 30 a 50 + 1,6x o seu nível.", custo = "90 de energia"},
        ["Feixe de Energia"] = {id = 9018, name = "Feixe de Energia", words = "tecc6", type = 'Instant', level = 1, mana = 70, soul = 0, maglevel = 0, icon = '', clientId = 69, group = {[1] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica inata. Feixe de energia em linha à sua frente: dano de 35 a 55 + 1,8x o seu nível.", custo = "70 de energia"},
        ["Impacto Duplo"] = {id = 9041, name = "Impacto Duplo", words = "t1", type = 'Instant', level = 1, mana = 5, soul = 0, maglevel = 0, icon = '', clientId = 23, group = {[1] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 1. Golpe corpo a corpo no alvo: 110% do poder (+15% por nível da técnica); acerta de novo logo em seguida. No nível 5, escolha A (dano x1,3) ou B (paralisa 1 s). Sobe de nível com pontos (!subir 1).", custo = "5% da barra de energia"},
        ["Investida Curta"] = {id = 9042, name = "Investida Curta", words = "t2", type = 'Instant', level = 10, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 24, group = {[1] = 10000}, needTarget = false, parameter = false, range = -1, exhaustion = 10000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 2. Avança 3 sqm em linha e acerta quem estiver no caminho: 140% do poder (+15% por nível da técnica). No nível 5, escolha A (atravessa os inimigos) ou B (avança 5 sqm). Sobe de nível com pontos (!subir 2).", custo = "8% da barra de energia"},
        ["Sequência de Golpes"] = {id = 9043, name = "Sequência de Golpes", words = "t3", type = 'Instant', level = 25, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 25, group = {[1] = 18000}, needTarget = false, parameter = false, range = -1, exhaustion = 18000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 3. Sequência de 4 golpes no alvo, 90% do poder (+8% por nível da técnica) cada; abre a janela do golpe exato. No nível 5, escolha A (janela do golpe exato +0,8 s) ou B (último golpe em área). Sobe de nível com pontos (!subir 3).", custo = "12% da barra de energia"},
        ["Foco de Combate"] = {id = 9044, name = "Foco de Combate", words = "t4", type = 'Instant', level = 45, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 26, group = {[3] = 40000}, needTarget = false, parameter = false, range = -1, exhaustion = 40000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 4. Reforço por 8 s: cada golpe recupera 2x mais energia. No nível 5, escolha A (energia x3 por golpe) ou B (recarga da EP -10 s). Sobe de nível com pontos (!subir 4).", custo = "10% da barra de energia"},
        ["Onda de Impacto"] = {id = 9045, name = "Onda de Impacto", words = "t5", type = 'Instant', level = 70, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 27, group = {[1] = 14000}, needTarget = false, parameter = false, range = -1, exhaustion = 14000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 5. Área de raio 2 em volta de você: 170% do poder (+20% por nível da técnica); deixa 40% mais lento por 3 s. No nível 5, escolha A (raio 3) ou B (dano x1,35). Sobe de nível com pontos (!subir 5).", custo = "12% da barra de energia"},
        ["Corpo Fechado"] = {id = 9046, name = "Corpo Fechado", words = "t6", type = 'Instant', level = 100, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 28, group = {[3] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 6. Reforço por 10 s: +70 de defesa. No nível 5, escolha A (+110 de defesa) ou B (dura 16 s). Sobe de nível com pontos (!subir 6).", custo = "12% da barra de energia"},
        ["Punho em Dois Tempos"] = {id = 9047, name = "Punho em Dois Tempos", words = "t7", type = 'Instant', level = 150, mana = 16, soul = 0, maglevel = 0, icon = '', clientId = 29, group = {[1] = 20000}, needTarget = false, parameter = false, range = -1, exhaustion = 20000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 7. Golpe corpo a corpo no alvo: 260% do poder (+30% por nível da técnica); acerta de novo logo em seguida. No nível 5, escolha A (dano x1,3) ou B (paralisa 1,5 s). Sobe de nível com pontos (!subir 7).", custo = "16% da barra de energia"},
        ["Fúria Rubra"] = {id = 9048, name = "Fúria Rubra", words = "t8", type = 'Instant', level = 220, mana = 22, soul = 0, maglevel = 0, icon = '', clientId = 30, group = {[1] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 8. Sequência de 6 golpes no alvo, 130% do poder (+14% por nível da técnica) cada; o último golpe acerta em área; abre a janela do golpe exato. No nível 5, escolha A (8 golpes) ou B (janela do golpe exato +1,2 s). Sobe de nível com pontos (!subir 8).", custo = "22% da barra de energia"},
        ["Arena Final"] = {id = 9030, name = "Arena Final", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 4, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica principal da classe: cria uma área de raio 2 por 5 s que prende até 3 inimigos e causa 30% do poder neles. A partir do nível 30 vira a versão completa (raio 4, 10 s, até 6 alvos) e abre uma arena.", custo = "40% da barra de energia"},
        ["Tiro Preciso"] = {id = 9041, name = "Tiro Preciso", words = "t1", type = 'Instant', level = 1, mana = 4, soul = 0, maglevel = 0, icon = '', clientId = 7, group = {[1] = 4000}, needTarget = false, parameter = false, range = -1, exhaustion = 4000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 1. Ataque à distância no alvo (alcance 7): 110% do poder (+15% por nível da técnica). No nível 5, escolha A (dano x1,3) ou B (alcance 9). Sobe de nível com pontos (!subir 1).", custo = "4% da barra de energia"},
        ["Rajada"] = {id = 9042, name = "Rajada", words = "t2", type = 'Instant', level = 10, mana = 7, soul = 0, maglevel = 0, icon = '', clientId = 8, group = {[1] = 7000}, needTarget = false, parameter = false, range = -1, exhaustion = 7000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 2. Ataque à distância no alvo (alcance 5): 75% do poder (+10% por nível da técnica); acerta de novo logo em seguida. No nível 5, escolha A (dano x1,3) ou B (paralisa 0,8 s). Sobe de nível com pontos (!subir 2).", custo = "7% da barra de energia"},
        ["Tiro em Leque"] = {id = 9043, name = "Tiro em Leque", words = "t3", type = 'Instant', level = 25, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 9, group = {[1] = 11000}, needTarget = false, parameter = false, range = -1, exhaustion = 11000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 3. Área de raio 1 em volta do alvo (alcance 5): 120% do poder (+14% por nível da técnica). No nível 5, escolha A (raio 2) ou B (dano x1,35). Sobe de nível com pontos (!subir 3).", custo = "10% da barra de energia"},
        ["Recuo Tático"] = {id = 9044, name = "Recuo Tático", words = "t4", type = 'Instant', level = 45, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 10, group = {[3] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 4. Reforço por 6 s: +30 de defesa; +40% de velocidade. No nível 5, escolha A (+60% de velocidade) ou B (+60 de defesa). Sobe de nível com pontos (!subir 4).", custo = "8% da barra de energia"},
        ["Tiro Perfurante"] = {id = 9045, name = "Tiro Perfurante", words = "t5", type = 'Instant', level = 70, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 11, group = {[1] = 14000}, needTarget = false, parameter = false, range = -1, exhaustion = 14000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 5. Ataque à distância no alvo (alcance 7): 220% do poder (+25% por nível da técnica). No nível 5, escolha A (dano x1,3) ou B (paralisa 1,5 s). Sobe de nível com pontos (!subir 5).", custo = "12% da barra de energia"},
        ["Corrente Lançada"] = {id = 9046, name = "Corrente Lançada", words = "t6", type = 'Instant', level = 100, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 12, group = {[1] = 16000}, needTarget = false, parameter = false, range = -1, exhaustion = 16000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 6. Lança uma corrente que puxa o alvo de até 6 sqm: 140% do poder (+14% por nível da técnica). No nível 5, escolha A (paralisa 1,5 s) ou B (dano x1,4). Sobe de nível com pontos (!subir 6).", custo = "12% da barra de energia"},
        ["Chuva de Balas"] = {id = 9047, name = "Chuva de Balas", words = "t7", type = 'Instant', level = 150, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 13, group = {[1] = 26000}, needTarget = false, parameter = false, range = -1, exhaustion = 26000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 7. Área de raio 2 em volta do alvo (alcance 6): 190% do poder (+22% por nível da técnica). No nível 5, escolha A (raio 3) ou B (lentidão 50%, lentidão por 3 s). Sobe de nível com pontos (!subir 7).", custo = "18% da barra de energia"},
        ["Disparo Carregado"] = {id = 9048, name = "Disparo Carregado", words = "t8", type = 'Instant', level = 220, mana = 22, soul = 0, maglevel = 0, icon = '', clientId = 14, group = {[1] = 40000}, needTarget = false, parameter = false, range = -1, exhaustion = 40000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 8. Ataque à distância no alvo (alcance 9): 380% do poder (+40% por nível da técnica). No nível 5, escolha A (dano x1,35) ou B (paralisa 2 s). Sobe de nível com pontos (!subir 8).", custo = "22% da barra de energia"},
        ["Arsenal Aberto"] = {id = 9030, name = "Arsenal Aberto", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 2, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica principal da classe: cria uma área de raio 2 por 5 s que prende até 3 inimigos e causa 30% do poder neles. A partir do nível 30 vira a versão completa (raio 4, 10 s, até 6 alvos) e abre uma arena.", custo = "40% da barra de energia"},
        ["Rajada (2)"] = {id = 9041, name = "Rajada (2)", words = "t1", type = 'Instant', level = 1, mana = 6, soul = 0, maglevel = 0, icon = '', clientId = 47, group = {[1] = 4000}, needTarget = false, parameter = false, range = -1, exhaustion = 4000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 1. Ataque à distância no alvo (alcance 6): 130% do poder (+18% por nível da técnica). No nível 5, escolha A (dano x1,35) ou B (alcance 8). Sobe de nível com pontos (!subir 1).", custo = "6% da barra de energia"},
        ["Explosão"] = {id = 9042, name = "Explosão", words = "t2", type = 'Instant', level = 10, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 48, group = {[1] = 10000}, needTarget = false, parameter = false, range = -1, exhaustion = 10000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 2. Área de raio 2 em volta de você: 140% do poder (+18% por nível da técnica). No nível 5, escolha A (raio 3) ou B (dano x1,4). Sobe de nível com pontos (!subir 2).", custo = "12% da barra de energia"},
        ["Amplificação"] = {id = 9043, name = "Amplificação", words = "t3", type = 'Instant', level = 25, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 49, group = {[3] = 35000}, needTarget = false, parameter = false, range = -1, exhaustion = 35000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 3. Reforço por 10 s: cada golpe recupera 2,5x mais energia. No nível 5, escolha A (energia x3,5 por golpe) ou B (recarga da EP -15 s). Sobe de nível com pontos (!subir 3).", custo = "10% da barra de energia"},
        ["Colapso"] = {id = 9044, name = "Colapso", words = "t4", type = 'Instant', level = 45, mana = 20, soul = 0, maglevel = 0, icon = '', clientId = 50, group = {[1] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 4. Área de raio 2 em volta do alvo (alcance 6): 220% do poder (+26% por nível da técnica). No nível 5, escolha A (raio 3) ou B (dano x1,45). Sobe de nível com pontos (!subir 4).", custo = "20% da barra de energia"},
        ["Prisão de Energia"] = {id = 9045, name = "Prisão de Energia", words = "t5", type = 'Instant', level = 70, mana = 14, soul = 0, maglevel = 0, icon = '', clientId = 51, group = {[1] = 18000}, needTarget = false, parameter = false, range = -1, exhaustion = 18000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 5. Área de raio 1 em volta do alvo (alcance 6): 150% do poder (+16% por nível da técnica); deixa 60% mais lento por 4 s. No nível 5, escolha A (lentidão por 7 s) ou B (raio 2). Sobe de nível com pontos (!subir 5).", custo = "14% da barra de energia"},
        ["Lança de Energia"] = {id = 9046, name = "Lança de Energia", words = "t6", type = 'Instant', level = 100, mana = 16, soul = 0, maglevel = 0, icon = '', clientId = 52, group = {[1] = 16000}, needTarget = false, parameter = false, range = -1, exhaustion = 16000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 6. Ataque à distância no alvo (alcance 8): 270% do poder (+30% por nível da técnica). No nível 5, escolha A (dano x1,35) ou B (paralisa 1,5 s). Sobe de nível com pontos (!subir 6).", custo = "16% da barra de energia"},
        ["Sobrecarga"] = {id = 9047, name = "Sobrecarga", words = "t7", type = 'Instant', level = 150, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 53, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 7. Reforço por 12 s: cada golpe recupera 3x mais energia; reduz em 20 s a recarga da EP. No nível 5, escolha A (energia x4 por golpe) ou B (recarga da EP -35 s). Sobe de nível com pontos (!subir 7).", custo = "12% da barra de energia"},
        ["Técnica Suprema"] = {id = 9048, name = "Técnica Suprema", words = "t8", type = 'Instant', level = 220, mana = 30, soul = 0, maglevel = 0, icon = '', clientId = 54, group = {[1] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 8. Área de raio 3 em volta do alvo (alcance 6): 420% do poder (+40% por nível da técnica). No nível 5, escolha A (raio 4) ou B (dano x1,4). Sobe de nível com pontos (!subir 8).", custo = "30% da barra de energia"},
        ["Núcleo de Energia"] = {id = 9030, name = "Núcleo de Energia", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 6, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica principal da classe: cria uma área de raio 2 por 5 s que prende até 3 inimigos e causa 30% do poder neles. A partir do nível 30 vira a versão completa (raio 4, 10 s, até 6 alvos) e abre uma arena.", custo = "40% da barra de energia"},
        ["Sombra Leve"] = {id = 9041, name = "Sombra Leve", words = "t1", type = 'Instant', level = 1, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 15, group = {[3] = 15000}, needTarget = false, parameter = false, range = -1, exhaustion = 15000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 1. Invoca 1 sombra aliada por 20 s (+1 no nível 4 da técnica). No nível 5, escolha A (+1 invocação) ou B (duram 40 s). Sobe de nível com pontos (!subir 1).", custo = "10% da barra de energia"},
        ["Sombra Bruta"] = {id = 9042, name = "Sombra Bruta", words = "t2", type = 'Instant', level = 10, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 16, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 2. Invoca 1 sombra aliada por 15 s (+1 no nível 4 da técnica). No nível 5, escolha A (duram 30 s) ou B (+1 invocação). Sobe de nível com pontos (!subir 2).", custo = "18% da barra de energia"},
        ["Sombra Atiradora"] = {id = 9043, name = "Sombra Atiradora", words = "t3", type = 'Instant', level = 25, mana = 15, soul = 0, maglevel = 0, icon = '', clientId = 17, group = {[3] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 3. Invoca 1 sombra aliada por 20 s (+1 no nível 4 da técnica). No nível 5, escolha A (duram 35 s) ou B (+1 invocação). Sobe de nível com pontos (!subir 3).", custo = "15% da barra de energia"},
        ["União de Sombras"] = {id = 9044, name = "União de Sombras", words = "t4", type = 'Instant', level = 45, mana = 20, soul = 0, maglevel = 0, icon = '', clientId = 18, group = {[3] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 4. Reforço por 8 s: suas invocações recuperam toda a vida e ficam 40% mais rápidas. No nível 5, escolha A (dura 14 s) ou B (+30% de velocidade). Sobe de nível com pontos (!subir 4).", custo = "20% da barra de energia"},
        ["Ordem de Ataque"] = {id = 9045, name = "Ordem de Ataque", words = "t5", type = 'Instant', level = 70, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 19, group = {[1] = 12000}, needTarget = false, parameter = false, range = -1, exhaustion = 12000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 5. Ataque à distância no alvo (alcance 6): 160% do poder (+18% por nível da técnica); deixa 40% mais lento por 3 s. No nível 5, escolha A (dano x1,3) ou B (paralisa 1,2 s). Sobe de nível com pontos (!subir 5).", custo = "12% da barra de energia"},
        ["Matilha"] = {id = 9046, name = "Matilha", words = "t6", type = 'Instant', level = 100, mana = 22, soul = 0, maglevel = 0, icon = '', clientId = 20, group = {[3] = 35000}, needTarget = false, parameter = false, range = -1, exhaustion = 35000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 6. Invoca 2 sombras aliadas por 25 s (+1 no nível 4 da técnica). No nível 5, escolha A (duram 40 s) ou B (+1 invocação). Sobe de nível com pontos (!subir 6).", custo = "22% da barra de energia"},
        ["Absorver"] = {id = 9047, name = "Absorver", words = "t7", type = 'Instant', level = 150, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 21, group = {[1] = 26000}, needTarget = false, parameter = false, range = -1, exhaustion = 26000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 7. Área de raio 2 em volta de você: 180% do poder (+20% por nível da técnica); cura você em 40% do dano causado. No nível 5, escolha A (raio 3) ou B (cura 70% do dano). Sobe de nível com pontos (!subir 7).", custo = "18% da barra de energia"},
        ["Legião"] = {id = 9048, name = "Legião", words = "t8", type = 'Instant', level = 220, mana = 30, soul = 0, maglevel = 0, icon = '', clientId = 22, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 8. Invoca 3 sombras aliadas por 30 s (+1 no nível 4 da técnica). No nível 5, escolha A (duram 45 s) ou B (+1 invocação). Sobe de nível com pontos (!subir 8).", custo = "30% da barra de energia"},
        ["Tropa de Sombras"] = {id = 9030, name = "Tropa de Sombras", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 3, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica principal da classe: cria uma área de raio 2 por 5 s que prende até 3 inimigos e causa 30% do poder neles. A partir do nível 30 vira a versão completa (raio 4, 10 s, até 6 alvos) e abre uma arena.", custo = "40% da barra de energia"},
        ["Toque Curativo"] = {id = 9041, name = "Toque Curativo", words = "t1", type = 'Instant', level = 1, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 39, group = {[2] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 1. Cura o alvo (ou você): 120% do poder (+20% por nível da técnica). No nível 5, escolha A (dano x1,3) ou B (cura o grupo, raio 3). Sobe de nível com pontos (!subir 1).", custo = "8% da barra de energia"},
        ["Selo Punitivo"] = {id = 9042, name = "Selo Punitivo", words = "t2", type = 'Instant', level = 10, mana = 6, soul = 0, maglevel = 0, icon = '', clientId = 40, group = {[1] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 2. Ataque à distância no alvo (alcance 5): 115% do poder (+15% por nível da técnica); deixa 40% mais lento por 3 s; cura você em 30% do dano causado. No nível 5, escolha A (dano x1,3) ou B (cura 50% do dano). Sobe de nível com pontos (!subir 2).", custo = "6% da barra de energia"},
        ["Cura Reversa"] = {id = 9043, name = "Cura Reversa", words = "t3", type = 'Instant', level = 25, mana = 14, soul = 0, maglevel = 0, icon = '', clientId = 41, group = {[2] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 3. Cura você: 250% do poder (+30% por nível da técnica). No nível 5, escolha A (dano x1,3) ou B (cura o grupo, raio 2). Sobe de nível com pontos (!subir 3).", custo = "14% da barra de energia"},
        ["Luz Purificadora"] = {id = 9044, name = "Luz Purificadora", words = "t4", type = 'Instant', level = 45, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 42, group = {[1] = 12000}, needTarget = false, parameter = false, range = -1, exhaustion = 12000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 4. Área de raio 2 em volta de você: 140% do poder (+16% por nível da técnica); cura você em 40% do dano causado. No nível 5, escolha A (raio 3) ou B (cura 70% do dano). Sobe de nível com pontos (!subir 4).", custo = "12% da barra de energia"},
        ["Cúpula"] = {id = 9045, name = "Cúpula", words = "t5", type = 'Instant', level = 70, mana = 14, soul = 0, maglevel = 0, icon = '', clientId = 43, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 5. Reforço por 8 s: +80 de defesa para você e os aliados a até 3 sqm. No nível 5, escolha A (dura 12 s) ou B (+120 de defesa). Sobe de nível com pontos (!subir 5).", custo = "14% da barra de energia"},
        ["Corrente Vital"] = {id = 9046, name = "Corrente Vital", words = "t6", type = 'Instant', level = 100, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 44, group = {[2] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 6. Cura você e o grupo a até 4 sqm: 300% do poder (+30% por nível da técnica). No nível 5, escolha A (dano x1,3) ou B (raio 6). Sobe de nível com pontos (!subir 6).", custo = "18% da barra de energia"},
        ["Julgamento"] = {id = 9047, name = "Julgamento", words = "t7", type = 'Instant', level = 150, mana = 16, soul = 0, maglevel = 0, icon = '', clientId = 45, group = {[1] = 18000}, needTarget = false, parameter = false, range = -1, exhaustion = 18000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 7. Ataque à distância no alvo (alcance 6): 260% do poder (+28% por nível da técnica); paralisa por 1,2 s; cura você em 50% do dano causado. No nível 5, escolha A (dano x1,3) ou B (cura 80% do dano). Sobe de nível com pontos (!subir 7).", custo = "16% da barra de energia"},
        ["Santuário"] = {id = 9048, name = "Santuário", words = "t8", type = 'Instant', level = 220, mana = 28, soul = 0, maglevel = 0, icon = '', clientId = 46, group = {[1] = 55000}, needTarget = false, parameter = false, range = -1, exhaustion = 55000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 8. Área de raio 3 em volta de você: 220% do poder (+24% por nível da técnica); deixa 50% mais lento por 4 s; cura você em 80% do dano causado. No nível 5, escolha A (raio 4) ou B (cura 120% do dano). Sobe de nível com pontos (!subir 8).", custo = "28% da barra de energia"},
        ["Jardim Vivo"] = {id = 9030, name = "Jardim Vivo", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 5, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica principal da classe: cria uma área de raio 2 por 5 s que prende até 3 inimigos e causa 30% do poder neles. A partir do nível 30 vira a versão completa (raio 4, 10 s, até 6 alvos) e abre uma arena.", custo = "40% da barra de energia"},
        ["Golpe Bruto"] = {id = 9041, name = "Golpe Bruto", words = "t1", type = 'Instant', level = 1, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 31, group = {[1] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 1. Golpe corpo a corpo no alvo: 150% do poder (+20% por nível da técnica); acerta de novo logo em seguida. No nível 5, escolha A (dano x1,35) ou B (paralisa 1,2 s). Sobe de nível com pontos (!subir 1).", custo = "sem custo (só recarga)"},
        ["Disparada"] = {id = 9042, name = "Disparada", words = "t2", type = 'Instant', level = 10, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 32, group = {[1] = 9000}, needTarget = false, parameter = false, range = -1, exhaustion = 9000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 2. Avança 4 sqm em linha e acerta quem estiver no caminho: 160% do poder (+18% por nível da técnica); atravessa os inimigos. No nível 5, escolha A (avança 6 sqm) ou B (paralisa 1 s). Sobe de nível com pontos (!subir 2).", custo = "sem custo (só recarga)"},
        ["Sentidos Aguçados"] = {id = 9043, name = "Sentidos Aguçados", words = "t3", type = 'Instant', level = 25, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 33, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 3. Reforço por 10 s: +40 de defesa; +35% de velocidade. No nível 5, escolha A (+55% de velocidade) ou B (+70 de defesa). Sobe de nível com pontos (!subir 3).", custo = "sem custo (só recarga)"},
        ["Massacre"] = {id = 9044, name = "Massacre", words = "t4", type = 'Instant', level = 45, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 34, group = {[1] = 26000}, needTarget = false, parameter = false, range = -1, exhaustion = 26000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 4. Sequência de 5 golpes no alvo, 110% do poder (+12% por nível da técnica) cada. No nível 5, escolha A (7 golpes) ou B (último golpe em área). Sobe de nível com pontos (!subir 4).", custo = "sem custo (só recarga)"},
        ["Arremesso Brutal"] = {id = 9045, name = "Arremesso Brutal", words = "t5", type = 'Instant', level = 70, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 35, group = {[1] = 12000}, needTarget = false, parameter = false, range = -1, exhaustion = 12000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 5. Ataque à distância no alvo (alcance 5): 200% do poder (+22% por nível da técnica). No nível 5, escolha A (dano x1,3) ou B (paralisa 1,5 s). Sobe de nível com pontos (!subir 5).", custo = "sem custo (só recarga)"},
        ["Pele de Aço"] = {id = 9046, name = "Pele de Aço", words = "t6", type = 'Instant', level = 100, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 36, group = {[3] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 6. Reforço por 10 s: +90 de defesa. No nível 5, escolha A (+140 de defesa) ou B (dura 16 s). Sobe de nível com pontos (!subir 6).", custo = "sem custo (só recarga)"},
        ["Terremoto"] = {id = 9047, name = "Terremoto", words = "t7", type = 'Instant', level = 150, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 37, group = {[1] = 24000}, needTarget = false, parameter = false, range = -1, exhaustion = 24000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 7. Área de raio 2 em volta de você: 230% do poder (+24% por nível da técnica); deixa 50% mais lento por 3 s. No nível 5, escolha A (raio 3) ou B (dano x1,35). Sobe de nível com pontos (!subir 7).", custo = "sem custo (só recarga)"},
        ["Corte Final"] = {id = 9048, name = "Corte Final", words = "t8", type = 'Instant', level = 220, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 38, group = {[1] = 50000}, needTarget = false, parameter = false, range = -1, exhaustion = 50000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 8. Avança 5 sqm em linha e acerta quem estiver no caminho: 420% do poder (+40% por nível da técnica); atravessa os inimigos. No nível 5, escolha A (avança 7 sqm) ou B (paralisa 2 s). Sobe de nível com pontos (!subir 8).", custo = "sem custo (só recarga)"},
        ["Golpe Exato"] = {id = 9020, name = "Golpe Exato", words = "ckt", type = 'Instant', level = 1, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 0, group = {[1] = 1000}, needTarget = false, parameter = false, range = -1, exhaustion = 1000, premium = false, vocations = {1, 2, 6, 3, 4}, special = false, source = 0, description = "Golpe exato: depois de 3 golpes corpo a corpo seguidos abre uma janela de 1,5 s; usado dentro dela, causa 2,5x de dano e dá um bônus de dano por 30 s.", custo = "sem custo"},
        ["Guarda Firme"] = {id = 9031, name = "Guarda Firme", words = "ds", type = 'Instant', level = 1, mana = 15, soul = 0, maglevel = 0, icon = '', clientId = 1, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {1, 2, 6, 3, 4}, special = false, source = 0, description = "Defesa universal: por 5 s você não pode ser capturado pela EP completa de outro jogador.", custo = "15% da barra de energia"},
    }
}

VocationNames = {
    [0] = 'Nenhuma',
    [1] = "Lutador",
    [2] = "Mestre das Armas",
    [3] = "Controlador",
    [4] = "Suporte",
    [5] = "Suporte",
    [6] = "Mestre das Técnicas",
    [7] = "Restringido",
}

SpellGroups = {
    [1] = 'Attack',
    [2] = 'Healing',
    [3] = 'Support',
    [4] = 'Special',
    [5] = 'Conjure',
    [6] = 'Crippling',
    [7] = 'Focus',
    [8] = 'UltimateStrikes',
    [9] = 'GreatBeams',
    [10] = 'BurstsOfNature',
    [11] = 'Virtue'
}

SpellRunesData = {}

Spells = {}

function Spells.getSpellList()
    local spells = {}
    for k, spell in pairs(SpellInfo["Default"]) do
        table.insert(spells, spell)
    end
    return spells
end

function Spells.getSpellByName(name)
    return SpellInfo[Spells.getSpellProfileByName(name)][name]
end

function Spells.getSpellByWords(words)
    local words = words:lower():trim()
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if spell.words == words then
                return spell, profile, k
            end
        end
    end
    return nil
end

function Spells.getSpellByIcon(iconId)
    local achada, perfil, chave
    local player = g_game and g_game.getLocalPlayer and g_game.getLocalPlayer()
    local voc = player and player:getVocation() or -1
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if spell.id == iconId then
                if table.find(spell.vocations, voc) then
                    return spell, profile, k
                end
                achada, perfil, chave = achada or spell, achada and perfil or profile, achada and chave or k
            end
        end
    end
    return achada, perfil, chave
end

function Spells.getSpellByClientId(clientId)
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if spell.clientId == clientId then
                return spell, profile, k
            end
        end
    end
    return nil
end

function Spells.getSpellIconIds()
    local ids = {}
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            table.insert(ids, spell.id)
        end
    end
    return ids
end

function Spells.getSpellProfileById(id)
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if spell.id == id then
                return profile
            end
        end
    end
    return nil
end

function Spells.getSpellProfileByWords(words)
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if spell.words == words then
                return profile
            end
        end
    end
    return nil
end

function Spells.getSpellDataByWords(words)
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if spell.words == words then
                return spell
            end
        end
    end
    return nil
end

function Spells.getSpellDataByParamWords(words)
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            local inputWords = words:lower()
            local spellWords = spell.words:lower()
            local quoteStartIndex = inputWords:find('%"')

            if not spell.parameter then
                if inputWords == spellWords then
                    return spell, nil
                end
            else
                if quoteStartIndex then
                    local spellPart = inputWords:sub(1, quoteStartIndex - 1):match("^%s*(.-)%s*$")
                    local parameter = inputWords:sub(quoteStartIndex + 1)
                    if spellPart == spellWords then
                        return spell, parameter
                    end
                else
                    if inputWords == spellWords then
                        return spell, nil
                    end
                end
            end
        end
    end
    return nil, nil
end

function Spells.getSpellFormatedName(words)
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            local inputWords = words:lower()
            local spellWords = spell.words:lower()

            if not spell.parameter then
                if inputWords == spellWords then
                    return spellWords
                end
            else
                if string.sub(inputWords, 1, string.len(spellWords)) == spellWords then
                    local extraText = string.sub(inputWords, string.len(spellWords) + 1)
                    if extraText ~= "" then
                        if string.sub(extraText, 1, 1) == " " then
                            local firstChar = string.sub(extraText, 2, 2)
                            if firstChar == '"' then
                                local fomated = extraText:gsub('"', '')
                                fomated = "\"" .. string.sub(fomated, 2) .. "\""
                                return spellWords .. " " .. fomated
                            else
                                return spellWords .. extraText
                            end
                        end
                    else
                        return spellWords
                    end
                end
            end
        end
    end
    return words
end

function Spells.getSpellNameByWords(words)
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if spell.words == words then
                return k
            end
        end
    end
    return nil
end

function Spells.getSpellDataById(spellId)
    for _, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if spell.id == spellId then
                return spell
            end
        end
    end
    return nil
end

function Spells.getRuneSpellByItem(itemId)
    local data = SpellRunesData[itemId]
    if data then
        return data
    end
    return nil
end

function Spells.isRuneSpell(spellId)
    for _, data in pairs(SpellRunesData) do
        if data.id == spellId then
            return true
        end
    end
    return false
end

function Spells.getSpellProfileByName(spellName)
    for profile, data in pairs(SpellInfo) do
        if table.findbykey(data, spellName:trim(), true) then
            return profile
        end
    end
    return nil
end

function Spells.getSpellsByVocationId(vocId)
    local spells = {}
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if table.contains(spell.vocations, vocId) then
                table.insert(spells, spell)
            end
        end
    end
    return spells
end

function Spells.filterSpellsByGroups(spells, groups)
    local filtered = {}
    for v, spell in pairs(spells) do
        local spellGroups = Spells.getGroupIds(spell)
        if table.equals(spellGroups, groups) then
            table.insert(filtered, spell)
        end
    end
    return filtered
end

function Spells.getCooldownByGroup(spellData, groupId)
    local keys = {}
    for k in pairs(spellData.group) do
        table.insert(keys, k)
    end
    table.sort(keys)
    local index = 1
    for _, k in ipairs(keys) do
        if index == 1 and k == groupId then
            return spellData.group[k]
        end
        index = index + 1
    end
    return nil
end

function Spells.getCooldownBySecondaryGroup(spellData, groupId)
    local keys = {}
    for k in pairs(spellData.group) do
        table.insert(keys, k)
    end
    table.sort(keys)
    local index = 1
    for _, k in ipairs(keys) do
        if index == 2 and k == groupId then
            return spellData.group[k]
        end
        index = index + 1
    end
    return nil
end

function Spells.getGroupIds(spell)
    local groups = {}
    for k, _ in pairs(spell.group) do
        table.insert(groups, k)
    end
    return groups
end

function Spells.getPrimaryGroup(spell)
    local indexes = {}
    for k in pairs(spell.group) do
        table.insert(indexes, k)
    end
    table.sort(indexes)
    return indexes[1] or -1
end

function Spells.getIconFileByProfile(profile)
    return SpelllistSettings[profile]['iconFile']
end

function Spells.getImageClip(indexClip, profile)
    if profile == nil then
        profile = "Default"
    end
    return indexClip * SpelllistSettings[profile].iconSize.width .. " 0 " .. SpelllistSettings[profile].iconSize.width .. " " .. SpelllistSettings[profile].iconSize.height
end

function Spells.getImageClipCooldown(indexClip, profile)
    if profile == nil then
        profile = "Default"
    end
    return indexClip * SpelllistSettings[profile].iconSizeCooldown.width .. " 0 " .. SpelllistSettings[profile].iconSizeCooldown.width .. " " .. SpelllistSettings[profile].iconSizeCooldown.height
end

-- MMO JJK (gerado): buscas por classe. As classes repetem as palavras e o id das tecnicas (t1-t8);
-- toda busca por palavra ou id prefere a magia da classe do jogador (senao, a primeira encontrada).
local function vocacaoDoJogador()
    local p = g_game and g_game.getLocalPlayer and g_game.getLocalPlayer()
    return p and p:getVocation() or -1
end

local function buscarMagia(teste)
    local voc = vocacaoDoJogador()
    local achada, perfil, chave
    for profile, data in pairs(SpellInfo) do
        for k, spell in pairs(data) do
            if teste(spell) then
                if table.find(spell.vocations, voc) then
                    return spell, profile, k
                end
                if not achada then
                    achada, perfil, chave = spell, profile, k
                end
            end
        end
    end
    return achada, perfil, chave
end

function Spells.getSpellByWords(words)
    words = words:lower():trim()
    return buscarMagia(function(s) return s.words == words end)
end

function Spells.getSpellDataByWords(words)
    return (buscarMagia(function(s) return s.words == words end))
end

function Spells.getSpellProfileByWords(words)
    local _, perfil = buscarMagia(function(s) return s.words == words end)
    return perfil
end

function Spells.getSpellNameByWords(words)
    local _, _, chave = buscarMagia(function(s) return s.words == words end)
    return chave
end

function Spells.getSpellDataById(id)
    return (buscarMagia(function(s) return s.id == id end))
end

function Spells.getSpellProfileById(id)
    local _, perfil = buscarMagia(function(s) return s.id == id end)
    return perfil
end

function Spells.getSpellByIcon(id)
    return buscarMagia(function(s) return s.id == id end)
end

local porPalavrasOriginal = Spells.getSpellDataByParamWords
function Spells.getSpellDataByParamWords(words)
    local spell, param = porPalavrasOriginal(words)
    if spell then
        spell = buscarMagia(function(s) return s.words == spell.words end) or spell
    end
    return spell, param
end
