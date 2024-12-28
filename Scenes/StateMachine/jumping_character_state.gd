extends CharacterState
class_name JumpingCharacterState

func enter():
	print("JUMP")
	character.velocity.y = character.jump_speed
	state_changed.emit(self, "falling")
