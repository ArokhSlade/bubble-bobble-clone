extends Node
class_name StateMachine_00

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
			child.state_changed.connect(on_state_changed)
			child.stateful_object = stateful_object
			print("child added: ", child.name)
	
	initial_state.enter()
	
func on_state_changed(from : State, to : String):
	from.exit()
	current_state = all_states[to.to_lower()]
	current_state.enter()
	
func _process(delta):
	current_state.update(delta)
	
func _physics_process(delta):
	current_state.physics_update(delta)
