/// @description Die From Water

show_message("")

scr_explode()

var transition = instance_create_layer(x,y,"Cursor",obj_transition)
transition.room_target = Lose

if alarm_get(4) > 0{
	alarm[4] = 10
}