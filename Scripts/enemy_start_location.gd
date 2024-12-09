@tool
extends Marker2D



var enemy_instance

func _ready():
	if enemy && enemy.enemy_scene: 
		enemy_instance = enemy.enemy_scene.instantiate()
		add_child(enemy_instance)
	else : 
		push_warning("cannot spawn enemy because no enemy was selected")



@export var enemy : EnemyChoice :
	set(value):		
		enemy = value
		if enemy:
			print_rich("[color=green]setting scene %s to %s[/color]" %[enemy.enemy_scene, value.enemy_scene])
			set("enemy_scene", value.enemy_scene)
			notify_property_list_changed()
			queue_redraw()
		
	
func _get_property_list():
	return([{
		"name" : "enemy_scene",
		"type" : TYPE_OBJECT,
		"tye_hint" : PROPERTY_HINT_RESOURCE_TYPE,
		"hint_string" : "PackedScene",
		"usage" : PROPERTY_USAGE_DEFAULT #| PROPERTY_USAGE_READ_ONLY #if it's read-only we cannot change enemy by drag-and-drop
	}])
	
func _get(property):
	if property == "enemy_scene":
		if enemy:
			return enemy.enemy_scene

func _set(property, value):
	if property == "enemy_scene":
		var index = GlobalEnemyList.entities.find(value)
		if index >= 0:
			if enemy:
				enemy.enemy_scene = value
				enemy.scene_index = index
				notify_property_list_changed()
				queue_redraw()
		return true
	return false
