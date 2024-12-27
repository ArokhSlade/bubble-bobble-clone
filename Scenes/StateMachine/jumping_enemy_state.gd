extends EnemyState
class_name JumpingEnemyState

func enter():
	enemy.velocity.y = enemy.jump_speed
	state_changed.emit(self, "falling")
