
event_inherited()


if hp_alpha != .8 && hp > 0 && damaged && state != dead_state{
	hp_alpha += .01
}else if (hp <= 0 || !damaged) && hp_alpha != 0{
	hp_alpha -= .01
}
if hp <= 0{
	state = dead_state
	hp_alpha = 0
}

target = noone
if instance_number(obj_player)>0{
	if scr_target(sight_range,sight_up,sight_down,obj_player,false){
		target = obj_player
		if target.hp <= 0{target = noone}
	}
}

move = 0


if !place_meeting(x,y+1,par_solid){ // Apply gravity
	ysp += grav_speed
}else{ // If on ground
	if move != sign(xsp){ // Apply friction
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
	}
}

if state = slimer_stand && target != noone{
	if jump_cooldown <= 0{
		state = slimer_prepare
		jump_power_x = sign(target.x-x)*2.2
		jump_power_y = -clamp(distance_to_object(target)/22,2,5)
		jump_cooldown = jump_cooldown_frames
	}else{
		jump_cooldown--
	}
}


script_execute(state) // Manage which state is active

if target != noone{
	if state = slimer_stand && place_meeting(x,y+1,par_solid){
		face = sign(target.x-x)
		if face = 0{
			face = 1
		}
	}
}

if state != dead_state{
	scr_collision()
	if distance_to_object(target) < 2{
		damage = 1
		knockback = 3
		shake = 12
		if !target.invincible{
			target.invincible = true
			target.state = hurt
			target.alarm[0] = obj_player.invincibility_frames
			if sign(target.x-x) != 0{
				target.xsp = sign(target.x-x)*knockback
			}else{
				target.xsp = face*knockback
			}
			target.ysp = -3
			xsp = -target.xsp/3
			ysp = -3
			target.hp -= damage
			obj_camera.shake += shake
		}
	}
}else{
	x += xsp
	if ysp < 0{
		y += ysp
	}
}





