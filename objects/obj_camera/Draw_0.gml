



/*draw_sprite_ext(spr_hud,0,x-width/2,y-height/2,2,2,0,c_white,1)

// Health bar
draw_set_color(make_color_rgb(248,184,0))
var x_pos = x-width/2+50
var y_pos = y-height/2
var bar_max_width = 197
draw_rectangle(x_pos,y_pos,x_pos+bar_max_width*(obj_player.hp/obj_player.max_hp),y_pos+1,false)
draw_rectangle(x_pos-2,y_pos+2,x_pos+bar_max_width*(obj_player.hp/obj_player.max_hp)-2,y_pos+3,false)

draw_set_font(global.hud_font)
draw_set_color(c_white)

var shown_hp = obj_player.hp
if shown_hp < 10{
	shown_hp = "0"+string(shown_hp)
}else{
	shown_hp = string(shown_hp)
}

draw_text_ext_transformed(x-width/2+2,y-height/2+2,shown_hp,1,-1,2,2,0)
draw_set_font(global.font)

// Gun Positions
var y_1 = y-height/2+12
var x_1 = x-width/2+50
var x_2 = x-width/2+78
var x_3 = x-width/2+106
// Ore Positions
var x_4 = x-width/2+width*.02
var y_2 = y-height/2+height*.1
var y_3 = y-height/2+height*.2
var y_4 = y-height/2+height*.3

draw_sprite(spr_ore_green,0,x_4,y_2)
scr_draw_outline(x_4+16,y_2+6,"x"+string(obj_player.ore_green),c_white,c_black,1)

draw_sprite(spr_ore_purple,0,x_4,y_3)
scr_draw_outline(x_4+16,y_3+6,"x"+string(obj_player.ore_purple),c_white,c_black,1)

draw_sprite(spr_ore_orange,0,x_4,y_4)
scr_draw_outline(x_4+16,y_4+6,"x"+string(obj_player.ore_orange),c_white,c_black,1)


switch(obj_player.gun){
	case guns.pistol:
		draw_sprite_ext(spr_hud_pistol,1,x_1,y_1,2,2,0,c_white,1)
		if obj_player.got_rifle{draw_sprite_ext(spr_hud_rifle,0,x_2,y_1,2,2,0,c_white,1)}
		if obj_player.got_shotgun{draw_sprite_ext(spr_hud_shotgun,0,x_3,y_1,2,2,0,c_white,1)}
		break
	case guns.shotgun:
		draw_sprite_ext(spr_hud_pistol,0,x_1,y_1,2,2,0,c_white,1)
		if obj_player.got_rifle{draw_sprite_ext(spr_hud_rifle,0,x_2,y_1,2,2,0,c_white,1)}
		draw_sprite_ext(spr_hud_shotgun,1,x_3,y_1,2,2,0,c_white,1)
		break
	case guns.rifle:
		draw_sprite_ext(spr_hud_pistol,0,x_1,y_1,2,2,0,c_white,1)
		draw_sprite_ext(spr_hud_rifle,1,x_2,y_1,2,2,0,c_white,1)
		if obj_player.got_shotgun{draw_sprite_ext(spr_hud_shotgun,0,x_3,y_1,2,2,0,c_white,1)}
		break
}
