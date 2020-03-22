
move = right_key-left_key

/*if hp <= 0{
	if !played_death_sound{
		played_death_sound = true
		//var sound = audio_play_sound(snd_death,0,0)
		//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
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
}*/

on_ground = place_meeting(x,y+1,par_solid)

// Don't sprint while scoped

if on_ground{
	if state = knocked || global.in_dialogue || hp<=0 || state = aiming{
		move = 0
		move_speed = 0
		max_move_speed = 0
	}else{
		move_speed = run_speed
		max_move_speed = max_run_speed
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
/*if face = 1 && (abs(angle_difference(aim_dir,0)) > 90){
	current_gun_backwards_accuracy_offset = ((abs(angle_difference(aim_dir,0))-90)/90)*gun_backwards_accuracy_offset[gun]
}else if face = -1 && (abs(angle_difference(aim_dir,180)) > 90){
	current_gun_backwards_accuracy_offset = ((abs(angle_difference(aim_dir,180))-90)/90)*gun_backwards_accuracy_offset[gun]
}else{
	current_gun_backwards_accuracy_offset = 0
}*/
current_gun_backwards_accuracy_offset = 0

if can_shoot > 0{
	can_shoot--
}

if attack_cooldown <= 0{
	if attack_key_pressed &&  !shoot_key {
		if state = stand || state = run{
			state = attack
		}else if state = fall || state = jump{
			state = attack_air
		}
		attack_cooldown = attack_cooldown_frames
	}
}else{
	attack_cooldown--
}

if gun_fired{
	if !gun_shot && gun_frame >= 4{
		gun_shot = true
		obj_camera.shake += 6
		//var sound = audio_play_sound(snd_shotgun,0,0)
		//audio_sound_gain(sound,global.master_volume*global.sound_volume*.8,0)
		xsp += lengthdir_x(-gun_knockback[gun],aim_dir)
		//ysp += lengthdir_y(-gun_knockback[gun]*.25,aim_dir)
		flash = true
		alarm[1] = muzzle_flash_frames
		var bullet = instance_create_layer(x+lengthdir_x(gun_length[gun],aim_dir),y+2+lengthdir_y(gun_length[gun],aim_dir),"Bullets",obj_bullet)
		bullet.xsp = lengthdir_x(gun_bullet_speed[gun],aim_dir)+xsp
		bullet.ysp = lengthdir_y(gun_bullet_speed[gun],aim_dir)+ysp
		bullet.image_angle = aim_dir
	}
	gun_frame += gun_animation_speed
	if gun_frame > gun_animation_max{
		gun_fired = false
		state = reloading
	}
}

if state = run || state = stand{
	if shoot_key{
		state = aiming
	}
}

if state = aiming{
	if ((attack_key&&gun_auto[gun])||(attack_key_pressed&&!gun_auto[gun])) && can_shoot = 0 && shoot_key{
		can_shoot += gun_fire_rate[gun]
		gun_fired = true
		gun_frame = 0
		gun_shot = false
		
		
	}
}

script_execute(state) // Manage which state is active

applied_knockback = false
if !death || (water_death && !did_death){
	scr_collision()
	scr_player_attacks()
}

if water_death{
	sprite_index = spr_captain_hurt
	if ysp < -3{
		image_index = 0
	}else{
		image_index = 1
	}
	xsp = 0
	if ysp > 0 && !did_death{
		scr_explode()
		did_death = true
	}
	if did_death{
		ysp = 0
	}
}