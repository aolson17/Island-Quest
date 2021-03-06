
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

if state != pirate_attack && state != stagger_state && state != dead_state && target != noone{
	if target.x < x{
		move = -1
	}else if target.x > x{
		move = 1
	}else{
		move = 0
	}
	if distance_to_object(target) < attack_distance{
		if state = pirate_stand{
			if target.x < x{
				face = -1
			}else if target.x > x{
				face = 1
			}
		}
		if target.state != knocked{
			if attack_cooldown <= 0{
				attack_cooldown = attack_cooldown_frames
				state = pirate_attack
				image_index = 0
			}
		}else if target.state = knocked{
			move = 0
		}
	}
}else{
	move = 0
}

if state = pirate_stand || state = pirate_run{
	if attack_cooldown>0{
		attack_cooldown--
	}
}

if place_meeting(x,y+1,par_solid){
	if state = pirate_attack{
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
	}
}else{
	xsp += move * move_speed
}



if !place_meeting(x,y+1,par_solid){ // Apply gravity
	ysp += grav_speed
}else{ // If on ground
	if move != sign(xsp) || abs(xsp) > max_move_speed{ // Apply friction
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
		if move = 1 && xsp > 0{
			xsp = max_move_speed
		}else if move = -1 && xsp < 0{
			xsp = -max_move_speed
		}
	}
}

script_execute(state) // Manage which state is active

if move = sign(xsp) && move != 0 && place_meeting(x,y+1,par_solid){
	face = move
}

scr_collision()
if state != pirate_die{
	scr_pirate_attacks()
}

if place_meeting(x,y,obj_water){
	state = pirate_die
}



