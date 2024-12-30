extends Node


func morph(from : Node, to : PackedScene, params : Dictionary):	
	var parent = from.get_parent()
	parent.remove_child(from)
	var new_form = to.instantiate()
	for param in params:
		new_form.set(param, params[param])
	parent.add_child(new_form)
	
