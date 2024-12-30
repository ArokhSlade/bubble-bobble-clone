extends Node
class_name State

var state_machine
var stateful_object

signal transitioned(from: State, to: State)

func enter(previous : State = null):
	pass
	
func exit(next : State = null):
	pass
	
func update(delta):
	pass
	
func physics_update(delta):
	pass
