/// @description Adds more text at the correct pace

if ds_list_size(dialogue) > 0 && total_text >= text_position{ // If there is active dialogue and there is more text to write
	var data = ds_list_find_value(dialogue,0)
	
	
	var new_text = text + string_copy(data[info.text],text_position,1) // Add next character
	
	draw_set_font(data[info.font]) // Temporarily change to the desired font to check for correct width
	if string_width(new_text) > text_width{ // If the text is too wide
		var space_index = text_position
		while(string_char_at(text,space_index) != " " && space_index >= 0){ // Find the last complete word
			space_index--
		}
		text = string_delete(text,space_index,1)     // Replace the space with the newline indicator
		text = string_insert("\n",text,space_index)  //
		text += string_copy(data[info.text],text_position,1) // Continue writing
	}else{ // If there was enough space
		text = new_text
	}
	
	draw_set_font(global.font) // Change back to the normal font so it doesn't mess with text in other parts of the game
	
	text_position++
	
	alarm[0] = text_speed
}