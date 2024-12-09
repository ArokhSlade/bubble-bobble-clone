@tool
class_name EnemyChoice
extends Resource

var enemy_scene : PackedScene # refers to an element of global enemy list
var scene_index : int # index of scene in global enemy list

func print():
	print(self, " : ", enemy_scene, " : ", scene_index)
