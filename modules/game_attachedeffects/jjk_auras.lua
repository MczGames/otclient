-- Projeto JJK: auras de buff das tecnicas ativas, presas ao personagem pelo servidor (creature:attachEffectById) enquanto o buff dura.
-- O id do efeito preso e o mesmo id do efeito no appearances (aura_<classe>, desenhado por tools/assets/desenhar_efeitos_hd.py,
-- animacao em laco). Ids em data/balanceamento.json -> efeitos.tecnicas.aura_*.
local AURAS = {
    [232] = 'Aura - Lutador',
    [233] = 'Aura - Mestre das Armas',
    [234] = 'Aura - Mestre das Tecnicas',
    [235] = 'Aura - Controlador',
    [236] = 'Aura - Suporte',
    [237] = 'Aura - Restringido'
}

for id, nome in pairs(AURAS) do
    AttachedEffectManager.register(id, nome, id, ThingCategoryEffect, {})
end
