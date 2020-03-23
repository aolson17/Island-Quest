sprite_index = spr_pirate_idle
mask_index = spr_pirate_mask
image_speed = .4

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = pirate_fall
}else{ // If on ground
	
	if abs(xsp) > 0{
		state = pirate_run
	}
	
	image_xscale = face
}


