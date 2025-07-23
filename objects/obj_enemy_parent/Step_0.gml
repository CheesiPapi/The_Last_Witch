//if (alarm[1] >= 0)
//{
    //target_x = x + kb_x;
    //target_y = y + kb_y;
//}

//// In Step Event:
//var player = obj_player;
//var distance_to_player = point_distance(x, y, player.x, player.y);
//var distance_to_point_x = 0;
//var distance_to_point_y = 0;
//
//
//if (distance_to_player <= detection_range) {
    //// Break from path if following one
    //distance_to_point_x = x; 
    //distance_to_point_y = y;
    //if (path_get_index() != -1) {
        //current_path_index = path_get_index();
        //path_end();
        //
        //was_following_path = true;
    //}
    //
    //// Smooth walking pursuit
    //var dir = point_direction(x, y, player.x, player.y);
    //x += lengthdir_x(pursuit_speed, dir);
    //y += lengthdir_y(pursuit_speed, dir);
//}
//else if (distance_to_player > detection_range) {
    //// Return 
    //x += lengthdir_x(move_speed, distance_to_point_x);
    //y += lengthdir_y(move_speed, distance_to_point_y);
//}

var player = obj_player;
var distance_to_player = point_distance(x, y, player.x, player.y);

if (path_s.walking_to_point && point_distance(x, y, target_x, target_y) < reach_threshold) {
    
    path_s.walking_to_point = false;
    
    // Resume path if we had one
    if (current_path != noone) {
        path_start(current_path, move_speed, current_path, true);
        path_position = path_position_saved;
        
        // Verify the path exists in the game assets first
        if (!path_exists(current_path)) {
            // Fallback: Pick a new random path if old one was deleted
            current_path = possible_paths[irandom(array_length(possible_paths)-1)];
            path_start(current_path, move_speed, path_action_restart, true);
        }
        current_path = noone;
    }
}