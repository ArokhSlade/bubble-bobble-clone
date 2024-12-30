extends Node

@export var projectile : PackedScene
@export var projectile_owner : Node # future parent for projectile

func shoot(direction):
	var shot = projectile.instantiate()
	shot.direction = direction #TODO
	projectile.owner = projectile_owner
	projectile.owner.add_child(shot)
