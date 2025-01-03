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
			child.state_machine = self
			all_states[child.name.to_lower()] = child
			child.transitioned.connect(on_transitioned)
			child.stateful_object = stateful_object
			print("child added: ", child.name)
	
	initial_state.enter()
	
func on_transitioned(from : State, to : State):
	from.exit()
	current_state = to
	current_state.enter()
	
func _process(delta):
	current_state.update(delta)
	
func _physics_process(delta):
	current_state.physics_update(delta)
