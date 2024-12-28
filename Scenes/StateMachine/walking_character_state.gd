extends CharacterState
class_name WalkingCharacterState

func physics_update(delta):
	print("WALK physics update")
	super(delta)
	
	if not character.is_on_floor():
		state_changed.emit(self, "falling")
	elif move_request.y != 0.0:
		state_changed.emit(self, "jumping")
	elif move_request == Vector2.ZERO:
		state_changed.emit(self, "idle")
	else:
		character.velocity.x = move_request.x * character.speed
	
