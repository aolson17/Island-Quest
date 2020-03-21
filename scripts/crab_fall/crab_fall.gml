sprite_index = spr_crabby_air
mask_index = spr_crabby_mask
image_speed = .6

if prev_state != state{
	image_index = 0
}
prev_state = state

if place_meeting(x,y+1,par_solid){ // If on ground
	if xsp = 0{
		state = crab_stand
	}else{
		state = crab_run
	}
	
	image_xscale = face
}

