extends State


signal arrived
@export var float_object : Node2D
@export var float_speed : float
var float_tween : Tween
@export var target_position : Vector2


func enter(previous = null):
	float_tween = create_tween()
	float_tween.finished.connect(on_float_finished)	
	var float_distance = (target_position-float_object.global_position).length
	var float_seconds = float_distance / float_speed
	float_tween.tween_property(float_object, "global_position", target_position, float_seconds)

func on_float_finished():
	arrived.emit()
	
func on_pre_game_finished():
	transitioned.emit(self, "live")
