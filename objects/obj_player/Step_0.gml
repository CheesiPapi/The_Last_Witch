var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_hor * move_speed, _ver *move_speed, tileMap, undefined, undefined, undefined, move_speed, move_speed); 

if (_hor != 0 or _ver != 0)
{
    if (_ver > 0) sprite_index = Witch_Walk_Down;  //  vertical down is +y axis move speed
    else if (_ver < 0) sprite_index = Witch_Walk_Up;  //  vertical up is -y axis move speed
    else if (_hor > 0) sprite_index = Witch_Walk_Right;  //  horizontal right is +x axis move speed
    else if (_hor < 0) sprite_index = Witch_Walk_Left;  //  horizontal left is -x axis move speed
        
    facing = point_direction(0, 0, _hor, _ver);
}
else 
{
    if (sprite_index == Witch_Walk_Down) sprite_index = Witch_Look_Down;  // if the sprite has been walking down, the idle matches down
    else if (sprite_index == Witch_Walk_Up) sprite_index = Witch_Look_Up;  //  same for up
    else if (sprite_index == Witch_Walk_Right) sprite_index =Witch_Look_Right;  //  same for right
    else if (sprite_index == Witch_Walk_Left) sprite_index = Witch_Look_Left;  //  and finally left
}

if (keyboard_check_pressed(vk_space))
{
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage; 
}