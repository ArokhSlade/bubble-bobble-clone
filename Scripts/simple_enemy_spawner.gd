@tool
extends Marker2D

## STATIC DATA
enum EnemyType {
	NONE = 0,
	BASIC_BOB = 10,
	ELITE_DELETER = 100,
	FINAL_FANATIC = 1000
}

static var available_enemy_types : Array[PackedScene] = [
	preload("res://Scenes/enemy_1.tscn"),
	preload("res://Scenes/enemy_2.tscn"),
	preload("res://Scenes/enemy_3.tscn")
]

const INVALID_INDEX : int = -1


## PROPERTIES
@export var enemy_type : EnemyType : 
	set(value):
		if enemy_type == value:
			return		
		enemy_type = value
		if Engine.is_editor_hint():
			if enemy_instance:
				enemy_instance.queue_free()
			enemy_instance = get_instance()
			if enemy_instance:
				add_child(enemy_instance)
			queue_redraw()

@onready var enemy_instance : Node = get_instance()


## MAIN BUSINESS METHODS
func _ready():	
	if enemy_instance:
		add_child(enemy_instance)
	elif enemy_type != EnemyType.NONE:
		push_error("failed to instantiate enemy")


## HELPER METHODS
func get_instance() -> Node:
	var instance = null
	var scene = get_scene()
	if scene:
		instance = scene.instantiate()
	return instance


func get_scene() -> PackedScene :
	var scene : PackedScene = null
	var index = map_enemy_type_to_index(enemy_type)
	if index != INVALID_INDEX:
		scene = available_enemy_types[index]
	return scene


static func map_enemy_type_to_index(type:EnemyType) -> int:
	var index = INVALID_INDEX # result for NONE and invalid values
	if type == EnemyType.BASIC_BOB:
		index = 0
	elif type == EnemyType.ELITE_DELETER:
		index = 1
	elif type == EnemyType.FINAL_FANATIC:
		index = 2
	return index
