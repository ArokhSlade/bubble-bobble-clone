extends State

@export var reward : PackedScene

func enter():
	spawn_reward()
	disappear()
