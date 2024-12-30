extends State
class_name FormState

@export var form : PackedScene
var current_form : Node

@export var initial_state : State

signal form_changed(new_form : PackedScene)

func enter(previous_state : State = null): 
	current_form = owner.current_form
	
	var previous_form = previous_state.get("form")
	if previous_form != form:
		form_changed.emit()

func on_bobbed():
	transitioned.emit("gone")

func morph_into(new_form : PackedScene):
	var old_avatar : Node = owner.get_node("Avatar")
	owner.remove_child(old_avatar)
	var new_avatar = new_form.instantiate()
	owner.add_child(new_avatar)
