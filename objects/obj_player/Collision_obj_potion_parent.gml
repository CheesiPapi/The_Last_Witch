// obj_player’s Collision Event with obj_health_potion
if (inventory_add(other.item_name)) { // Use your inventory_add() function
    instance_destroy(other); // Remove the item from the room
    show_debug_message("Picked up: " + other.item_name);
}