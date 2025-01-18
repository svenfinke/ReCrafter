/// @description Insert description here
// You can write your code in this editor
var offset_left = 10
var offset_top = 10
var line_height = 15
var current_line = 0

if (current_item == undefined) {
	return
}

draw_self();
draw_set_font(fnt_kenney_mini);
draw_set_color(c_black);


draw_set_color(c_black);

draw_text(x + offset_left, y + offset_top + current_line * line_height, current_item.item_name);
current_line += 1

draw_set_color(c_grey);

draw_text(x + offset_left, y + offset_top + current_line * line_height, "---");
current_line += 1

draw_text(x + offset_left, y + offset_top + current_line * line_height, "Item Level: " + string(current_item.item_level));
current_line += 1

for (var i = 0; i < array_length(current_item.implicits); i++) {
	draw_text(x + offset_left, y + offset_top + current_line * line_height, current_item.implicits[i]);
	current_line += 1
}

draw_text(x + offset_left, y + offset_top + current_line * line_height, "---");
current_line += 1

draw_text(x + offset_left, y + offset_top + current_line * line_height, "Rarity: " + rarity_strings[current_item.rarity]);
current_line += 1

for (var i = 0; i < array_length(current_item.prefixes); i++) {
	draw_text(x + offset_left, y + offset_top + current_line * line_height, current_item.prefixes[i]);
	current_line += 1
}
for (var i = 0; i < array_length(current_item.suffixes); i++) {
	draw_text(x + offset_left, y + offset_top + current_line * line_height, current_item.suffixes[i]);
	current_line += 1
}

draw_text(x + offset_left, y + offset_top + current_line * line_height, "---");
current_line += 1

draw_set_color(c_black);
draw_text(x + offset_left, y + offset_top + current_line * line_height, "Sell for " + string(current_item.base_price));
current_line += 1


// Reset values
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);