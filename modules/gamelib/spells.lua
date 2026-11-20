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
        ["Maré Baixa"] = {id = 9001, name = "Maré Baixa", words = "tecn1", type = 'Instant', level = 1, mana = 30, soul = 0, maglevel = 0, icon = '', clientId = 35, group = {[1] = 4000}, needTarget = false, parameter = false, range = -1, exhaustion = 4000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Vaga Funda"] = {id = 9006, name = "Vaga Funda", words = "tecb1", type = 'Instant', level = 15, mana = 70, soul = 0, maglevel = 0, icon = '', clientId = 36, group = {[1] = 8000}, needTarget = false, parameter = false, range = -1, exhaustion = 8000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Impacto Duplo"] = {id = 9041, name = "Impacto Duplo", words = "t1", type = 'Instant', level = 1, mana = 5, soul = 0, maglevel = 0, icon = '', clientId = 23, group = {[1] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Investida Curta"] = {id = 9042, name = "Investida Curta", words = "t2", type = 'Instant', level = 10, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 24, group = {[1] = 10000}, needTarget = false, parameter = false, range = -1, exhaustion = 10000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Sequencia de Golpes"] = {id = 9043, name = "Sequencia de Golpes", words = "t3", type = 'Instant', level = 25, mana = 12, soul = 0, maglevel = 0, icon = '', clientId = 25, group = {[1] = 18000}, needTarget = false, parameter = false, range = -1, exhaustion = 18000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Foco de Combate"] = {id = 9044, name = "Foco de Combate", words = "t4", type = 'Instant', level = 45, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 26, group = {[3] = 40000}, needTarget = false, parameter = false, range = -1, exhaustion = 40000, premium = false, vocations = {1}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Arena Final"] = {id = 9030, name = "Arena Final", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 6, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {1}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Arremesso Certeiro"] = {id = 9002, name = "Arremesso Certeiro", words = "tecn2", type = 'Instant', level = 1, mana = 25, soul = 0, maglevel = 0, icon = '', clientId = 31, group = {[1] = 3000}, needTarget = false, parameter = false, range = -1, exhaustion = 3000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Chuva de Ferro"] = {id = 9007, name = "Chuva de Ferro", words = "tecb2", type = 'Instant', level = 15, mana = 60, soul = 0, maglevel = 0, icon = '', clientId = 32, group = {[1] = 6000}, needTarget = false, parameter = false, range = -1, exhaustion = 6000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Lancamento"] = {id = 9041, name = "Lancamento", words = "t1", type = 'Instant', level = 1, mana = 4, soul = 0, maglevel = 0, icon = '', clientId = 15, group = {[1] = 4000}, needTarget = false, parameter = false, range = -1, exhaustion = 4000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Troca Rapida"] = {id = 9042, name = "Troca Rapida", words = "t2", type = 'Instant', level = 10, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 16, group = {[3] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Corrente de Ferro"] = {id = 9043, name = "Corrente de Ferro", words = "t3", type = 'Instant', level = 25, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 17, group = {[1] = 14000}, needTarget = false, parameter = false, range = -1, exhaustion = 14000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Chuva de Laminas"] = {id = 9044, name = "Chuva de Laminas", words = "t4", type = 'Instant', level = 45, mana = 15, soul = 0, maglevel = 0, icon = '', clientId = 18, group = {[1] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {2}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Arsenal Aberto"] = {id = 9030, name = "Arsenal Aberto", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 4, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {2}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Chamado das Sombras"] = {id = 9003, name = "Chamado das Sombras", words = "tecn3", type = 'Instant', level = 1, mana = 60, soul = 0, maglevel = 0, icon = '', clientId = 33, group = {[3] = 20000}, needTarget = false, parameter = false, range = -1, exhaustion = 20000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Coro de Sombras"] = {id = 9008, name = "Coro de Sombras", words = "tecb3", type = 'Instant', level = 15, mana = 120, soul = 0, maglevel = 0, icon = '', clientId = 34, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Sombra Leve"] = {id = 9041, name = "Sombra Leve", words = "t1", type = 'Instant', level = 1, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 19, group = {[3] = 15000}, needTarget = false, parameter = false, range = -1, exhaustion = 15000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Sombra Bruta"] = {id = 9042, name = "Sombra Bruta", words = "t2", type = 'Instant', level = 10, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 20, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Sombra Atiradora"] = {id = 9043, name = "Sombra Atiradora", words = "t3", type = 'Instant', level = 25, mana = 15, soul = 0, maglevel = 0, icon = '', clientId = 21, group = {[3] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Uniao de Sombras"] = {id = 9044, name = "Uniao de Sombras", words = "t4", type = 'Instant', level = 45, mana = 20, soul = 0, maglevel = 0, icon = '', clientId = 22, group = {[3] = 45000}, needTarget = false, parameter = false, range = -1, exhaustion = 45000, premium = false, vocations = {3}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Tropa de Sombras"] = {id = 9030, name = "Tropa de Sombras", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 5, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {3}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Casco Firme"] = {id = 9004, name = "Casco Firme", words = "tecn4", type = 'Instant', level = 1, mana = 35, soul = 0, maglevel = 0, icon = '', clientId = 27, group = {[3] = 20000}, needTarget = false, parameter = false, range = -1, exhaustion = 20000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Casco de Ferro"] = {id = 9009, name = "Casco de Ferro", words = "tecb4", type = 'Instant', level = 15, mana = 80, soul = 0, maglevel = 0, icon = '', clientId = 28, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Selo de Papel"] = {id = 9041, name = "Selo de Papel", words = "t1", type = 'Instant', level = 1, mana = 6, soul = 0, maglevel = 0, icon = '', clientId = 7, group = {[1] = 8000}, needTarget = false, parameter = false, range = -1, exhaustion = 8000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Muralha de Selos"] = {id = 9042, name = "Muralha de Selos", words = "t2", type = 'Instant', level = 10, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 8, group = {[1] = 14000}, needTarget = false, parameter = false, range = -1, exhaustion = 14000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Cupula"] = {id = 9043, name = "Cupula", words = "t3", type = 'Instant', level = 25, mana = 14, soul = 0, maglevel = 0, icon = '', clientId = 9, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Quebra-Selo"] = {id = 9044, name = "Quebra-Selo", words = "t4", type = 'Instant', level = 45, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 10, group = {[1] = 35000}, needTarget = false, parameter = false, range = -1, exhaustion = 35000, premium = false, vocations = {4}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Rede de Selos"] = {id = 9030, name = "Rede de Selos", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 2, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {4}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Fôlego Restaurador"] = {id = 9005, name = "Fôlego Restaurador", words = "tecn5", type = 'Instant', level = 1, mana = 25, soul = 0, maglevel = 0, icon = '', clientId = 29, group = {[2] = 2000}, needTarget = false, parameter = false, range = -1, exhaustion = 2000, premium = false, vocations = {5}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Maré Cheia"] = {id = 9010, name = "Maré Cheia", words = "tecb5", type = 'Instant', level = 15, mana = 90, soul = 0, maglevel = 0, icon = '', clientId = 30, group = {[2] = 8000}, needTarget = false, parameter = false, range = -1, exhaustion = 8000, premium = false, vocations = {5}, special = false, source = 0, description = "Técnica inata da classe."},
        ["Toque Curativo"] = {id = 9041, name = "Toque Curativo", words = "t1", type = 'Instant', level = 1, mana = 8, soul = 0, maglevel = 0, icon = '', clientId = 11, group = {[2] = 5000}, needTarget = false, parameter = false, range = -1, exhaustion = 5000, premium = false, vocations = {5}, special = false, source = 0, description = "Técnica ativa 1. Custo em % da barra de energia; evolui até o nível 5 (!subir 1)."},
        ["Pulso Sombrio"] = {id = 9042, name = "Pulso Sombrio", words = "t2", type = 'Instant', level = 10, mana = 10, soul = 0, maglevel = 0, icon = '', clientId = 12, group = {[1] = 9000}, needTarget = false, parameter = false, range = -1, exhaustion = 9000, premium = false, vocations = {5}, special = false, source = 0, description = "Técnica ativa 2. Custo em % da barra de energia; evolui até o nível 5 (!subir 2)."},
        ["Cura Reversa"] = {id = 9043, name = "Cura Reversa", words = "t3", type = 'Instant', level = 25, mana = 14, soul = 0, maglevel = 0, icon = '', clientId = 13, group = {[2] = 25000}, needTarget = false, parameter = false, range = -1, exhaustion = 25000, premium = false, vocations = {5}, special = false, source = 0, description = "Técnica ativa 3. Custo em % da barra de energia; evolui até o nível 5 (!subir 3)."},
        ["Golpe Vital"] = {id = 9044, name = "Golpe Vital", words = "t4", type = 'Instant', level = 45, mana = 18, soul = 0, maglevel = 0, icon = '', clientId = 14, group = {[1] = 28000}, needTarget = false, parameter = false, range = -1, exhaustion = 28000, premium = false, vocations = {5}, special = false, source = 0, description = "Técnica ativa 4. Custo em % da barra de energia; evolui até o nível 5 (!subir 4)."},
        ["Jardim Vivo"] = {id = 9030, name = "Jardim Vivo", words = "ep", type = 'Instant', level = 1, mana = 40, soul = 0, maglevel = 0, icon = '', clientId = 3, group = {[3] = 60000}, needTarget = false, parameter = false, range = -1, exhaustion = 60000, premium = false, vocations = {5}, special = false, source = 0, description = "Spell principal da classe (área/domínio). Custo em % da barra; no nível 30 abre uma arena."},
        ["Golpe Exato"] = {id = 9020, name = "Golpe Exato", words = "ckt", type = 'Instant', level = 1, mana = 0, soul = 0, maglevel = 0, icon = '', clientId = 0, group = {[1] = 1000}, needTarget = false, parameter = false, range = -1, exhaustion = 1000, premium = false, vocations = {1, 2, 3, 4, 5}, special = false, source = 0, description = "Golpe exato: use dentro da janela aberta por 3 golpes seguidos."},
        ["Guarda Firme"] = {id = 9031, name = "Guarda Firme", words = "ds", type = 'Instant', level = 1, mana = 15, soul = 0, maglevel = 0, icon = '', clientId = 1, group = {[3] = 30000}, needTarget = false, parameter = false, range = -1, exhaustion = 30000, premium = false, vocations = {1, 2, 3, 4, 5}, special = false, source = 0, description = "Defesa universal: impede a captura de uma EP completa."},
    }
}

VocationNames = {
    [0] = 'Nenhuma',
    [1] = "Gingador",
    [2] = "Vigia",
    [3] = "Fundeiro",
    [4] = "Aboiador",
    [5] = "Tecelã",
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
