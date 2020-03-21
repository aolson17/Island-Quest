
if state = melee_attack{
	var mask = mask_index
	if !(image_index >= 1 && image_index <= 1){
		exit
	}
	damage = 10
	knockback = 10
	shake = 18
	mask_index = spr_melee_attack
	var list = ds_list_create()
	instance_place_list(x,y,par_player,list,false)
	
	if ds_list_size(list)>0{
		
		var success = false
		for (var i = 0; i < ds_list_size(list);i++){
			var col = ds_list_find_value(list,i)
			if !col.invincible{
				col.invincible = true
				col.alarm[0] = obj_player.invincibility_frames
				col.xsp += sign(-face)*knockback
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
}