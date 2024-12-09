@tool
class_name EnemyList
extends Node2D

#@export var enemy_names : Array[String] :
	#set(value):
		#return
	#get():
		#return enemy_names
@export var entities : Array[PackedScene] :
	set(value):
		entities = value
		update_names()
@export var enemy_names : Array[String]

#func _get_property_list():
	#return([{
		#"name" : "enemy_names",
		#"type" : TYPE_ARRAY,
		#"hint" : PROPERTY_HINT_ARRAY_TYPE,
		#"hint_string" : "String",
		#"usage" : PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_READ_ONLY
	#}])
#func _set(property,value):
	#if property == "enemy_names":
		#hidden_enemy_names = value
		#return true		
	#return false
	#
#func _get(property):
	#if property == "enemy_names":
		#return hidden
func _init():
	_validate_property(enemy_names)

func _ready():
	update_names()	

func update_names():
	if entities == null:
		return
		
	var result : Array[String] = []
	for packed_scene in entities: 
		var name : String
		if packed_scene == null: 
			name = "<null>"
		else :
			var full_path = packed_scene.resource_path
			var name_begin_index = full_path.rfind("/") + 1
			var name_end_index = full_path.rfind(".")
			var name_length = name_end_index - name_begin_index
			name = full_path.substr(name_begin_index, name_length)
		print("name: ", name)
		result.append(name)
		
	
	enemy_names = result
	print(enemy_names)

static func join_strings(strings):
	var result : String = ""
	if strings.size() >= 1:
		result += strings[0]		
	for i in range(1,strings.size()):
		result += "," + strings[i]
	return result

func _validate_property(property):
	if property.has("name") && property["name"] == "enemy_names":
		property["usage"] |= PROPERTY_USAGE_READ_ONLY
