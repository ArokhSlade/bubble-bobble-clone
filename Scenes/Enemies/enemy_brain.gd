extends Node
class_name EnemyBrain

@export var enemy : CharacterBody2D
@onready var state : EnemyState = enemy.get_state()
const Direction = GlobalEnums.Direction

func get_movement_request() -> Vector2:
	
	return Vector2(1.0,0.0)
