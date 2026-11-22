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
-- GERADO por tools/assets/gerar_spells_cliente.py (nao editar a mao): magias do projeto, sem dados do Tibia.
-- GERADO por tools/assets/gerar_spells_cliente.py (nao editar a mao): magias do projeto, sem dados do Tibia.
-- GERADO por tools/assets/gerar_spells_cliente.py (nao editar a mao): magias do projeto, sem dados do Tibia.
-- GERADO por tools/assets/gerar_spells_cliente.py (nao editar a mao): magias do projeto, sem dados do Tibia.
-- GERADO por tools/assets/gerar_spells_cliente.py (nao editar a mao): magias do projeto, sem dados do Tibia.
-- GERADO por tools/assets/gerar_spells_cliente.py (nao editar a mao): magias do projeto, sem dados do Tibia.
SpellInfo = {
    Default = {
        ["Arremesso Certeiro"] = {id = 9002, name = "Arremesso Certeiro", words = "tecn2", type = 'Instant', level = 1, mana = 25, soul = 0, maglevel = 0, icon = '', clientId = 55, group = {[1] = 3000}, needTarget = false, parameter = false, range = -1, exhaustion = 3000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Chuva de Ferro"] = {id = 9007, name = "Chuva de Ferro", words = "tecb2", type = 'Instant', level = 15, mana = 60, soul = 0, maglevel = 0, icon = '', clientId = 56, group = {[1] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Lâmina em Fio"] = {id = 9012, name = "Lâmina em Fio", words = "tecc2", type = 'Instant', level = 1, mana = 45, soul = 0, maglevel = 0, icon = '', clientId = 57, group = {[1] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Chamado das Sombras"] = {id = 9003, name = "Chamado das Sombras", words = "tecn3", type = 'Instant', level = 1, mana = 60, soul = 0, maglevel = 0, icon = '', clientId = 58, group = {[3] = 20000}, needTarget = false, parameter = false, range = -1, exhaustion = 20000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Coro de Sombras"] = {id = 9008, name = "Coro de Sombras", words = "tecb3", type = 'Instant', level = 15, mana = 120, soul = 0, maglevel = 0, icon = '', clientId = 59, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Sentinela de Sombra"] = {id = 9013, name = "Sentinela de Sombra", words = "tecc3", type = 'Instant', level = 1, mana = 80, soul = 0, maglevel = 0, icon = '', clientId = 60, group = {[3] = 40000}, needTarget = false, parameter = false, range = -1, exhaustion = 40000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Maré Baixa"] = {id = 9001, name = "Maré Baixa", words = "tecn1", type = 'Instant', level = 1, mana = 30, soul = 0, maglevel = 0, icon = '', clientId = 61, group = {[1] = 4000}, needTarget = false, parameter = false, range = -1, exhaustion = 4000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Vaga Funda"] = {id = 9006, name = "Vaga Funda", words = "tecb1", type = 'Instant', level = 15, mana = 70, soul = 0, maglevel = 0, icon = '', clientId = 62, group = {[1] = 8000}, needTarget = false, parameter = false, range = -1, exhaustion = 8000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Punho Veloz"] = {id = 9011, name = "Punho Veloz", words = "tecc1", type = 'Instant', level = 1, mana = 20, soul = 0, maglevel = 0, icon = '', clientId = 63, group = {[1] = 3000}, needTarget = false, parameter = false, range = -1, exhaustion = 3000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Casco Firme"] = {id = 9004, name = "Casco Firme", words = "tecn4", type = 'Instant', level = 1, mana = 35, soul = 0, maglevel = 0, icon = '', clientId = 64, group = {[3] = 20000}, needTarget = false, parameter = false, range = -1, exhaustion = 20000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Fôlego Restaurador"] = {id = 9005, name = "Fôlego Restaurador", words = "tecn5", type = 'Instant', level = 1, mana = 25, soul = 0, maglevel = 0, icon = '', clientId = 65, group = {[3] = 2000}, needTarget = false, parameter = false, range = -1, exhaustion = 2000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Aura Restauradora"] = {id = 9015, name = "Aura Restauradora", words = "tecc5", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 66, group = {[3] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Disparo Concentrado"] = {id = 9016, name = "Disparo Concentrado", words = "tecn6", type = 'Instant', level = 1, mana = 45, soul = 0, maglevel = 0, icon = '', clientId = 67, group = {[1] = 3000}, needTarget = false, parameter = false, range = -1, exhaustion = 3000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Explosão de Energia"] = {id = 9017, name = "Explosão de Energia", words = "tecb6", type = 'Instant', level = 1, mana = 90, soul = 0, maglevel = 0, icon = '', clientId = 68, group = {[1] = 9000}, needTarget = false, parameter = false, range = -1, exhaustion = 9000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Feixe de Energia"] = {id = 9018, name = "Feixe de Energia", words = "tecc6", type = 'Instant', level = 1, mana = 70, soul = 0, maglevel = 0, icon = '', clientId = 69, group = {[1] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Impacto Duplo"] = {id = 9041, name = "Impacto Duplo", words = "t1", type = 'Instant', level = 1, mana = 5, soul = 0, maglevel = 0, icon = '', clientId = 23, group = {[1] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Investida Curta"] = {id = 9042, name = "Investida Curta", words = "t2", type = 'Instant', level = 10, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 24, group = {[1] = 10000}, needTarget = false, parameter = false, range = -1, exhaustion = 10000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Sequência de Golpes"] = {id = 9043, name = "Sequência de Golpes", words = "t3", type = 'Instant', level = 25, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 25, group = {[1] = 18000}, needTarget = false, parameter = false, range = -1, exhaustion = 18000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Foco de Combate"] = {id = 9044, name = "Foco de Combate", words = "t4", type = 'Instant', level = 45, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 26, group = {[3] = 40000}, needTarget = false, parameter = false, range = -1, exhaustion = 40000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Onda de Impacto"] = {id = 9045, name = "Onda de Impacto", words = "t5", type = 'Instant', level = 70, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 27, group = {[1] = 14000}, needTarget = false, parameter = false, range = -1, exhaustion = 14000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 5. Custo em % da barra de energia; evolui até o nível 5 (!subir 5)."},
        ["Corpo Fechado"] = {id = 9046, name = "Corpo Fechado", words = "t6", type = 'Instant', level = 100, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 28, group = {[3] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 6. Custo em % da barra de energia; evolui até o nível 5 (!subir 6)."},
        ["Punho em Dois Tempos"] = {id = 9047, name = "Punho em Dois Tempos", words = "t7", type = 'Instant', level = 150, mana = 16, soul = 0, maglevel = 0, icon = '', clientId = 29, group = {[1] = 20000}, needTarget = false, parameter = false, range = -1, exhaustion = 20000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 7. Custo em % da barra de energia; evolui até o nível 5 (!subir 7)."},
        ["Fúria Rubra"] = {id = 9048, name = "Fúria Rubra", words = "t8", type = 'Instant', level = 220, mana = 22, soul = 0, maglevel = 0, icon = '', clientId = 30, group = {[1] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 8. Custo em % da barra de energia; evolui até o nível 5 (!subir 8)."},
        ["Arena Final"] = {id = 9030, name = "Arena Final", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 4, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {1}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Tiro Preciso"] = {id = 9041, name = "Tiro Preciso", words = "t1", type = 'Instant', level = 1, mana = 4, soul = 0, maglevel = 0, icon = '', clientId = 7, group = {[1] = 4000}, needTarget = false, parameter = false, range = -1, exhaustion = 4000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Rajada"] = {id = 9042, name = "Rajada", words = "t2", type = 'Instant', level = 10, mana = 7, soul = 0, maglevel = 0, icon = '', clientId = 8, group = {[1] = 7000}, needTarget = false, parameter = false, range = -1, exhaustion = 7000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Tiro em Leque"] = {id = 9043, name = "Tiro em Leque", words = "t3", type = 'Instant', level = 25, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 9, group = {[1] = 11000}, needTarget = false, parameter = false, range = -1, exhaustion = 11000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Recuo Tático"] = {id = 9044, name = "Recuo Tático", words = "t4", type = 'Instant', level = 45, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 10, group = {[3] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Tiro Perfurante"] = {id = 9045, name = "Tiro Perfurante", words = "t5", type = 'Instant', level = 70, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 11, group = {[1] = 14000}, needTarget = false, parameter = false, range = -1, exhaustion = 14000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 5. Custo em % da barra de energia; evolui até o nível 5 (!subir 5)."},
        ["Corrente Lançada"] = {id = 9046, name = "Corrente Lançada", words = "t6", type = 'Instant', level = 100, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 12, group = {[1] = 16000}, needTarget = false, parameter = false, range = -1, exhaustion = 16000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 6. Custo em % da barra de energia; evolui até o nível 5 (!subir 6)."},
        ["Chuva de Balas"] = {id = 9047, name = "Chuva de Balas", words = "t7", type = 'Instant', level = 150, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 13, group = {[1] = 26000}, needTarget = false, parameter = false, range = -1, exhaustion = 26000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 7. Custo em % da barra de energia; evolui até o nível 5 (!subir 7)."},
        ["Disparo Carregado"] = {id = 9048, name = "Disparo Carregado", words = "t8", type = 'Instant', level = 220, mana = 22, soul = 0, maglevel = 0, icon = '', clientId = 14, group = {[1] = 40000}, needTarget = false, parameter = false, range = -1, exhaustion = 40000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 8. Custo em % da barra de energia; evolui até o nível 5 (!subir 8)."},
        ["Arsenal Aberto"] = {id = 9030, name = "Arsenal Aberto", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 2, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {2}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Rajada (2)"] = {id = 9041, name = "Rajada (2)", words = "t1", type = 'Instant', level = 1, mana = 6, soul = 0, maglevel = 0, icon = '', clientId = 47, group = {[1] = 4000}, needTarget = false, parameter = false, range = -1, exhaustion = 4000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Explosão"] = {id = 9042, name = "Explosão", words = "t2", type = 'Instant', level = 10, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 48, group = {[1] = 10000}, needTarget = false, parameter = false, range = -1, exhaustion = 10000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Amplificação"] = {id = 9043, name = "Amplificação", words = "t3", type = 'Instant', level = 25, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 49, group = {[3] = 35000}, needTarget = false, parameter = false, range = -1, exhaustion = 35000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Colapso"] = {id = 9044, name = "Colapso", words = "t4", type = 'Instant', level = 45, mana = 20, soul = 0, maglevel = 0, icon = '', clientId = 50, group = {[1] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Prisão de Energia"] = {id = 9045, name = "Prisão de Energia", words = "t5", type = 'Instant', level = 70, mana = 14, soul = 0, maglevel = 0, icon = '', clientId = 51, group = {[1] = 18000}, needTarget = false, parameter = false, range = -1, exhaustion = 18000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 5. Custo em % da barra de energia; evolui até o nível 5 (!subir 5)."},
        ["Lança de Energia"] = {id = 9046, name = "Lança de Energia", words = "t6", type = 'Instant', level = 100, mana = 16, soul = 0, maglevel = 0, icon = '', clientId = 52, group = {[1] = 16000}, needTarget = false, parameter = false, range = -1, exhaustion = 16000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 6. Custo em % da barra de energia; evolui até o nível 5 (!subir 6)."},
        ["Sobrecarga"] = {id = 9047, name = "Sobrecarga", words = "t7", type = 'Instant', level = 150, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 53, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 7. Custo em % da barra de energia; evolui até o nível 5 (!subir 7)."},
        ["Técnica Suprema"] = {id = 9048, name = "Técnica Suprema", words = "t8", type = 'Instant', level = 220, mana = 30, soul = 0, maglevel = 0, icon = '', clientId = 54, group = {[1] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {6}, special = false, source = 0, description = "Técnica ativa 8. Custo em % da barra de energia; evolui até o nível 5 (!subir 8)."},
        ["Núcleo de Energia"] = {id = 9030, name = "Núcleo de Energia", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 6, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {6}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Sombra Leve"] = {id = 9041, name = "Sombra Leve", words = "t1", type = 'Instant', level = 1, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 15, group = {[3] = 15000}, needTarget = false, parameter = false, range = -1, exhaustion = 15000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Sombra Bruta"] = {id = 9042, name = "Sombra Bruta", words = "t2", type = 'Instant', level = 10, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 16, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Sombra Atiradora"] = {id = 9043, name = "Sombra Atiradora", words = "t3", type = 'Instant', level = 25, mana = 15, soul = 0, maglevel = 0, icon = '', clientId = 17, group = {[3] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["União de Sombras"] = {id = 9044, name = "União de Sombras", words = "t4", type = 'Instant', level = 45, mana = 20, soul = 0, maglevel = 0, icon = '', clientId = 18, group = {[3] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Ordem de Ataque"] = {id = 9045, name = "Ordem de Ataque", words = "t5", type = 'Instant', level = 70, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 19, group = {[1] = 12000}, needTarget = false, parameter = false, range = -1, exhaustion = 12000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 5. Custo em % da barra de energia; evolui até o nível 5 (!subir 5)."},
        ["Matilha"] = {id = 9046, name = "Matilha", words = "t6", type = 'Instant', level = 100, mana = 22, soul = 0, maglevel = 0, icon = '', clientId = 20, group = {[3] = 35000}, needTarget = false, parameter = false, range = -1, exhaustion = 35000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 6. Custo em % da barra de energia; evolui até o nível 5 (!subir 6)."},
        ["Absorver"] = {id = 9047, name = "Absorver", words = "t7", type = 'Instant', level = 150, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 21, group = {[1] = 26000}, needTarget = false, parameter = false, range = -1, exhaustion = 26000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 7. Custo em % da barra de energia; evolui até o nível 5 (!subir 7)."},
        ["Legião"] = {id = 9048, name = "Legião", words = "t8", type = 'Instant', level = 220, mana = 30, soul = 0, maglevel = 0, icon = '', clientId = 22, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 8. Custo em % da barra de energia; evolui até o nível 5 (!subir 8)."},
        ["Tropa de Sombras"] = {id = 9030, name = "Tropa de Sombras", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 3, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {3}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Toque Curativo"] = {id = 9041, name = "Toque Curativo", words = "t1", type = 'Instant', level = 1, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 39, group = {[2] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Selo Punitivo"] = {id = 9042, name = "Selo Punitivo", words = "t2", type = 'Instant', level = 10, mana = 6, soul = 0, maglevel = 0, icon = '', clientId = 40, group = {[1] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Cura Reversa"] = {id = 9043, name = "Cura Reversa", words = "t3", type = 'Instant', level = 25, mana = 14, soul = 0, maglevel = 0, icon = '', clientId = 41, group = {[2] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Luz Purificadora"] = {id = 9044, name = "Luz Purificadora", words = "t4", type = 'Instant', level = 45, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 42, group = {[1] = 12000}, needTarget = false, parameter = false, range = -1, exhaustion = 12000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Cúpula"] = {id = 9045, name = "Cúpula", words = "t5", type = 'Instant', level = 70, mana = 14, soul = 0, maglevel = 0, icon = '', clientId = 43, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 5. Custo em % da barra de energia; evolui até o nível 5 (!subir 5)."},
        ["Corrente Vital"] = {id = 9046, name = "Corrente Vital", words = "t6", type = 'Instant', level = 100, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 44, group = {[2] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 6. Custo em % da barra de energia; evolui até o nível 5 (!subir 6)."},
        ["Julgamento"] = {id = 9047, name = "Julgamento", words = "t7", type = 'Instant', level = 150, mana = 16, soul = 0, maglevel = 0, icon = '', clientId = 45, group = {[1] = 18000}, needTarget = false, parameter = false, range = -1, exhaustion = 18000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 7. Custo em % da barra de energia; evolui até o nível 5 (!subir 7)."},
        ["Santuário"] = {id = 9048, name = "Santuário", words = "t8", type = 'Instant', level = 220, mana = 28, soul = 0, maglevel = 0, icon = '', clientId = 46, group = {[1] = 55000}, needTarget = false, parameter = false, range = -1, exhaustion = 55000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 8. Custo em % da barra de energia; evolui até o nível 5 (!subir 8)."},
        ["Jardim Vivo"] = {id = 9030, name = "Jardim Vivo", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 5, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {4}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Golpe Bruto"] = {id = 9041, name = "Golpe Bruto", words = "t1", type = 'Instant', level = 1, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 31, group = {[1] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Disparada"] = {id = 9042, name = "Disparada", words = "t2", type = 'Instant', level = 10, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 32, group = {[1] = 9000}, needTarget = false, parameter = false, range = -1, exhaustion = 9000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Sentidos Aguçados"] = {id = 9043, name = "Sentidos Aguçados", words = "t3", type = 'Instant', level = 25, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 33, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Massacre"] = {id = 9044, name = "Massacre", words = "t4", type = 'Instant', level = 45, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 34, group = {[1] = 26000}, needTarget = false, parameter = false, range = -1, exhaustion = 26000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Arremesso Brutal"] = {id = 9045, name = "Arremesso Brutal", words = "t5", type = 'Instant', level = 70, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 35, group = {[1] = 12000}, needTarget = false, parameter = false, range = -1, exhaustion = 12000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 5. Custo em % da barra de energia; evolui até o nível 5 (!subir 5)."},
        ["Pele de Aço"] = {id = 9046, name = "Pele de Aço", words = "t6", type = 'Instant', level = 100, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 36, group = {[3] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 6. Custo em % da barra de energia; evolui até o nível 5 (!subir 6)."},
        ["Terremoto"] = {id = 9047, name = "Terremoto", words = "t7", type = 'Instant', level = 150, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 37, group = {[1] = 24000}, needTarget = false, parameter = false, range = -1, exhaustion = 24000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 7. Custo em % da barra de energia; evolui até o nível 5 (!subir 7)."},
        ["Corte Final"] = {id = 9048, name = "Corte Final", words = "t8", type = 'Instant', level = 220, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 38, group = {[1] = 50000}, needTarget = false, parameter = false, range = -1, exhaustion = 50000, premium = false, vocations = {7}, special = false, source = 0, description = "Técnica ativa 8. Custo em % da barra de energia; evolui até o nível 5 (!subir 8)."},
        ["Golpe Exato"] = {id = 9020, name = "Golpe Exato", words = "ckt", type = 'Instant', level = 1, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 0, group = {[1] = 1000}, needTarget = false, parameter = false, range = -1, exhaustion = 1000, premium = false, vocations = {1, 2, 6, 3, 4}, special = false, source = 0, description = "Golpe exato: use dentro da janela aberta por 3 golpes seguidos."},
        ["Guarda Firme"] = {id = 9031, name = "Guarda Firme", words = "ds", type = 'Instant', level = 1, mana = 15, soul = 0, maglevel = 0, icon = '', clientId = 1, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {1, 2, 6, 3, 4}, special = false, source = 0, description = "Defesa universal: impede a captura de uma EP completa."},
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
