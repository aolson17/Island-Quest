
draw_self()
if !global.in_dialogue && global.dialogue_ready{
	if point_distance(x,y,obj_player.x,obj_player.y) < obj_dialogue.range{
		draw_set_font(global.font_small)
		draw_set_halign(fa_center)
		scr_draw_outline(x,y-30,"(E to talk)",c_white,c_black,1)
		draw_set_halign(fa_left)
		draw_set_font(global.font)
	}
}
