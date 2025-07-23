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


// Path variables
possible_paths = [Path_1, Path_2, Path_3, Path_4]; // Your path resources
current_path = noone;        // Currently assigned path
was_following_path = false;  // Track if we were following path
move_speed = 1;              // Base movement speed
path_end_action = path_action_restart; // What to do when path ends
current_path_index = -1;     // Tracks which path we're on
path_get_index = 0;

// Pursuit variables
detection_range = 250;       // Pixels to detect player
pursuit_speed = 1;           // Speed when chasing player
return_threshold = 250;      // Distance to return to path
return_cooldown = 0;         // Cooldown timer
return_cooldown_max = 300;    // Frames before returning to path


// Generate random number first
path_choice = irandom_range(1, 4); // For 4 paths

switch (path_choice) {
    case 1:
        path_start(Path_1, move_speed, path_action_stop, false);
        break;
    case 2:
        path_start(Path_2, move_speed, path_action_restart, false);
        break;
    case 3:
        path_start(Path_3, move_speed, path_action_reverse, false);
        break;
    case 4:
        path_start(Path_4, move_speed, path_action_continue, false);
        break;
}
current_path = path_choice;