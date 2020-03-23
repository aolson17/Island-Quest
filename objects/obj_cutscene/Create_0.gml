
image_speed = 0

image_num = 0

global.font = font_add_sprite_ext(spr_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!?()",true,3)
global.font_small = font_add_sprite_ext(spr_font_small,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_!?():.",true,2)
global.hud_font = font_add_sprite_ext(spr_font_hud,"0123456789",true,1)

global.dark = make_color_rgb(40,40,40)
global.text_color = make_color_rgb(252,160,68)

draw_set_font(global.font_small)

made_transition = false