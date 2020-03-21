sprite_index = spr_crabby_hurt
image_speed = .5
mask_index = spr_crabby_mask

if prev_state != state{
	image_index = 0
	ysp = -3
	instance_create_layer(x,y,layer,obj_explosion)
}
prev_state = state

/*if image_index > image_number-1{
	image_speed = 0
	var dead = instance_create_layer(x,y,layer,obj_explosion)
	dead.image_xscale = face
	//var sound = audio_play_sound(snd_laser_kill,0,0)
	//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
	instance_destroy()
}*/

if distance_to_object(obj_camera) > 400{
	instance_destroy()
}
