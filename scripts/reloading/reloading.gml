sprite_index = spr_captain_reloading
mask_index = spr_captain_mask
image_speed = .5

if prev_state != state{
	image_index = 0
}
prev_state = state

if move != 0{
	state = stand
}



if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	
	if image_index > image_number-1 && !attack_key{
		if shoot_key{
			state = aiming
		}else{
			state = stand
		}
	}
}


