/// Farmer Step
var p = instance_exists(obj_player_nbranch) ? instance_find(obj_player_nbranch,0) : noone;

switch (state) {
    case FarmerState.WANDER:
        if (p != noone && point_distance(x,y,p.x,p.y) <= vision_range) {
            state = FarmerState.CHASE;
            target = p;
        }
        wander_behavior();
    break;

    case FarmerState.CHASE:
        if (target == noone || !instance_exists(target) || point_distance(x,y,target.x,target.y) > lose_range) {
            target = noone;
            state = FarmerState.WANDER;
        } else {
            chase_behavior();
        }
    break;
}


function move_and_collide(dx, dy) {
    // Horizontal
    x += dx;
    if (place_meeting(x,y,obj_solid)) {
        while (!place_meeting(x - sign(dx), y, obj_solid)) x -= sign(dx);
        x -= sign(dx);
        // bounce or pick new wander direction
        if (state == FarmerState.WANDER) wander_dir = irandom_range(0,359);
    }

    // Vertical
    y += dy;
    if (place_meeting(x,y,obj_solid)) {
        while (!place_meeting(x, y - sign(dy), obj_solid)) y -= sign(dy);
        y -= sign(dy);
        if (state == FarmerState.WANDER) wander_dir = irandom_range(0,359);
    }
}
