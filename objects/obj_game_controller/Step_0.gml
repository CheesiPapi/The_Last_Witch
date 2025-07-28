// Check for spell unlocks every frame
check_spell_unlocks();

// Example progression triggers (you'd call these when events happen)
if (keyboard_check_pressed(ord("L"))) {
    // Debug: Level up
    global.player_level++;
    show_debug_message("Level up! Now level " + string(global.player_level));
}

if (keyboard_check_pressed(ord("B"))) {
    // Debug: Beat boss 1
    if (!ds_list_find_index(global.bosses_defeated, "boss_1") >= 0) {
        ds_list_add(global.bosses_defeated, "boss_1");
        show_debug_message("Boss 1 defeated!");
    }
}