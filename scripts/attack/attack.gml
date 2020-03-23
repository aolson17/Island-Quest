sprite_index = spr_captain_slash_ground
image_speed = .9
mask_index = spr_captain_mask


if prev_state != state{
played_sound = false
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = fall
}else{ // If on ground
	if round(image_index) >= 1 && !played_sound{
		played_sound = true
		var sound = audio_play_sound(WeaponsSword_generic_swing_1,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.55,0)
	}
	if image_index > image_number-1{
		if xsp = 0{
			state = stand
		}else{
			state = run
		}
	}
	
	image_xscale = face
}


