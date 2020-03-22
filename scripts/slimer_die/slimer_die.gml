sprite_index = spr_slimer_burst
image_speed = .5
mask_index = spr_slimer_mask

if prev_state != state{
	image_index = 0
	ysp = -3
}
prev_state = state

if image_index > image_number-1{
	repeat(irandom_range(2,4)){
		var part = instance_create_layer(x,y,"Instances",obj_part)
		part.sprite_index = spr_slimer_particle_big
		var part = instance_create_layer(x,y,"Instances",obj_part)
		part.sprite_index = spr_slimer_particle_small
	}
	instance_create_layer(x,y,"Instances",obj_part_eye)
	instance_create_layer(x,y,"Instances",obj_part_eye)
	//var sound = audio_play_sound(snd_laser_kill,0,0)
	//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
	instance_destroy()
}

