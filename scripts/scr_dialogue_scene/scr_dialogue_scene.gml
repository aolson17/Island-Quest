/// @description Adds more dialogue to the dialogue system that can't be skipped for a period of time
/// @param portrait
/// @param font
/// @param scene_time How many frames the scene will last
/// @param text

var data
data[info.portrait] = argument0
data[info.font] = argument1
data[info.scene_time] = argument2
data[info.text] = argument3
data[info.id] = id
data[info.question] = false
data[info.scene] = true

global.in_dialogue = true
obj_dialogue.new_text = true
text = ""

ds_list_add(obj_dialogue.dialogue,data) // Throws all the info in data into one place where obj_dialogue can manage it

