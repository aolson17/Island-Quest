
if !surface_exists(arm_surf){
	arm_surf = surface_create(80,80)
}

color_offset = c_white
if invincible{
	color_offset = c_red
}

if !death{
	draw_sprite_ext(sprite_index,image_index,(x),round(y),image_xscale,image_yscale,image_angle,color_offset,image_alpha)
	
	if face = 1{
		var angle_dif = angle_difference(aim_dir,0)
	}else{
		var angle_dif = -angle_difference(aim_dir,180)
	}
	
	var head_pos_x = (x)-face*0
	var head_pos_y = round(y)-4
	
	var body_sprite = spr_captain
	var hand_image = 0
	if abs(angle_dif) > 140{
		body_sprite = spr_captain//spr_player_body_back
		hand_image = 1
	}
	
	//draw_sprite_ext(body_sprite,0,(x),round(y),image_xscale,image_yscale,image_angle,color_offset,image_alpha)
	
	if gun = guns.pistol{
		//draw_sprite_ext(spr_player_back_hand,hand_image,x+face*6,round(y),image_xscale,image_yscale,image_angle,color_offset,image_alpha)
	}
	/*
	if abs(angle_dif) > 140 && gun = guns.pistol{
		draw_sprite_ext(spr_player_head_back,0,head_pos_x,head_pos_y,image_xscale,image_yscale,image_angle,color_offset,image_alpha)
	}else if angle_dif > 32{
		draw_sprite_ext(spr_player_head,1,head_pos_x,head_pos_y,image_xscale,image_yscale,image_angle,color_offset,image_alpha)
	}else if angle_dif < -32{
		draw_sprite_ext(spr_player_head,2,head_pos_x,head_pos_y,image_xscale,image_yscale,image_angle,color_offset,image_alpha)
	}else{
		draw_sprite_ext(spr_player_head,0,head_pos_x,head_pos_y,image_xscale,image_yscale,image_angle,color_offset,image_alpha)
	}*/
	
	if state = aiming{
		scr_draw_arm()
	}
	
}else{ // If dead
	
	
	
	
	
	
}



/*if keyboard_check(ord("E")){
	var mask = mask_index
	mask_index = spr_player_drop_kick
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
	mask_index = mask
}