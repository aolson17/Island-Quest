sprite_index = spr_crabby_walk
mask_index = spr_crabby_mask
image_speed = abs(run_image_speed_factor*xsp)

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = crab_fall
}else{ // If on ground
	
	
	if xsp = 0 && move = 0{
		state = crab_stand
	}
	
	image_xscale = face
}






