image_blend = c_white;

if (hp<= 0)  //  Destroys the enemy
{
    instance_destroy();
    
    obj_player.add_xp(xp_value);
    
    var _drop_chance = irandom(100);  //  Random Number 0-100
    if (_drop_chance < 50) {
    // 50% chance: No drop
    } else if (_drop_chance < 80) { // 30% chance (50-80)
        instance_create_layer(x, y, "Items", obj_sm_health_potion);
    } else if (_drop_chance < 95) { // 15% chance (80-95)
        instance_create_layer(x, y, "Items", obj_med_health_potion);
    } else { // 5% chance (95-100)
        instance_create_layer(x, y, "Items", obj_lar_health_potion);
    }
    
    // Destroy Event
    // Save death position and trigger respawn
    respawn_x = x;
    respawn_y = y;
    is_dead = true;
    alarm[2] = respawn_delay; // Start respawn countdown
}