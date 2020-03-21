

if prev_dialogue_stage != dialogue_stage{ // If the dialogue was changed
	
}
prev_dialogue_stage = dialogue_stage

if !global.in_dialogue && global.dialogue_ready{
	if point_distance(x,y,obj_player.x,obj_player.y) < obj_dialogue.range{
		if keyboard_check_pressed(obj_dialogue.talk_key){
			var sound = audio_play_sound(snd_menu,0,0)
			audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
			if dialogue_stage = 0{ // If this is the first time talking
				// Each time scr_dialogue or one of the other dialogue types are ran dialogue stage increases by one
				scr_dialogue(spr_portrait,global.font,"Hello! This is some example text, long enough to show making a new line. Blah bed apsuhd juiosdf moasd wa blah. I have spoken.")
				scr_dialogue(spr_portrait,global.font,"This is another page of text!")
		
			}else if dialogue_stage >= 2{ // So after the player goes through the first 2 pages of dialogue dialogue stage will be 2 and this text will show instead
				scr_dialogue(spr_portrait,global.font,"Hello again. New text can appear on consecutive conversations with the same object")
			}
		}
	}
}

var last_dialogue_stage = 2 // Set this to whatever you want the last dialgue to be before the animation pauses
if global.in_dialogue || dialogue_stage > last_dialogue_stage{ // This will pause the moving excalmation mark animation after all of the dialogue is scene
	image_speed = 0
}else{
	image_speed = 1
}
