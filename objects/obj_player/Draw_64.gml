//  HP and XP Bars  //

draw_set_color(c_gray);
var _dx = 16;
var _dy = 16;
var _barw = 256;
var _barh = 32;

//  Properties
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//  Healthbar
var _health_barw = _barw * (hp / hp_total);

draw_sprite_stretched(spr_box, 0, _dx, _dy, _barw, _barh);
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _health_barw, _barh, c_red, 0.6);

draw_text(_dx + _barw / 2, _dy + _barh / 2, "HP");

//  XP
var _xp_barw = _barw * (xp / xp_require);
_dy =+ _barh + 16;

draw_sprite_stretched(spr_box, 0,_dx, _dy, _barw, _barh);
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _xp_barw, _barh, c_blue,0.6);

draw_text(_dx +_barw / 2, _dy + _barh / 2, $"LEVEL {level}");

//
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Inventory  //

//  variables for the inventory
var _xstart = 500 * 3;
var _ystart = 40;
var _slot_size = 50;
var _recw = 400;
var _xend = _xstart + 400;
var _yend = _slot_size * (inventory_max_slots);
var _boarder_margin = 10;


// draw background
draw_set_color(c_black);
draw_sprite_stretched_ext(spr_box, 0, _xstart, _ystart, _recw, _yend + 10, c_black, 0.3);  //  inventory rectangle black
draw_set_color(c_white); //  text in inventory white

//  Draw slots and items
for (var i = 0; i < inventory_max_slots; i++) {
    var _ypos = _ystart + (i * _slot_size);
    
   
    // Highlight selected slot 
    if (i == selected_slot) {
        draw_rectangle_color(
        _xstart + _boarder_margin, 
        _ypos + _boarder_margin, 
        _xend - _boarder_margin,  
        _ypos + _slot_size, 
        c_yellow, c_yellow, c_yellow, c_yellow, true);
}
    
    //  draw item text
    if (inventory[i] != noone) {
        draw_text(_xstart + _boarder_margin, _ypos + _boarder_margin, inventory[i]);
    }
    
    //  draw slot boarder
    draw_rectangle_color(_xstart, _ystart, _xend, _slot_size * (inventory_max_slots + 1), c_blue, c_blue, c_blue, c_blue, true);
    
}