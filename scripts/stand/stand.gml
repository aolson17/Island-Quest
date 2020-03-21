sprite_index = spr_captain
mask_index = spr_captain_mask
image_speed = .2

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	
	if xsp != 0{
		state = run
	}
	
	image_xscale = face
}


