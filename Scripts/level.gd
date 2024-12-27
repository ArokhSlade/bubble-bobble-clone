extends Node2D

var frame_count : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_frame_count():
	print(frame_count)
	frame_count += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("reset_game"):
		get_tree().reload_current_scene()
	
	update_frame_count()
