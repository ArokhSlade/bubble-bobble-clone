extends CharacterState
class_name JumpingCharacterState

func enter():
	character.velocity.y = character.jump_speed
	state_changed.emit(self, "falling")
