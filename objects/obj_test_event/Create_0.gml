/// @description Initialize Variables

#region Values to customize

image_speed = 0 // This should change depending on the sprite's desired animation speed

#endregion

dialogue_stage = 0 // Each talkable NPC must have this variable that increments after each segment of talking, use this to detect when dialogue has finished to set up other events or more dialogue
question_answer = -1 // Each NPC with questions must have this, it will be changed to 1 if the first option is chosen or 0 if the second is chosen
prev_dialogue_stage = 0 // Will allow for easy detecting of changes in dialogue
scene_animation = false
default_sprite = sprite_index
default_image_speed = image_speed