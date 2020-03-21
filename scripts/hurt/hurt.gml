sprite_index = spr_captain_hurt
mask_index = spr_captain_mask
image_speed = .3

if prev_state != state{
	image_index = 0
	instance_create_layer(x+face*6,y-4,"Bullets",obj_heart_crack)
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	
}else{ // If on ground
	if image_index > image_number-1{
		image_speed = 0
		
		state = stand
	}
	
	image_xscale = face
}


