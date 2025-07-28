function unlock_spell(spell_name) {
    if (ds_map_exists(global.spells, spell_name)) {
        var spell = global.spells[spell_name];
        if (!spell.unlocked) {
            spell.unlocked = true;
            ds_list_add(global.unlocked_spells, spell_name);
            
            // Show unlock notification
            instance_create_layer(0, 0, "UI", obj_notification, {
                message: "Spell Unlocked: " + spell.name,
                duration: 180
            });
            
            // Play sound
            audio_play_sound(snd_spell_unlock, 0, false);
        }
    }
}