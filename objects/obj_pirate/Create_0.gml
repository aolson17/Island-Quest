

state = pirate_stand

dead_state = pirate_die
stagger_state = pirate_fall

hit_mask = spr_pirate_mask

event_inherited()

damage = 1

xsp = 0
ysp = 0

max_hp = 4
hp = max_hp

hp_width = 30

attack_distance = 18

run_speed = .1
max_run_speed = 1.5

air_move_factor = .2

max_stair_speed = max_run_speed*.5

step_size = 4

grav_speed = .3

attack_cooldown_frames = 20
attack_cooldown = 0

move_friction = .1

run_image_speed_factor = .4

invincibility_frames = 15

sight_range = 500
sight_up = 110
sight_down = 20

invincible = false

damaged_time = 250 // How many frames to have an opaque bar
damaged = false // Make hp bar opaque when damaged

face = -1

target = noone

hp_alpha = 0

prev_state = state
prev_face = face