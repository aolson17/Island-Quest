/// @description Cannot Swim So Explode Instead


water_death = true
did_death = false
death = true


ysp = -3
y-=2

xsp = 0

var transition = instance_create_layer(x,y,"Cursor",obj_transition)
transition.room_target = Lose

if alarm_get(4) > 0{
	alarm[4] = 10
}