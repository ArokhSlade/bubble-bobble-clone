extends EnemyState
class_name FallingEnemyState

var is_first_frame : bool

func enter():
	is_first_frame = true

func physics_update(delta):
	super(delta)
	
	if not enemy.is_on_floor():
		
		enemy.velocity += enemy.get_gravity() * delta
		
		if is_first_frame :			
			is_first_frame = false
			print("player 2 falls: ", enemy.velocity.y)
		else :
			print("player 2 falling: ", enemy.velocity.y)
			
		enemy.velocity.x = move_request.x * enemy.speed
		
	
	elif move_request.y != 0.0:
			state_changed.emit(self,"jumping")
	elif move_request.x != 0.0:		
		state_changed.emit(self,"walking")
