function check_spell_unlocks() {
    var spell_keys = ds_map_find_first(global.spells);
    
    while (!is_undefined(spell_keys)) {
        var spell = global.spells[? spell_keys];
        
        if (!spell.unlocked && global.player_level >= 3 && spell_keys == "fireball") {
            spell.unlocked = true;
        }
        
        spell_keys = ds_map_find_next(global.spells, spell_keys);
    }
}