
/*if abs(audio_sound_get_gain(music_playing_id) - global.master_volume*global.music_volume) <= .02{
	audio_sound_gain(music_playing_id, global.master_volume*global.music_volume, 0)
}*/

if audio_get_name(music_playing_id) != audio_get_name(music_to_play){
	audio_sound_gain(music_playing_id, 0, 300)
	if audio_sound_get_gain(music_playing_id) <= 0.04{
		if room != Lose{
			music_playing_id=audio_play_sound(music_to_play,0,true)
		}else{
			music_playing_id=audio_play_sound(music_to_play,0,false)
		}
		audio_sound_gain(music_playing_id, 0, 0)
		audio_sound_gain(music_playing_id, global.master_volume*global.music_volume, 1000)
	}
}






