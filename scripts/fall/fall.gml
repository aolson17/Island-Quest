sprite_index = spr_captain_fall
mask_index = spr_captain_mask
image_speed = .6

if prev_state != state{
	alarm[8] = coyote_jump_frames // Start timer to end coyote jump ability
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}
	
	face = image_xscale
}else{ // If on ground
	//var sound = audio_play_sound(snd_landing,0,0)
	//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
	if xsp = 0{
		state = stand
	}else{
		state = run
	}
	
	image_xscale = face
}

prev_ysp = ysp

