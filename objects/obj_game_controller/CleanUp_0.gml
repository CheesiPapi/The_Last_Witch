// Clean up data structures when object is destroyed
if (ds_exists(global.spells, ds_type_map)) {
    ds_map_destroy(global.spells);
}

if (ds_exists(global.unlocked_spells, ds_type_list)) {
    ds_list_destroy(global.unlocked_spells);
}

if (ds_exists(global.bosses_defeated, ds_type_list)) {
    ds_list_destroy(global.bosses_defeated);
}

if (ds_exists(global.quests_completed, ds_type_list)) {
    ds_list_destroy(global.quests_completed);
}