sprite_index = spr_pirate_attack
image_speed = .6
mask_index = spr_pirate_mask


if prev_state != state{
	image_index = 0
played_sound = false
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = crab_fall
}else{ // If on ground
	if round(image_index) >= 1 && !played_sound{
		played_sound = true
		var sound = audio_play_sound(WeaponsSword_generic_swing_1,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.55,0)
	}
	if image_index > image_number-1{
		state = pirate_stand
	}
	
	image_xscale = face
}


