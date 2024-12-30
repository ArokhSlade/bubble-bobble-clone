extends State


func physics_update(delta):
	var body = stateful_object as CharacterBody2D
	var move_request = state_machine.brain.get_movement_request()

	var wants_move_horizontally = state_machine.Movement.wants_move_horizontally(move_request)
	var wants_jump = state_machine.Movement.wants_jump(move_request)	
	var wants_walk = wants_move_horizontally and not wants_jump	
	var wants_stop = not (wants_move_horizontally or wants_jump)
	
	move(body, move_request, wants_move_horizontally, wants_jump, wants_stop)
	transition(body, wants_walk, wants_jump, wants_stop)


func move(body, move_request, wants_move_horizontally, wants_jump, wants_stop):
	if wants_move_horizontally:
		state_machine.movement.move_horizontally(move_request)
		
	if (body.is_on_floor()):
		if wants_jump:
			state_machine.movement.jump()
		if wants_stop:
			state_machine.movement.stop()
	else: 
		state_machine.movement.apply_gravity(get_physics_process_delta_time())
	

func transition(body, wants_walk, wants_jump, wants_stop):
	if body.is_on_floor(): 
		if wants_jump: 
			transitioned.emit(self, state_machine.jumping)
		elif wants_walk:
			transitioned.emit(self, state_machine.walking)
		elif wants_stop:
			transitioned.emit(self, state_machine.standing)