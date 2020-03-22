if bullets > 0{
	sprite_index = spr_captain_aim_down
}else{
	sprite_index = spr_captain
}
mask_index = spr_captain_mask
image_speed = .2

if prev_state != state{
	image_index = 0
}
prev_state = state

if !shoot_key && !gun_fired{
	state = stand
}

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	
	
	image_xscale = face
}


