extends Node
class_name State


var stateful_object

signal transitioned(State, String)


func enter(previous : State = null):
	pass
	
func exit(next : State = null):
	pass
	
func update(delta):
	pass
	
func physics_update(delta):
	pass
