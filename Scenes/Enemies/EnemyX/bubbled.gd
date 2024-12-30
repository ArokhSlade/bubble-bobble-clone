extends "res://Scenes/Enemies/EnemyX/live.gd"

@export var bubble_timer : Timer

var previous_state : State

func enter(p_previous_state : State = null):
	bubble_timer.start()
	previous_state = p_previous_state
	

func on_bubble_timer_timeout():
	transitioned.emit(self, previous_state.name.to_lower())
