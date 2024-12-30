extends "res://Scenes/Enemies/EnemyX/live.gd"



func on_rage_timer_finished():
	transitioned.emit("rage")

func on_hit_by_bubble():
	transitioned.emit(self, "bubbled")
