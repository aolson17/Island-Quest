sprite_index = spr_pirate_jump
mask_index = spr_pirate_mask
image_speed = .6

if prev_state != state{
	image_index = 0
}
prev_state = state

if place_meeting(x,y+1,par_solid){ // If on ground
	var sound = audio_play_sound(Player_landing,0,0)
	audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
	if xsp = 0{
		state = pirate_stand
	}else{
		state = pirate_run
	}
	
	image_xscale = face
}

