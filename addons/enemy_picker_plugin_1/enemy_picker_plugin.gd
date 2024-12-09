@tool
extends EditorPlugin

var inspector_plugin = preload("res://addons/enemy_picker_plugin_1/enemy_picker_inspector.gd")
var plugin_instance
var ui_instance = preload("res://addons/enemy_picker_plugin_1/enemy_picker_ui.tscn").instantiate()

func _enable_plugin():
	add_autoload_singleton("GlobalEnemyList", "res://addons/enemy_picker_plugin_1/global_enemy_list.tscn")

func _disable_plugin():
	remove_autoload_singleton("GlobalEnemyList")

func _enter_tree():
	plugin_instance = inspector_plugin.new()
	add_inspector_plugin(plugin_instance)

func _exit_tree():
	remove_inspector_plugin(plugin_instance)
