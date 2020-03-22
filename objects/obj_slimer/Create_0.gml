

state = slimer_stand

dead_state = slimer_die
stagger_state = slimer_stagger

hit_mask = spr_crabby_mask

event_inherited()

xsp = 0
ysp = 0

max_hp = 2
hp = max_hp

hp_width = 20

jump_cooldown_frames = 50
jump_cooldown = jump_cooldown_frames

jump_power_x = 0
jump_power_y = 0

grav_speed = .2

move_friction = .3

//run_image_speed_factor = .4

invincibility_frames = 15

sight_range = 1500
sight_up = 110
sight_down = 200

invincible = false

damaged_time = 250 // How many frames to have an opaque bar
damaged = false // Make hp bar opaque when damaged

face = -1

target = noone

hp_alpha = 0

prev_state = state
prev_face = face