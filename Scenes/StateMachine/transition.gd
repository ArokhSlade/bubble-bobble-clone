extends Node
class_name Transition

@export var from : State
@export var to : State

func _init(p_from, p_to):
	from = p_from
	to = p_to
