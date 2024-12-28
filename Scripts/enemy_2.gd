extends CharacterBody2D




@export var speed = 120.0
@export var jump_speed = -210.0
@export var FloatingBubble : PackedScene

const Direction = GlobalEnums.Direction

var heading : Direction = Direction.RIGHT
var is_jumping = false


@onready var starting_location : Vector2 = global_position
@onready var brain : EnemyBrain = $EnemyBrain

var LOWER_HALF_HEIGHT = 10 # TODO
var sink_speed = 50


func _physics_process(delta):
	move_and_slide()
	
func get_movement_request() -> Vector2 :
	return brain.get_movement_request()


func update_heading(new_direction : Direction):
	#todo handle case where LEFT and RIGHT are set
	if new_direction & Direction.LEFT:
		heading = Direction.LEFT
	elif new_direction & Direction.RIGHT:
		heading = Direction.RIGHT



	
func hit():
	var bubbled_enemy = FloatingBubble.instantiate()
	bubbled_enemy.contained_enemy = self
	get_parent().call_deferred("add_child",bubbled_enemy)
	bubbled_enemy.global_position = global_position
	
	get_parent().remove_child(self)
