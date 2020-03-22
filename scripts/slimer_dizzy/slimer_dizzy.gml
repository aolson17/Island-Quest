sprite_index = spr_slimer_dizzy
mask_index = spr_slimer_mask
image_speed = 0.4

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	
}else{ // If on ground
	
}


