sprite_index = spr_captain_run
mask_index = spr_captain_mask
image_speed = (run_image_speed_factor*xsp)*face

if prev_state != state{
	image_index = 0
	played_sound = false
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	if image_index = 4 || image_index = 9 && !played_sound{
		played_sound = true
		//var sound = audio_play_sound(snd_walking,0,0)
		//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
	}else{
		played_sound = false
	}
	
	if (xsp = 0 && move = 0){
		state = stand
	}
	
	prev_face = face
	
	image_xscale = face
}






