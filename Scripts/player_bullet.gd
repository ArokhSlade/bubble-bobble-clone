extends Node2D

@export var floating_bubble_scene : PackedScene

@export var speed : int = 300

const Direction = GlobalEnums.Direction
var heading : Direction

func _physics_process(delta):
	var velocity = GlobalEnums.as_vector2(heading)
	velocity *= speed
	global_position += velocity * delta

func _on_area_2d_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		queue_free()
	else : 
		turn_into_floating_bubble()

func _on_disarm_timer_timeout():
	#TODO check for double call when timer runs out in same frame as collided
	turn_into_floating_bubble()

func turn_into_floating_bubble():
	var new_floating_bubble = floating_bubble_scene.instantiate()
	get_parent().call_deferred("add_child",new_floating_bubble)
	new_floating_bubble.global_position = global_position
	queue_free()
	
func get_width():
	return $Area2D/CollisionShape2D.shape.size.x
	#TODO: 	should bullets be able to collide with player?
