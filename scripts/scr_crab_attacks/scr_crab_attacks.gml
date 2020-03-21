if target = noone || target.death{
	return
}
if state = crab_attack{
	var mask = mask_index
	if !(image_index >= 1 && image_index <= 16){
		exit
	}
	damage = 1
	knockback = 5
	shake = 12
	mask_index = spr_crabby_attack
	var list = ds_list_create()
	instance_place_list(x,y,par_player,list,false)
	
	if ds_list_size(list)>0{
		
		var success = false
		for (var i = 0; i < ds_list_size(list);i++){
			var col = ds_list_find_value(list,i)
			if !col.invincible{
				col.invincible = true
				col.state = hurt
				col.alarm[0] = obj_player.invincibility_frames
				col.xsp += sign(-face)*2
				col.ysp = -4
				col.hp -= damage
				var success = true
			}
		}
		if success{
			obj_camera.shake += shake
		}
	}
	
	mask_index = mask
	ds_list_destroy(list)
}else{
	if distance_to_object(target) < 2{
		damage = 1
		knockback = 3
		shake = 12
		if !target.invincible{
			target.invincible = true
			target.state = hurt
			target.alarm[0] = obj_player.invincibility_frames
			target.xsp = sign(target.x-x)*knockback
			target.ysp = -3
			target.hp -= damage
			obj_camera.shake += shake
		}
	}
}