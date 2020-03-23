sprite_index = spr_pirate_jump
image_speed = .5
mask_index = spr_pirate_mask

if prev_state != state{
	image_index = 0
	ysp = -2
	grav_speed = .09
	//xsp = 0
}
prev_state = state
xsp *= .9
if place_meeting(x+xsp,y+ysp,par_solid)||place_meeting(x,y+1,par_solid){
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_bone
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_bone
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_foot
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_hand
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_pirate_skull
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_pirate_pants
	var sound = audio_play_sound(EnemyPirate_die,0,0)
	audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
	instance_destroy()
}
