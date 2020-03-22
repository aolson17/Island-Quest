sprite_index = spr_slimer_jump
mask_index = spr_slimer_mask
image_speed = .8

if prev_state != state{
	image_index = 0
}
prev_state = state

if place_meeting(x,y+1,par_solid){ // If on ground
	state = slimer_stand
	
	image_xscale = face
}else{
	if ysp > 0{
		state = slimer_fall
	}
}

