

if obj_player.gamepad{
	cursor_x = obj_player.x+lengthdir_x(75,obj_player.aim_dir)
	cursor_y = obj_player.y+lengthdir_y(75,obj_player.aim_dir)
}else{
	cursor_x = mouse_x
	cursor_y = mouse_y
}

#region Scope Effect

//target_scope_alpha = 0
pos_x = obj_player.x-(obj_camera.x-width/2)
pos_y = obj_player.y-(obj_camera.y-height/2)
if obj_player.gun_scope[obj_player.gun] && obj_player.scope_key && !global.in_dialogue{ // Player is scoped
	if !played_scope_sound{
		played_scope_sound = true
		//var sound = audio_play_sound(snd_zoom,0,0)
		//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
	}
	mouse_dis = point_distance(obj_player.x,obj_player.y,mouse_x,mouse_y)
	scope_draw_dis = 400*obj_player.gun_scope_power[obj_player.gun] // How far to erase black
	scope_min_size = 35
	scope_size = scope_min_size+(max((200-mouse_dis)/100,0))*50
	
}else{
	played_scope_sound = false
}


#endregion

draw_sprite(spr_cursor,0,cursor_x,cursor_y)

/*
var target_inaccuracy = obj_player.gun_accuracy[obj_player.gun]+obj_player.current_recoil+obj_player.current_gun_backwards_accuracy_offset
shown_innacuracy = lerp(shown_innacuracy,target_inaccuracy,indicator_spd_factor)


var dis = point_distance(obj_player.x+lengthdir_x(obj_player.gun_length[obj_player.gun],obj_player.aim_dir),obj_player.y-1+lengthdir_y(obj_player.gun_length[obj_player.gun],obj_player.aim_dir),mouse_x,mouse_y)

if !global.in_dialogue{
	perp_dis = tan(((shown_innacuracy)/2)*.0175)*dis
}

draw_sprite_ext(spr_reticle,0,cursor_x+lengthdir_x(perp_dis,obj_player.aim_dir-90),cursor_y+lengthdir_y(perp_dis,obj_player.aim_dir-90),1,1,obj_player.aim_dir,c_white,1)
draw_sprite_ext(spr_reticle,0,cursor_x+lengthdir_x(perp_dis,obj_player.aim_dir+90),cursor_y+lengthdir_y(perp_dis,obj_player.aim_dir+90),1,1,obj_player.aim_dir,c_white,1)



