extends EnemyState
class_name PreGameFloatingEnemyState

var initial_position : Vector2
@onready var target_position : Vector2
var floating_tween : Tween
@export var floating_speed : int = 40

func get_out_of_screen_position() -> Vector2 :
	var result = Vector2()
	result.x = target_position.x
	result.y = 0
	result.y -= enemy.get("LOWER_HALF_HEIGHT") #NOTE(ArokhSlade, 2024 12 28): NO-OP if it doesn't exist
	return result
	
func enter(): 
	target_position = enemy.global_position
	initial_position = get_out_of_screen_position()
	enemy.global_position = initial_position
	initiate_float_to_target_position()
	
func initiate_float_to_target_position():
	
	floating_tween = enemy.create_tween()
	floating_tween.finished.connect(on_float_finished)
	var floating_seconds = get_floating_seconds()
	floating_tween.tween_property(enemy, "global_position", target_position, floating_seconds)

func get_floating_seconds():
	var floating_seconds
	var floating_distance = (target_position - initial_position).length()
	floating_seconds = floating_distance / floating_speed
	return floating_seconds
	
func on_float_finished():
	state_changed.emit(self, "idle")
	floating_tween.kill()
