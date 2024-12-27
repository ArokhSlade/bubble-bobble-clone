extends EnemyState
class_name IdleEnemyState

func physics_update(delta):
	super(delta)
	if move_request.y != 0.0:
		state_changed.emit(self, "jumping")
	elif move_request.x != 0.0:
		state_changed.emit(self, "walking")
	elif not enemy.is_on_floor():
		state_changed.emit(self, "falling")
		
		
		

func enter():
	enemy.velocity = Vector2.ZERO