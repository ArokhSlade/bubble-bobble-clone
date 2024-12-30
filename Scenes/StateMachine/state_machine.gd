extends Node
class_name StateMachine

@export var stateful_object : Node

@onready var current_state : State = initial_state
var all_states : Dictionary

@export var initial_state : State
@export var params : Dictionary

func _ready():
	for child in get_children():
		if child is State:
			all_states[child.name.to_lower()] = child
			child.state_changed.connect(on_state_changed)
			print("child added: ", child.name)
	init_states()
			
	
	initial_state.enter()
		
func init_states():
	for child in get_children():
		for param in params.keys():
			var value = params[param]
			if value is NodePath:
				child.set(param, get_node(value))
			else:
				child.set(param, value)
	
func on_state_changed(from : State, to : String):
	from.exit()
	current_state = all_states[to.to_lower()]
	current_state.enter()
	
func _process(delta):
	current_state.update(delta)
	
func _physics_process(delta):
	current_state.physics_update(delta)
