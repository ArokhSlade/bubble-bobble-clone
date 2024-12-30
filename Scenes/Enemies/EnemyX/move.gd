extends Node

signal velocity_changed(velocity : Vector2)

@export var body : CharacterBody2D

func on_velocity_modified(delta_velocity):
	body.velocity += delta_velocity
	
func on_velocity_set(new_velocity):
	body.velocity = new_velocity
