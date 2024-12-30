extends Node

@export var body : CharacterBody2D
@export var walk_speed : int
@export var jump_speed : int

const Direction = GlobalEnums.Direction

static func wants_move_horizontally(move_request : Direction) -> bool:
	return GlobalEnums.as_vector2(move_request).x != 0.0

static func wants_jump(move_request : Direction) -> bool:
	return move_request & Direction.UP

func apply_gravity(delta):
	body.velocity += body.get_gravity() * delta
	
func move_horizontally(move_request : Direction):
	body.velocity.x = GlobalEnums.as_vector2(move_request).x * walk_speed
	
func jump():
	body.velocity.y = jump_speed

func stop():
	body.velocity.x = 0.0
