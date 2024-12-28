extends Node
class_name StateInitializer

@export var params : Dictionary

func _ready():
	for child in get_children():
		for param in params.keys():
			var value = params[param]
			if value is NodePath:
				child.set(param, get_node(value))
			else:
				child.set(param, value)
			print("set ", param, " to ", params[param])
			print(child, ".", param, " is now ", child.get(param))
