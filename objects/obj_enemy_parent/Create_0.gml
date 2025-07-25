target_x = x;
target_y = y;

alarm[0] = 60;

tileMap = layer_tilemap_get_id("Tiles_Col");

//  knockback
kb_x = 0;
kb_y = 0;

// Initialize respawn variables
respawn_delay = 15 * 30; // 15 seconds (30 FPS)
respawn_x = x; // Save initial spawn position
respawn_y = y;
is_dead = false; // Track death state

enum FarmerState {
    WANDER,
    CHASE
}

/// Farmer Create
state = FarmerState.WANDER;

wander_speed = 1.2;
chase_speed  = 2.2;

wander_dir      = irandom_range(0,359);
wander_change_t = irandom_range(30, 90); // frames until next direction change

vision_range = 180;
lose_range   = 220;  // hysteresis

target = noone; // player instance if seen

// (Optional) separate timers
blink_timer = 0; // for animation variation, etc.

function wander_behavior() {
    wander_change_t--;
    if (wander_change_t <= 0) {
        // Nudge direction randomly
        wander_dir += irandom_range(-60, 60);
        wander_change_t = irandom_range(30, 90);
    }

    var spd = wander_speed;
    var dx = lengthdir_x(spd, wander_dir);
    var dy = lengthdir_y(spd, wander_dir);
    move_and_collide(dx, dy, obj_player);
}

function chase_behavior() {
    if (target != noone) {
        var dir = point_direction(x,y,target.x,target.y);
        var dx = lengthdir_x(chase_speed, dir);
        var dy = lengthdir_y(chase_speed, dir);
        move_and_collide(dx, dy, obj_player);
    }
}
