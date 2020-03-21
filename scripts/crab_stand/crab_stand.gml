sprite_index = spr_crabby_walk
mask_index = spr_crabby_mask
image_speed = 0

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = crab_fall
}else{ // If on ground
	
	if abs(xsp) > 0{
		state = crab_run
	}
	
	image_xscale = face
}


