extends EnemyState
class_name JumpingEnemyState

func enter():
	enemy.velocity.y = enemy.jump_speed
	print("player 2 jumped: ", enemy.velocity.y)
	state_changed.emit(self, "falling")
