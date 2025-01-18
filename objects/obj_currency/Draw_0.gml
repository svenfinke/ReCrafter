var offset_left = 10
var offset_top = 10
var line_height = 15
var current_line = 0
var offset_text = 30

draw_self()
draw_set_color(c_black);

draw_sprite(spr_coin_stack, 0, x + offset_left, y + offset_top + current_line * line_height)
draw_text(x + offset_text, y + offset_top + current_line * line_height - 2, string(currencies.gold))
current_line += 1

draw_set_color(c_white);