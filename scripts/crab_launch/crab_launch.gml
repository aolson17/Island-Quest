sprite_index = spr_crabby_air
mask_index = spr_crabby_mask
image_speed = .6

if prev_state != state{
	image_index = 0
}
prev_state = state

if ysp > 0{
	state = crab_fall
}
image_xscale = face


