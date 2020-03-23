/// @description Launch a crab

var lay = wave_layer_instances_l[wave]

if lay = -1{
	lay = wave_layer_instances_r[wave]
}

if random(100) < 50{
	var crab = instance_create_layer(crab_x_l,crab_y,lay,obj_crab)
	crab.xsp = 5
	crab.ysp = -10
}else{
	var crab = instance_create_layer(crab_x_r,crab_y,lay,obj_crab)
	crab.xsp = -5
	crab.ysp = -10
}

crab.state = crab_launch

if wave_crabs[wave] > 0{
	alarm[3] = crab_time-random(60)
	wave_crabs[wave]--
}