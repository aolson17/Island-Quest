



draw_self()

scr_draw_outline(x-3,y-4+y_offset,"?",c_white,obj_control_menu.dark,1)

if y_offset = 1{
	par_non_help_menu.visible = false
	
	draw_set_halign(fa_center)
	
	scr_draw_outline(x,y+30,"Controls",c_white,obj_control_menu.dark,1)
	scr_draw_outline(x,y+50,"A and D to move",c_white,obj_control_menu.dark,1)
	scr_draw_outline(x,y+65,"Space to jump",c_white,obj_control_menu.dark,1)
	scr_draw_outline(x,y+80,"Left click to attack, right click to aim gun",c_white,obj_control_menu.dark,1)
	scr_draw_outline(x,y+95,"F to toggle fullscreen",c_white,obj_control_menu.dark,1)
	scr_draw_outline(x,y+110,"R to restart",c_white,obj_control_menu.dark,1)
	scr_draw_outline(x,y+125,"Don't get hit by enemies",c_white,obj_control_menu.dark,1)
	scr_draw_outline(x,y+140,"Warning! No Saving",c_white,obj_control_menu.dark,1)
	
	draw_set_halign(fa_left)

}else{
	par_non_help_menu.visible = true
}
