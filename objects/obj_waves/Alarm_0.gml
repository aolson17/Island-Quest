/// @description Next Wave After Wait

wave++
wave_wait = false
moving = true
sinking = false

move_frames = 0

if wave > wave_total{
	won = true
	var transition = instance_create_layer(x,y,"Cursor",obj_transition)
	transition.room_target = Win
	//show_message("You wWin")
}
else{
	if wave_crabs[wave] > 0{
		alarm[3] = crab_time
		wave_crabs[wave]--
	}
}

