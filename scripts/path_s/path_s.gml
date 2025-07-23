/// @function walk_to_point(x, y)
/// @description Interrupts path to walk to coordinates, then resumes

// Save current path state if following one
if (path_get_index() != -1) {
    current_path = path_get_index();
    path_position_saved = path_position;
    
    path_end();
}

// Set walking state
walking_to_point = true;
target_x = argument0;
target_y = argument1;