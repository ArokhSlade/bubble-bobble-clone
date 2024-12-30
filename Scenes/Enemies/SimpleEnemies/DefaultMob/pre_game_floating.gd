extends State

signal pre_game_floating_entered(call_when_all_pre_game_floats_finished: Callable)
signal pre_game_floating_finished
@export var float_speed : float
var float_tween : Tween
@export var target_position : Vector2

@export var sprite : Sprite2D

func enter(previous = null):
	pre_game_floating_entered.emit(on_pre_game_finished)
	target_position = stateful_object.global_position
	move_beyond_top_side_of_screen()
	float_tween = create_tween()
	float_tween.finished.connect(on_float_finished)	
	var float_distance = (target_position-stateful_object.global_position).length()
	var float_seconds = float_distance / float_speed
	var tweener = float_tween.tween_property(stateful_object, "global_position", target_position, float_seconds)
	print(tweener)

func move_beyond_top_side_of_screen():
	var body = stateful_object as CharacterBody2D
	var BODY_LOWER_HALF_HEIGHT = sprite.get_rect().size.y / 2
	body.global_position.y = 0 - BODY_LOWER_HALF_HEIGHT

func on_float_finished():
	pre_game_floating_finished.emit()
	
# NOTE(ArokhSlade, 2024 12 30): the state machine is responsible for causing 
# the transition out from pre-game once all pre_game floaters have arrived
func on_pre_game_finished():
	transitioned.emit(self, state_machine.walking)
