extends Node2D

func _ready():
	print(owner)
	for child in get_children():
		print(child.owner)
