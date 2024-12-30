extends Node
class_name Brain

@onready var tiles : TileMapLayer = get_tree().root.find_child("TileMapLayer",true,false)
@export var body : CharacterBody2D

const Direction = GlobalEnums.Direction

var want_to_jump : bool

func get_movement_request() -> Direction:
	var move_intent : Direction = body.heading	
	
	if !body.is_on_floor():
		move_intent = body.heading # left or right
	elif body.is_on_wall():
		if (can_jump_over_wall()):
			move_intent = jump_forward()
		else :
			move_intent = opposite_direction()	
	elif is_gap_ahead():
		if (can_jump_over_gap()):
			move_intent = jump_forward()
		else : 
			move_intent = opposite_direction()	
		
	body.update_heading(move_intent)
	
	
	return move_intent



func get_jump_height_in_tiles():
	#TODO compute properly
	return 2
	
func get_jump_width_in_tiles():
	#TODO compute properly
	return 3
	

func can_jump_over_wall():
	var wall_coords = get_floor_cell_coords()
	wall_coords.x += -1 if body.heading & Direction.LEFT else 1
	wall_coords.y -= 1
	return get_jump_height_in_tiles() >= measure_wall_at(wall_coords)


func is_gap_ahead():
	var floor_cell_in_front_coords = get_floor_cell_coords()
	floor_cell_in_front_coords.x += -1 if body.heading & Direction.LEFT else 1
	return measure_gap_at(floor_cell_in_front_coords, body.heading) > 0
	
	
func can_jump_over_gap():
	var gap_coords = get_floor_cell_coords()
	gap_coords.x += -1 if body.heading & Direction.LEFT else 1	
	return get_jump_width_in_tiles() > measure_gap_at(gap_coords, body.heading)
	


	
func get_floor_cell_coords() -> Vector2i:
	var my_position = tiles.to_local(body.global_position)
	var my_tile_coords = tiles.local_to_map(my_position)
	
	#todo: find a structure that helps callers be aware when no floor exists
	var floor_cell_coords := Vector2i()
	
	if body.is_on_floor():
		#todo: support tiles with partial collision zones
		#var collision_count = get_slide_collision_count()
		#for i in range(collision_count):
			#var collision = get_slide_collision(i)
			#var collider_class : String = collision.get_collider().get_class()
			#if (collider_class != "TileMapLayer"):
				#continue
			#var collider_rid : RID = collision.get_collider_rid()
			#floor_cell_coords = tiles.get_coords_for_body_rid(collider_rid)
			
		floor_cell_coords = my_tile_coords
		floor_cell_coords.y += 1
	return floor_cell_coords
	



func measure_wall_at(cell_coords : Vector2i) -> int:
	var checked_coords : Vector2i = cell_coords
	
	var cell_data = tiles.get_cell_tile_data(cell_coords)
	var wall_height = 0
	var wall_exists = cell_data != null
	
	var found_wall_top = !wall_exists	
	const HEIGHT_LIMIT = 10
	
	while !found_wall_top:
			
		wall_height += 1
		checked_coords.y -= 1 #"up" is negative in the y direction
		found_wall_top = tiles.get_cell_tile_data(checked_coords) == null
		
		if wall_height == HEIGHT_LIMIT:
			break
		
	return wall_height


func measure_gap_at(cell_coords : Vector2i, direction : Direction) -> int:
	if !(direction & (Direction.LEFT|Direction.RIGHT)) :
		return -1
		
	var step = -1 if direction & Direction.LEFT else 1
	var checked_coords : Vector2i = cell_coords	
	var cell_data = tiles.get_cell_tile_data(checked_coords)
	var gap_width = 0
	
	var found_end_of_gap = cell_data != null
	const WIDTH_LIMIT = 10
	
	while !found_end_of_gap:
		checked_coords.x += step
		gap_width += 1
		found_end_of_gap = tiles.get_cell_tile_data(checked_coords)
		
		if gap_width == WIDTH_LIMIT:
			break
		
	return gap_width


func jump_forward():
	want_to_jump = true
	return Direction.UP | body.heading

func opposite_direction() -> Direction:
	if (body.heading & Direction.LEFT):
		return Direction.RIGHT
	else :
		return Direction.LEFT	

func stop_moving():
	return Direction.NONE
