extends CharacterBody2D


const speed = 30.0
const jump_speed = -100.0

enum MoveRequest {
	NONE = 0x1 << 0, 
	LEFT = 0x1 << 1, 
	RIGHT = 0x1 << 2, 
	JUMP = 0x1 << 3
}

func get_movement_request() -> Vector2:
	var move : MoveRequest = MoveRequest.LEFT
	
	var request : Vector2 = Vector2(0.0,0.0)
	if (move & MoveRequest.RIGHT) :
		request.x = 1.0
	elif (move & MoveRequest.LEFT) : 
		request.x = -1.0
	if (move & MoveRequest.JUMP) : 
		request.y = 1.0	
	return request

func _physics_process(delta):
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	var move_request = get_movement_request()
	
	if move_request.y > 0.0 and is_on_floor():
		velocity.y = jump_speed

	var direction = move_request.x
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
