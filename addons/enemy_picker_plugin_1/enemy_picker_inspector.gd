@tool
extends EditorInspectorPlugin

var enemy_picker_property = preload("res://addons/enemy_picker_plugin_1/enemy_picker_property.gd")
var property_instance


func _can_handle(object : Object):
	return true


func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if type == TYPE_OBJECT && hint_string == "EnemyChoice":
		var property = object.get(name)
		print ("object: ", object)		
		print("property: ", property)
		
		property_instance = enemy_picker_property.new(property)
		add_property_editor(name, property_instance)		
		
		return true #return false / nothing to let godot show default ui in addition to ours
