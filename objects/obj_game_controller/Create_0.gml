// Initialize global game variables
global.game_initialized = false;
global.player_level = obj_player.level;
global.player_exp = obj_player.xp;
global.player_max_health = obj_player.hp_total;
global.player_health = obj_player.hp;
global.player_max_mana = obj_player.mana_total;
global.player_mana = obj_player.mana;

// Game progression flags
global.bosses_defeated = ds_list_create();
global.quests_completed = ds_list_create();

// Initialize spells map
global.spells = ds_map_create();



// Create spell constructor
function Spell(_name, _damage, _mana_cost, _cooldown, _unlock_requirement, _icon) constructor {
    name = _name;
    damage = _damage;
    mana_cost = _mana_cost;
    cooldown = _cooldown;
    unlock_requirement = _unlock_requirement;
    unlocked = false;
    icon = _icon;
}

unlocked_spells = [];

// Set persistent so it survives room changes
persistent = true;
global.game_initialized = true;

