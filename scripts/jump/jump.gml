sprite_index = spr_captain_jump
mask_index = spr_captain_mask
image_speed = .3

if prev_state != state{
	image_index = 0
	//var sound = audio_play_sound(snd_jump,0,0)
	//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp > 0{
		state = fall
	}
	
}else{ // If on ground
	
	if xsp = 0{
		state = stand
	}else{
		state = run
	}
	
	image_xscale = face
}






