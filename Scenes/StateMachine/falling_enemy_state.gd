extends EnemyState
class_name FallingEnemyState

var is_first_frame : bool

func enter():
	is_first_frame = true

func physics_update(delta):
	print("FALL physics update")
	super(delta)
	
	if not enemy.is_on_floor():		
		enemy.velocity += enemy.get_gravity() * delta
		enemy.velocity.x = move_request.x * enemy.speed
	
	elif move_request.y != 0.0:
			state_changed.emit(self,"jumping")
	elif move_request.x != 0.0:		
		state_changed.emit(self,"walking")
