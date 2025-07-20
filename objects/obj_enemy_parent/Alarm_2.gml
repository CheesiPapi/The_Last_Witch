if (is_dead) {
    // Respawn a new enemy
    var _new_enemy = instance_create_layer(respawn_x, respawn_y, "Instances", object_index);
    
    // Reset variables for the new instance
    _new_enemy.respawn_delay = respawn_delay;
    _new_enemy.is_dead = false;
}