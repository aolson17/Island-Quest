
won = false

wave_total = 2
wave_wait_frames = 350
sink_wait_frames = 200

sinking = false
moving = false

offset_x_l = -675
offset_x_r = 675

move_frames_total = 350
move_frames = 0

wave_wait = true
alarm[0] = 60//wave_wait_frames
wave = 0

global.seconds = 0
alarm[1] = 60

crab_time = 180

crab_y = 270
crab_x_l = 70
crab_x_r = 470

enemies_left = 0

wave_layer_zones_l[1] = -1
wave_layer_zones_r[1] = "Zones_2"
wave_layer_tiles_l[1] = -1
wave_layer_tiles_r[1] = "BackTiles_2"
wave_layer_instances_l[1] = -1
wave_layer_instances_r[1] = "Instances_2"
wave_layer_x_offset_l[1] = -1
wave_layer_x_offset_r[1] = 800
wave_crabs[1] = 1

wave_layer_zones_l[2] = "Zones_3"
wave_layer_zones_r[2] = -1
wave_layer_tiles_l[2] = "BackTiles_3"
wave_layer_tiles_r[2] = -1
wave_layer_instances_l[2] = "Instances_3"
wave_layer_instances_r[2] = -1
wave_layer_x_offset_l[2] = 1200
wave_layer_x_offset_r[2] = 800
wave_crabs[2] = 2