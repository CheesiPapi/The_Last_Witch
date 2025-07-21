function spawn_farmer() {
    // Pick random region
    var region = choose_array(spawn_regions); // helper we define below or just do spawn_regions[irandom(array_length(spawn_regions)-1)];

    var x1 = region[0], y1 = region[1];
    var x2 = region[2], y2 = region[3];

    var sx = irandom_range(x1, x2);
    var sy = irandom_range(y1, y2);

    // (Optional) ensure not too close to player
    var p = instance_exists(obj_player) ? instance_find(obj_player,0) : noone;
    if (p != noone) {
        var min_dist = 96;
        var safety_loops = 0;
        while (point_distance(sx, sy, p.x, p.y) < min_dist && safety_loops < 10) {
            sx = irandom_range(x1, x2);
            sy = irandom_range(y1, y2);
            safety_loops++;
        }
    }

    instance_create_layer(sx, sy, "Enemies", obj_farmer);
}

_time_keep = 30;  //  fps

/// Spawner Create
spawn_interval_base = 3 * _time_keep; // 3 seconds
spawn_interval_min  = 0.75 * _time_keep;
spawn_interval      = spawn_interval_base;

time_until_spawn = spawn_interval;
enemy_cap        = 12;
enemies_spawned  = 0;

difficulty_timer = 0;
difficulty_step  = 10 * _time_keep; // every 10 seconds, increase difficulty

// Predefine possible spawn zones (rectangles) OR points
spawn_regions = [
    // each entry: [x1, y1, x2, y2]
    [0, 0, 256, 256],
    [room_width-256, 0, room_width, 256],
    [0, room_height-256, 256, room_height],
    [room_width-256, room_height-256, room_width, room_height]
];

// If you want fixed points instead, you could use an array of structs with x,y.

