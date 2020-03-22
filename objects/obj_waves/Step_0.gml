


if !wave_wait{
	// Check if enemies are left
	enemies_left = 0
	if wave_layer_instances_l[wave] != -1{
		elements = layer_get_all_elements(wave_layer_instances_l[wave]);
		for (var i = 0; i < array_length_1d(elements); i++){
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var inst = layer_instance_get_instance(elements[i]);
				if instance_exists(inst){
					if object_is_ancestor(inst.object_index,par_enemy){
						enemies_left++
					}
				}
			}
		}
	}
	if wave_layer_instances_r[wave] != -1{
		elements = layer_get_all_elements(wave_layer_instances_r[wave]);
		for (var i = 0; i < array_length_1d(elements); i++){
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var inst = layer_instance_get_instance(elements[i]);
				if instance_exists(inst){
					if object_is_ancestor(inst.object_index,par_enemy){
						enemies_left++
					}
				}
			}
		}
	}
	if enemies_left <= 0{
		alarm[0] = wave_wait_frames
		wave_wait = true
		alarm[2] = sink_wait_frames
	}
}else{
	
	
}

if moving{
	if wave_layer_instances_l[wave] != -1{
		elements = layer_get_all_elements(wave_layer_zones_l[wave]);
		for (var i = 0; i < array_length_1d(elements); i++){
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var inst = layer_instance_get_instance(elements[i]);
				if instance_exists(inst){
					inst.x = (inst.xstart-wave_layer_x_offset_l[wave])+offset_x_l+move_frames
				}
			}
		}
		elements = layer_get_all_elements(wave_layer_instances_l[wave]);
		for (var i = 0; i < array_length_1d(elements); i++){
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var inst = layer_instance_get_instance(elements[i]);
				if instance_exists(inst){
					inst.x = (inst.xstart-wave_layer_x_offset_l[wave])+offset_x_l+move_frames
				}
			}
		}
		layer_x(wave_layer_tiles_l[wave],offset_x_l+move_frames)
	}

	if wave_layer_instances_r[wave] != -1{
		elements = layer_get_all_elements(wave_layer_zones_r[wave]);
		for (var i = 0; i < array_length_1d(elements); i++){
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var inst = layer_instance_get_instance(elements[i]);
				inst.x = (inst.xstart-wave_layer_x_offset_r[wave])+offset_x_r-move_frames
			}
		}
		elements = layer_get_all_elements(wave_layer_instances_r[wave]);
		for (var i = 0; i < array_length_1d(elements); i++){
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var inst = layer_instance_get_instance(elements[i]);
				if instance_exists(inst){
					inst.x = (inst.xstart-wave_layer_x_offset_r[wave])+offset_x_r-move_frames
				}
			}
		}
		layer_x(wave_layer_tiles_r[wave],offset_x_r-move_frames)
	}

	if move_frames < move_frames_total{
		move_frames++
	}else{
		move_frames = move_frames_total
		moving = false
	}
}

if sinking{
	if wave_layer_instances_l[wave] != -1{
		elements = layer_get_all_elements(wave_layer_zones_l[wave]);
		for (var i = 0; i < array_length_1d(elements); i++){
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var inst = layer_instance_get_instance(elements[i]);
				if instance_exists(inst){
					inst.x = (inst.xstart-wave_layer_x_offset_l[wave])+offset_x_l-move_frames
					inst.y += 2
				}
			}
		}
		layer_x(wave_layer_tiles_l[wave],offset_x_l+move_frames)
		layer_y(wave_layer_tiles_l[wave],layer_get_y(wave_layer_tiles_l[wave])+2)
	}

	if wave_layer_instances_r[wave] != -1{
		elements = layer_get_all_elements(wave_layer_zones_r[wave]);
		for (var i = 0; i < array_length_1d(elements); i++){
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var inst = layer_instance_get_instance(elements[i]);
				if instance_exists(inst){
					inst.x = (inst.xstart-wave_layer_x_offset_r[wave])+offset_x_r-move_frames
					inst.y += 2
				}
			}
		}
		layer_x(wave_layer_tiles_r[wave],offset_x_r-move_frames)
		layer_y(wave_layer_tiles_r[wave],layer_get_y(wave_layer_tiles_r[wave])+2)
	}
}

