played_sound = false

if state = attack || state = attack_air{
	var mask = mask_index
	if !(image_index >= 1 && image_index <= 4){
		exit
	}
	damage = 1
	knockback_x = 3
	knockback_y = 2
	shake = 8
	mask_index = spr_captain_slash_ground
	var list = ds_list_create()
	instance_place_list(x,y,par_enemy,list,false)
	
	if ds_list_size(list)>0{
		var success = false
		for (var i = 0; i < ds_list_size(list);i++){
			
			var col = ds_list_find_value(list,i)
			if col.object_index = obj_crab{
				if col.state != crab_defend && col.state != col.stagger_state && col.state != col.dead_state{
					if col.state = crab_attack{
						success = true
						ds_list_add(obj_text.text,damage)
						ds_list_add(obj_text.text_x,x)
						ds_list_add(obj_text.text_y,y)
						ds_list_add(obj_text.text_life,0)
						ds_list_add(obj_text.text_color,c_white)
						ds_list_add(obj_text.text_dir,sign(xsp)*random(1))
						col.hp -= damage
						col.damaged = true
						col.alarm[1] = col.damaged_time
						col.xsp += sign(face)*knockback_x
						col.ysp = -knockback_y
						col.y -= 1
						col.state = col.stagger_state
						if !played_sound{
							played_sound = true
							//var sound = audio_play_sound(snd_laser_hit_enemy,0,0)
							//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
						}
					}else{
						col.xsp += sign(face)*1.5
						col.ysp = -.8
						col.state = crab_defend
						col.image_xscale = sign(col.x-x)
						col.face = sign(col.x-x)
					}
				}
			}else{
				if col.state != col.stagger_state && col.state != col.dead_state{
					success = true
					ds_list_add(obj_text.text,damage)
					ds_list_add(obj_text.text_x,x)
					ds_list_add(obj_text.text_y,y)
					ds_list_add(obj_text.text_life,0)
					ds_list_add(obj_text.text_color,c_white)
					ds_list_add(obj_text.text_dir,sign(xsp)*random(1))
					col.hp -= damage
					col.damaged = true
					col.alarm[1] = col.damaged_time
					col.xsp += sign(face)*knockback_x
					col.ysp = -knockback_y
					col.y -= 1
					col.state = col.stagger_state
					if !played_sound{
						played_sound = true
						//var sound = audio_play_sound(snd_laser_hit_enemy,0,0)
						//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
					}
				}
			}
		}
		if success{
			obj_camera.shake += shake
		}
	}
	
	mask_index = mask
	ds_list_destroy(list)
}