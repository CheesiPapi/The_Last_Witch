target_x = x;
target_y = y;

alarm[0] = 60;

tileMap = layer_tilemap_get_id("Tiles_Col");

//  knockback
kb_x = 0;
kb_y = 0;

// In Create Event add:
move_timer = 0;
move_delay = 15; // Frames between moves

// Initialize respawn variables
respawn_delay = 15 * 30; // 15 seconds (30 FPS)
respawn_x = x; // Save initial spawn position
respawn_y = y;
is_dead = false; // Track death state

