
pressed = window_get_fullscreen()

if !pressed{
	if point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom){
		if mouse_check_button_released(mb_left){
			var sound = audio_play_sound(Menu_button_press,0,0)
			audio_sound_gain(sound,global.master_volume*global.sound_volume,0)
			pressed = true
			image_index = 2
			y_offset = 1
			
			window_set_fullscreen(true)
		}else{
			image_index = 1
			y_offset = 0
		}	
	}else{
		image_index = 0
		y_offset = 0
	}
}else{
	if point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom){
		if mouse_check_button_released(mb_left){
			var sound = audio_play_sound(Menu_button_press,0,0)
			audio_sound_gain(sound,global.master_volume*global.sound_volume,0)
			window_set_fullscreen(false)
			pressed = false
			image_index = 1
			y_offset = 0
		}else{
			image_index = 2
			y_offset = 1
		}	
	}else{
		image_index = 3
		y_offset = 1
	}
}

