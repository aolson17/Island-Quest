/// @description Next Wave After Wait

wave++
wave_wait = false
moving = true
sinking = false

move_frames = 0

if wave > wave_total{
	won = true
	show_message("You Win")
}



