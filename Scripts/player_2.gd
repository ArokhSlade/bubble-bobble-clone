extends CharacterBody2D


@export var speed = 90.0
@export var jump_speed = -200.0

const Direction = GlobalEnums.Direction
@export var start_heading := Direction.RIGHT
@onready var heading = start_heading
@onready var sprite = $Sprite2D


func _physics_process(delta):
	move_and_slide()
	
func _process(delta):
	update_sprite()
	print("P2 Sprite coords: ", $Sprite2D.global_position)

func get_movement_request() -> Vector2:
	
	var move_request : Vector2
	
	if Input.is_action_just_pressed("ui_accept"):
		move_request.y += 1.0
		
	move_request.x += Input.get_axis("ui_left", "ui_right")
	
	update_heading(GlobalEnums.from_vector2(move_request))	
	
	return move_request


func update_heading(new_direction : Direction):
	#todo handle case where LEFT and RIGHT are set
	if new_direction & Direction.LEFT:
		heading = Direction.LEFT
	elif new_direction & Direction.RIGHT:
		heading = Direction.RIGHT
	
func update_sprite():
	sprite.flip_h = heading & Direction.LEFT
	
