image_blend = c_white;

if (hp<= 0)
{
    instance_destroy();
    
    obj_player.add_xp(xp_value);
    
    // In obj_enemy’s Destroy Event
    if (irandom(1) == 0) { // 50% chance to drop
        instance_create_layer(x, y, "Items", obj_health_potion);
}
}