




scale = (max_scale - min_scale)*(obj_waves.wave/obj_waves.wave_total)+min_scale

if obj_waves.wave/obj_waves.wave_total < .33{
	image_index = 0
}else if obj_waves.wave/obj_waves.wave_total < .66{
	image_index = 1
}else{
	image_index = 2
}

image_xscale = scale
image_yscale = scale

