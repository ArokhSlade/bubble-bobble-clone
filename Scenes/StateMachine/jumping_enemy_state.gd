extends EnemyState
class_name JumpingEnemyState

func enter():
	print("JUMP")
	enemy.velocity.y = enemy.jump_speed
	state_changed.emit(self, "falling")
