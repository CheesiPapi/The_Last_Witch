//switch (state) {
    //case FarmerState.WANDER:
        //if (p != noone && point_distance(x,y,p.x,p.y) <= vision_range) {
            //state = FarmerState.CHASE;
            //target = p;
        //}
        //wander_behavior();
    //break;
//
    //case FarmerState.CHASE:
        //if (target == noone || !instance_exists(target) || point_distance(x,y,target.x,target.y) > lose_range) {
            //target = noone;
            //state = FarmerState.WANDER;
        //} else {
            //chase_behavior();
        //}
    //break;
//}
//
//
//function move_and_collide(dx, dy) {
    //// Horizontal
    //x += dx;
    //if (place_meeting(x,y,obj_solid)) {
        //while (!place_meeting(x - sign(dx), y, obj_solid)) x -= sign(dx);
        //x -= sign(dx);
        //// bounce or pick new wander direction
        //if (state == FarmerState.WANDER) wander_dir = irandom_range(0,359);
    //}
//
    //// Vertical
    //y += dy;
    //if (place_meeting(x,y,obj_solid)) {
        //while (!place_meeting(x, y - sign(dy), obj_solid)) y -= sign(dy);
        //y -= sign(dy);
        //if (state == FarmerState.WANDER) wander_dir = irandom_range(0,359);
    //}
//}


if (alarm[1] >= 0)
{
    target_x = x + kb_x;
    target_y = y + kb_y;
}

var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);



move_and_collide(_hor * move_speed, _ver * move_speed, [tileMap, obj_enemy_parent]);
