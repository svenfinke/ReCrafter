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