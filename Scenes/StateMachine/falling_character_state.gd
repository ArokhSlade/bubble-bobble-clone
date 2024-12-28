extends CharacterState
class_name FallingCharacterState

var is_first_frame : bool

func enter():
	is_first_frame = true

func physics_update(delta):
	print("FALL physics update")
	super(delta)
	
	if not character.is_on_floor():		
		character.velocity += character.get_gravity() * delta
		character.velocity.x = move_request.x * character.speed
	
	elif move_request.y != 0.0:
			state_changed.emit(self,"jumping")
	elif move_request.x != 0.0:		
		state_changed.emit(self,"walking")
