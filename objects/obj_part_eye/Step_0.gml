
if !place_meeting(x,y+1,par_solid){ // Apply gravity
	if !place_meeting(x,y+1,obj_player){
		ysp += grav_speed
	}
	falling = true
	sprite_index = spr_slimer_eyeball_fall
}else{ // Apply Friction
	sprite_index = spr_slimer_eyeball_land
	mask_index = spr_slimer_eyeball_fall
	if falling { // If previously falling
		image_index = 0
		//var sound = audio_play_sound(snd_box_fall,0,0)
		//audio_sound_gain(sound,global.master_volume*global.sound_volume,0)
	}
	falling = false
	xsp *= .9
}
y = round(y)

if !done{
	scr_collision()
}else{
	ysp += grav_speed
	y += ysp
	sprite_index = spr_slimer_eyeball_fall
}