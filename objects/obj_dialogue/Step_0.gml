


if ds_list_size(dialogue) > 0{
	if new_text{ // New page of text
		new_text = false
		var data = ds_list_find_value(dialogue,0)
		if data[info.scene]{ // If playing a cinematic with a time minimmum
			skippable = false
			alarm[2] = data[info.scene_time]
		}else{ // Else apply the default minimum time
			skippable = false
			alarm[2] = default_minimum_skip_time
		}
		text_position = 1
		var data = ds_list_find_value(dialogue,0)
		total_text = string_length(data[info.text])
		
		alarm[0] = text_speed
	}
}


if global.in_dialogue{
	var data = ds_list_find_value(dialogue,0)
	// Allow changing selected choice
	if data[info.question]{
		if keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D"))||keyboard_check_pressed(vk_left)||keyboard_check_pressed(vk_right){
			selected_choice = !selected_choice
		}
	}
	
	if keyboard_check_pressed(talk_key) && skippable{
		var sound = audio_play_sound(snd_menu,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		if ds_list_size(dialogue) <= 1{ // If there is no more queued dialogue pages
			global.in_dialogue = false
			global.dialogue_ready = false
			alarm[1] = 1
		}else{
			if data[info.question]{
				if selected_choice = 0{ // the first choice was selected
					repeat(data[info.choice_2_lines]){
						ds_list_delete(dialogue,1+data[info.choice_1_lines])
					}
				}else{ // the second choice was selected
					repeat(data[info.choice_1_lines]){
						ds_list_delete(dialogue,1)
					}
				}
			}
		}
		data[info.id].dialogue_stage++
		text = ""
		ds_list_delete(dialogue,0)
		new_text = true
		alarm[0] = -1 // Cancel adding next character
		if data[info.question]{
			data[info.id].question_answer = selected_choice
		}
	}
}



