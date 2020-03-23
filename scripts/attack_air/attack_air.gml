sprite_index = spr_captain_slash_air
image_speed = .8
mask_index = spr_captain_mask

played_sound = false

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	
	if round(image_index) >= 1 && !played_sound{
		played_sound = true
		var sound = audio_play_sound(WeaponsSword_generic_swing_2,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.55,0)
	}
	if image_index > image_number-1{
		state = fall
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


