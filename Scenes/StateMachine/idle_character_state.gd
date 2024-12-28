extends CharacterState
class_name IdleCharacterState

func physics_update(delta):
	print("IDLE physics update")
	super(delta)
	if move_request.y != 0.0:
		state_changed.emit(self, "jumping")
	elif move_request.x != 0.0:
		state_changed.emit(self, "walking")
	elif not character.is_on_floor():
		state_changed.emit(self, "falling")
		
		
		

func enter():
	print("IDLE ENTER")
	character.velocity = Vector2.ZERO
