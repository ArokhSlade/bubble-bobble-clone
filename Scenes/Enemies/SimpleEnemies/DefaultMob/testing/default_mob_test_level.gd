extends Node2D


var mob_count : int = 0
var mob_callbacks : Array[Callable]


func _on_default_mob_pre_game_float_begun(call_when_all_pre_game_floats_finished : Callable):
	mob_count += 1
	mob_callbacks.append(call_when_all_pre_game_floats_finished)


func _on_default_mob_pre_game_float_finished():
	mob_count -= 1
	if mob_count == 0:
		for callable in mob_callbacks:
			callable.call()
