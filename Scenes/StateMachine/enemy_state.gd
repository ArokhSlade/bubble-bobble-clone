extends State
class_name EnemyState



@export var enemy : CharacterBody2D

#TODO: some day
#@onready var brain : EnemyBrain = enemy.get_node("Brain")

const Direction = GlobalEnums.Direction
var move_request : Vector2



func physics_update(delta):
	move_request = enemy.get_movement_request()
