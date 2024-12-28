extends State
class_name CharacterState



@export var character : CharacterBody2D


const Direction = GlobalEnums.Direction
var move_request : Vector2



func physics_update(delta):
	move_request = character.get_movement_request()
