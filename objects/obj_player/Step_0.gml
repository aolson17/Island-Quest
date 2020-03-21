
move = right_key-left_key

if hp <= 0{
	if !played_death_sound{
		played_death_sound = true
		var sound = audio_play_sound(snd_death,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
	}
	dead_time--
	if dead_time <= 0{ // Respawn
		dead_time = 0
		hp = max_hp
		x = checkpoint_x
		y = checkpoint_y
		xsp = 0
		ysp = 0
	}
}else{
	played_death_sound = false
	if dead_time < dead_time_max{
		dead_time++
	}
}

on_ground = place_meeting(x,y+1,par_solid)

// Don't sprint while scoped
if scope_key{
	sprint_key = false
}

if on_ground{
	if state = knocked || global.in_dialogue || hp<=0{
		move = 0
		move_speed = 0
		max_move_speed = 0
	}else{
		if !sprint_key{
			move_speed = run_speed
			max_move_speed = max_run_speed
		}else{
			move_speed = sprint_speed
			max_move_speed = max_sprint_speed
		}
	}
}else{
	move_speed = air_move_factor*run_speed
	max_move_speed = max_run_speed
}

if move = sign(xsp){ // If trying to move in the same direction as momentum
	if abs(xsp) <= max_move_speed{ // If not already over limit
		xsp += move * move_speed
		if abs(xsp) > max_move_speed{ // Don't let xsp go over max
			xsp = move * max_move_speed
		}
	}
}else{
	xsp += move * move_speed
}

if !on_ground{ // Apply gravity
	ysp += grav_speed
}else{ // If on ground
	coyote_jump = true // Reset coyote jump ability
	
	if (move != sign(xsp) || abs(xsp) > max_move_speed){ // Apply friction
		var prev_xsp = xsp
		if xsp > 0{
			if xsp - move_friction > 0{
				xsp -= move_friction
			}else{
				xsp = 0
			}
		}else if xsp < 0{
			if xsp + move_friction < 0{
				xsp += move_friction
			}else{
				xsp = 0
			}
		}
		if move = 1 && xsp > 0 && abs(prev_xsp) <= max_move_speed{
			xsp = max_move_speed
		}else if move = -1 && xsp < 0 && abs(prev_xsp) <= max_move_speed{
			xsp = -max_move_speed
		}
	}
}

if on_ground || coyote_jump{
	jumping = false
	if state != knocked && state != hurt && state != get_up{
		if jump_key || queue_jump{ // Jump
			ysp = -jump_speed
			jumping = true
			coyote_jump = false
			queue_jump = false
		}
		
		if face = 1{
			if move < 0{
				face = -1
			}
		}else{
			if move > 0{
				face = 1
			}
		}
	}
}else{
	if state = fall{
		if jump_key{ // Queue Jump
			queue_jump = true
			alarm[9] = queue_jump_frames
		}
	}
}

if ysp > 0{
	jumping = false
}
if jump_key_released && jumping{ // Variable jumping
	ysp *= variable_jump_factor
	jumping = false
}
if jump_key_released{ // Cancel queued jump
	queue_jump = false
}

// Recoil Recovery
if current_recoil > 0{
	current_recoil-=gun_recoil_recovery[gun]
}else{
	current_recoil = 0
}

// Face aim direction when scoped
if scope_key && !global.in_dialogue{
	if abs(angle_difference(aim_dir,0)) > 90{
		face = -1
	}else{
		face = 1
	}
}

// Increase innacuracy when shooting backward
if face = 1 && (abs(angle_difference(aim_dir,0)) > 90){
	current_gun_backwards_accuracy_offset = ((abs(angle_difference(aim_dir,0))-90)/90)*gun_backwards_accuracy_offset[gun]
}else if face = -1 && (abs(angle_difference(aim_dir,180)) > 90){
	current_gun_backwards_accuracy_offset = ((abs(angle_difference(aim_dir,180))-90)/90)*gun_backwards_accuracy_offset[gun]
}else{
	current_gun_backwards_accuracy_offset = 0
}

if can_shoot > 0{
	can_shoot--
}

if state = run || state = stand || state = jump || state = fall{
	if ((attack_key&&gun_auto[gun])||(attack_key_pressed&&!gun_auto[gun])) && can_shoot = 0{
		can_shoot += gun_fire_rate[gun]
		obj_camera.shake += 6
		if gun != guns.shotgun{
			var sound = audio_play_sound(snd_laser,0,0)
		}else{
			var sound = audio_play_sound(snd_shotgun,0,0)
		}
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		repeat(gun_shots[gun]){ // Shoot multple times if it should
			var bullet = instance_create_layer(x+lengthdir_x(gun_length[gun],aim_dir),y-2+lengthdir_y(gun_length[gun],aim_dir),"Bullets",obj_bullet)
			var dir_range = gun_accuracy[gun]+current_recoil+current_gun_backwards_accuracy_offset
			var dir_offset = random(dir_range)-(dir_range)/2
			bullet.xsp = lengthdir_x(gun_bullet_speed[gun],aim_dir+dir_offset)+xsp
			bullet.ysp = lengthdir_y(gun_bullet_speed[gun],aim_dir+dir_offset)+ysp
			bullet.image_angle = aim_dir+dir_offset
		}
		if on_ground{
			xsp += lengthdir_x(-gun_knockback[gun],aim_dir+dir_offset)
		}else{
			xsp += lengthdir_x(-gun_knockback[gun]*.25,aim_dir+dir_offset)
		}
		ysp += lengthdir_y(-gun_knockback[gun]*.25,aim_dir+dir_offset)
		flash = true
		alarm[1] = muzzle_flash_frames
		
		// Apply recoil
		current_recoil+=gun_recoil[gun]
		if current_recoil > gun_max_recoil[gun]{
			current_recoil = gun_max_recoil[gun]
		}
		
	}
}

if !global.in_dialogue{
	if mouse_wheel_down(){
		var sound = audio_play_sound(snd_weapon_switch,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		gun--
		if gun <0{
			gun=2
		}
	}else if mouse_wheel_up(){
		var sound = audio_play_sound(snd_weapon_switch,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		gun++
		if gun >2{
			gun=0
		}
	}
	if keyboard_check_pressed(ord("1")){
		var sound = audio_play_sound(snd_weapon_switch,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		gun = guns.pistol
	}
	if keyboard_check_pressed(ord("3")){
		var sound = audio_play_sound(snd_weapon_switch,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		gun = guns.shotgun
	}
	if keyboard_check_pressed(ord("2")){
		var sound = audio_play_sound(snd_weapon_switch,0,0)
		audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		gun = guns.rifle
	}
	
	if !got_rifle{
		if gun = guns.rifle{
			gun = guns.pistol
		}
	}
	if !got_shotgun{
		if gun = guns.shotgun{
			gun = guns.pistol
		}
	}
}

script_execute(state) // Manage which state is active

applied_knockback = false
scr_collision()
