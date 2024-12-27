extends Node

#NOTE(ArokhSlade, 2024 12 27): these are ideas for now
enum EnemyState {
	NONE,
	PRE_GAME,
	ROAMING,
	JUMPING,
	DEAD
}

enum Direction {
	NONE 		= 0x0, 
	LEFT		= 0x1 << 0, 
	RIGHT 		= 0x1 << 1, 
	UP 			= 0x1 << 2,
	DOWN 		= 0x1 << 3
}



static func as_vector2(direction : Direction) -> Vector2:
	var result := Vector2()
	
	if (direction & Direction.RIGHT) :
		result.x = 1.0
	elif (direction & Direction.LEFT) : 
		result.x = -1.0
	if (direction & Direction.UP) : 
		result.y = -1.0
	elif (direction & Direction.DOWN) : 
		result.y = 1.0
		
	return result
	
static func from_vector2(vec2 : Vector2) -> Direction:
	var result : Direction
	if vec2.x != 0.0:
		result |= Direction.RIGHT if vec2.x > 0.0 else Direction.LEFT
	if vec2.y != 0.0:
		result |= Direction.DOWN if vec2.y > 0.0 else Direction.UP
		
	return result

static func horizontal(direction : Direction, allow_both : bool = false) -> Direction:
	var result = direction & (Direction.LEFT | Direction.RIGHT)
	if !allow_both and result & Direction.LEFT and result & Direction.RIGHT:
		result = false
	return result

static func vertical(direction : Direction, allow_both : bool = false) -> Direction:
	var result = direction & (Direction.UP | Direction.DOWN)
	if !allow_both and result & Direction.UP and result & Direction.DOWN:
		result = false
	return result
