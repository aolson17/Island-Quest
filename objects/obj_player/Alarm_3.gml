/// @description Stuck In Wall Timer Before Damage

if place_meeting(x,y,par_solid){
	damage = 1
	shake = 5
	if !invincible{
		invincible = true
		state = hurt
		alarm[0] = invincibility_frames*5
		hp -= damage
		obj_camera.shake += shake
	}
	alarm[3] = 20
}