extends EnemyState
class_name FallingEnemyState


func physics_update(delta):
	super(delta)		
	if not enemy.is_on_floor():
		enemy.velocity += enemy.get_gravity() * delta
		enemy.velocity.x = move_request.x * enemy.speed
		
	elif move_request.y != 0.0:
			state_changed.emit(self,"jumping")
	elif move_request.x != 0.0:		
		state_changed.emit(self,"walking")
