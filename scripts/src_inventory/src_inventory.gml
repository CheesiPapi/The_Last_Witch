
function inventory_add(_item) {
    for (var i = 0; i < inventory_max_slots; i++) {
        if (inventory[i] == noone) { // If slot is empty
            inventory[i] = _item;    // Assign item
            return true;             // Success
        }
    }
    return false; // Inventory full
}