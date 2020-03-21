
if face = 1{
	var angle_dif = angle_difference(aim_dir,0)
}else{
	var angle_dif = -angle_difference(aim_dir,180)
}

surface_set_target(arm_surf)
draw_clear_alpha(c_black,0)

if gun = guns.pistol{
	var arm_sprite = spr_player_arm
	var arm_yscale = 1
	var arm_turn_offset = 0
	if abs(angle_dif) > 140{
		arm_sprite = spr_player_arm_back
		arm_yscale = -1
		arm_turn_offset = 1
	}
}else if gun = guns.shotgun{
	var arm_sprite = spr_player_shotgun
	var arm_yscale = 1
	var arm_turn_offset = 0
}else if gun = guns.rifle{
	var arm_sprite = spr_player_rifle
	var arm_yscale = 1
	var arm_turn_offset = 0
}

if face = 1{
	var dir = aim_dir
	draw_sprite_ext(arm_sprite,0,40-arm_turn_offset,40,1,arm_yscale,dir,c_white,1)
	if flash{
		draw_sprite_ext(spr_muzzle_flash,0,40+lengthdir_x(gun_length[gun],dir),40+lengthdir_y(gun_length[gun],dir),1,1,dir,c_white,1)
	}
}else{
	var dir = aim_dir+180
	draw_sprite_ext(arm_sprite,0,40+arm_turn_offset,40,-1,arm_yscale,dir,c_white,1)
	if flash{
		draw_sprite_ext(spr_muzzle_flash,0,40-lengthdir_x(gun_length[gun],dir),40-lengthdir_y(gun_length[gun],dir),-1,1,dir,c_white,1)
	}
}
	
surface_reset_target()
draw_surface_ext(arm_surf,x-40+face*0,y-40,1,1,0,color_offset,1)


