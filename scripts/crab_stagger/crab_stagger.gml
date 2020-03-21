sprite_index = spr_crabby_hurt
image_speed = .4
mask_index = spr_crabby_mask

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	
}else{ // If on ground
	
	state = crab_run
	
	image_xscale = face
}


