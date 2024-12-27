extends EnemyState
class_name WalkingEnemyState

func physics_update(delta):
	super(delta)
	
	if not enemy.is_on_floor():
		state_changed.emit(self, "falling")
	elif move_request.y != 0.0:
		state_changed.emit(self, "jumping")
	elif move_request == Vector2.ZERO:
		state_changed.emit(self, "idle")
	else:
		enemy.velocity.x = move_request.x * enemy.speed
	
