sprite_index = spr_captain_hurt
mask_index = spr_captain_mask
image_speed = .3

if prev_state != state{
	image_index = 0
	instance_create_layer(x+face*6,y-4,"Bullets",obj_heart_crack)
	death = false
}
prev_state = state


if !place_meeting(x,y+1,par_solid){ // If in air
	
}else{ // If on ground
	if image_index > image_number-1{
		image_speed = 0
		if hp > 0{
			state = stand
		}else{
			death = true
		}
	}
	
	image_xscale = face
}

if hp <= 0{
	if distance_to_object(obj_camera) > 300{
		death = true
	}
}

if death && !did_death{
	did_death = true
	
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_bone
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_bone
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_foot
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_hand
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_head
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_hat
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_coat
	var part = instance_create_layer(x,y,"Instances",obj_part)
	part.sprite_index = spr_captain_pants_air
}
