extends Node
class_name StateMachine


@onready var current_state : State = initial_state
var all_states : Dictionary

@export var initial_state : State

func _ready():
	for child in get_children():
		if child is State:
			all_states[child.name.to_lower()] = child
			child.state_changed.connect(on_state_changed)
	
	initial_state.enter()
		
func on_state_changed(from : State, to : String):
	from.exit()
	current_state = all_states[to.to_lower()]
	current_state.enter()
	
func _process(delta):
	current_state.update(delta)
	
func _physics_process(delta):
	current_state.physics_update(delta)
