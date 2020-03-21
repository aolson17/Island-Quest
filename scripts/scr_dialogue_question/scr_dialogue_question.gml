/// @description Adds a question to the dialogue system
/// @param font
/// @param choice_1_lines how many lines for first choice that should be skipped if second choice is picked
/// @param choice_2_lines how many lines for choice 2
/// @param choice_1
/// @param choice_2

var data
data[info.font] = argument0
data[info.question] = true
data[info.choice_1_lines] = argument1
data[info.choice_2_lines] = argument2
data[info.choice_1] = argument3
data[info.choice_2] = argument4
data[info.id] = id
data[info.scene] = false

global.in_dialogue = true
obj_dialogue.new_text = true
text = ""

ds_list_add(obj_dialogue.dialogue,data) // Throws all the info in data into one place where obj_dialogue can manage it

