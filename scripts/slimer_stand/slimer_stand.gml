sprite_index = spr_slimer_idle
mask_index = spr_slimer_mask
image_speed = 0.8

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = slimer_jump
	}else{
		state = slimer_fall
	}
}else{ // If on ground
	
	image_xscale = face
}


