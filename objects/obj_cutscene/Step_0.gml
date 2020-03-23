


switch(image_num){
	case 0: obj_cutscene_text.text_str = obj_cutscene_text.text_1
		break
	case 1: obj_cutscene_text.text_str = obj_cutscene_text.text_2
		break
	case 2: obj_cutscene_text.text_str = obj_cutscene_text.text_3
		break
	case 3: obj_cutscene_text.text_str = obj_cutscene_text.text_4
		break
}



if keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left){
	image_num++
}

if image_num >3 && !made_transition{
	var transition = instance_create_layer(x,y,"Cursor",obj_transition)
	transition.room_target = Boat
	made_transition = true
}else{
	image_index = image_num
}