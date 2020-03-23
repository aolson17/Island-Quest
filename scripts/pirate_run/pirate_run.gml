sprite_index = spr_pirate_run
mask_index = spr_pirate_mask
image_speed = abs(run_image_speed_factor*xsp)

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = pirate_fall
}else{ // If on ground
	
	
	if xsp = 0 && move = 0{
		state = pirate_stand
	}
	
	image_xscale = face
}






