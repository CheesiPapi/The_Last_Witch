/// Spawner Create
spawn_interval_base = 3 * room_speed; // 3 seconds
spawn_interval_min  = 0.75 * room_speed;
spawn_interval      = spawn_interval_base;

time_until_spawn = spawn_interval;
enemy_cap        = 12;
enemies_spawned  = 0;

difficulty_timer = 0;
difficulty_step  = 10 * room_speed; // every 10 seconds, increase difficulty

// Predefine possible spawn zones (rectangles) OR points
spawn_regions = [
    // each entry: [x1, y1, x2, y2]
    [0, 0, 256, 256],
    [room_width-256, 0, room_width, 256],
    [0, room_height-256, 256, room_height],
    [room_width-256, room_height-256, room_width, room_height]
];

// If you want fixed points instead, you could use an array of structs with x,y.

if (instance_number(obj_farmer) < enemy_cap) {
    time_until_spawn--;
    if (time_until_spawn <= 0) {
        show_debug_message("Spawning a farmer!");
        spawn_farmer();
        time_until_spawn = spawn_interval;
    }
}
