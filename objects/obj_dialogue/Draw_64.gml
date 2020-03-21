

if global.in_dialogue{
	var data = ds_list_find_value(dialogue,0)
	draw_sprite_ext(spr_dialogue_box,0,box_x,box_y,scale,scale,0,c_white,1) // Draw the scaled box sprite
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white)
	draw_set_font(data[info.font]) // Change to the desired font
	var portrait_image_index = 1
	if total_text > text_position{
		portrait_image_index = irandom(1)
	}
	draw_sprite_ext(data[info.portrait],portrait_image_index,portrait_x,portrait_y,scale,scale,0,c_white,1) // Draw the scaled portrait
	draw_text_ext(text_x,text_y,text,text_line_sep,-1)
	draw_set_font(global.font) // Change back to the normal font so it doesn't mess with text in other parts of the game
}