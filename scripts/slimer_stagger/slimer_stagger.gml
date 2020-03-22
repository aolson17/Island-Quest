sprite_index = spr_slimer_hurt
image_speed = .8
mask_index = spr_slimer_mask

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	
}else{ // If on ground
	
	state = slimer_stand
	
	image_xscale = face
}


