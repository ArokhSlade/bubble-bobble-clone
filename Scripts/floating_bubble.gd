extends CharacterBody2D

@export var speed : int = 50
@onready var tiles : TileMapLayer = $/root/Level/%TileMapLayer
const Direction = GlobalEnums.Direction
@export var stomp_frames : int = 5
@onready var stomp_delay = stomp_frames / 60.0
@onready var stomp_timer = $StompTimer
var heading = Direction.UP


#TODO: when self is freed, does this get free too?
var contained_enemy : Object = null


func _ready():
	$StompTimer.wait_time = stomp_delay

func _physics_process(delta):
	var float_direction = compute_float_direction()
	float_direction = GlobalEnums.as_vector2(float_direction)
	velocity = float_direction * speed
	
	move_and_slide()
	
	
func compute_float_direction() -> Direction:
	var result = Direction.NONE
	if is_tile_above_free():
		result = Direction.UP
	elif is_tile_ahead_free():
		result = heading
	else: 
		result = Direction.LEFT if heading & Direction.RIGHT else Direction.RIGHT
	
	return result



func is_tile_above_free():
	var result = true

	var tile_coords = tiles.get_tile_coords(global_position)
	var tile_above = tiles.get_neighbor_cell(tile_coords,TileSet.CELL_NEIGHBOR_TOP_SIDE)
	
	result = tiles.does_tile_exist(tile_above)
	
	return result
	

func is_tile_ahead_free() :
	var result = true
	
	var tile_coords = tiles.get_tile_coords(global_position)
	var tile_ahead = tile_coords
	if heading & Direction.UP: 
		tile_ahead = tiles.get_neighbor_cell(tile_coords,TileSet.CELL_NEIGHBOR_TOP_SIDE)
	elif heading & Direction.RIGHT:
		tile_ahead = tiles.get_neighbor_cell(tile_coords,TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
	else :
		tile_ahead = tiles.get_neighbor_cell(tile_coords,TileSet.CELL_NEIGHBOR_LEFT_SIDE)
	
	#tile is free if it's null
	result = tiles.does_tile_exist(tile_ahead)
	
	return result

func pop():
	print("pop!")
	queue_free()
	
func release_enemy():
	pass


func _on_stomp_area_body_entered(body: Node2D) -> void:	
	if stomp_timer.is_stopped():
		stomp_timer.start()


func _on_stomp_timer_timeout() -> void:
	pop()


func _on_stomp_area_body_exited(body: Node2D) -> void:
	stomp_timer.stop()
