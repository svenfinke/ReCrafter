/// @description Insert description here
// You can write your code in this editor
var button_text = "Sell"
if obj_currency != undefined {
	button_text = "Sell for " + string(obj_item.calculate_value()) + " Gold"
}

draw_self();
draw_set_font(fnt_kenney_mini);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(x + sprite_width / 2, y + sprite_height / 2, button_text);

// Reset values
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);