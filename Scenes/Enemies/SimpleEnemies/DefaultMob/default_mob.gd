extends CharacterBody2D

const Direction = GlobalEnums.Direction

@export var heading : Direction


signal pre_game_float_begun(call_when_all_pre_game_floats_finished: Callable)
signal pre_game_float_finished


func update_heading(new_direction : Direction):
	var left_set = new_direction & Direction.LEFT
	var right_set = new_direction & Direction.RIGHT
	if left_set:
		if right_set:
			heading = heading
		else:
			heading = Direction.LEFT
	elif right_set:
		heading = Direction.RIGHT

func _physics_process(_delta):
	move_and_slide()
	print(velocity)

func _on_pre_game_floating_finished():
	pre_game_float_finished.emit()


func _on_pre_game_floating_entered(call_when_all_pre_game_floats_finished: Callable):
	pre_game_float_begun.emit(call_when_all_pre_game_floats_finished)
