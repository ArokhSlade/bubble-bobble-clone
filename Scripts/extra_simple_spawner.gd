@tool
extends Marker2D

@export var enemy_scene : PackedScene : 
	set(value):
		enemy_scene = value
		update_instance()
		queue_redraw()


var enemy_instance : Node


func _ready():
	update_instance()
	queue_redraw()

func update_instance():
	if enemy_instance!=null && !enemy_instance.is_queued_for_deletion(): 		
		enemy_instance.queue_free()
		enemy_instance = null
	if enemy_scene!= null:
		enemy_instance = enemy_scene.instantiate()
		add_child(enemy_instance)
