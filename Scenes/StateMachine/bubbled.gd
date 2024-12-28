extends CharacterState
class_name Bubbled


@export var bubbled_sprite : Sprite2D 
var character_sprite : Sprite2D

func enter() : 
	character_sprite = character.get_node(^"Sprite2D")
	character_sprite = bubbled_sprite
	
func physics_update(delta):
	super(delta)
	
	
	
