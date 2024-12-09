@tool
extends VBoxContainer

func update_ui(property: StringName, value: Variant, field: StringName, changing: bool):		
	$Label.text = str(value)	
	if value is EnemyChoice:
		var enemy_choice = value as EnemyChoice
		$OptionButton.selected = enemy_choice.scene_index
		
		var preview = EditorInterface.get_resource_previewer()
		print("is it null? ", enemy_choice.enemy_scene)
		if enemy_choice.enemy_scene != null:
			preview.queue_edited_resource_preview(enemy_choice.enemy_scene,self,"update_icon",null)
		else : 
			$TextureRect.texture = null

func update_icon( path:String , preview:Texture2D ,  thumbnail_preview:Texture2D, userdata:Variant):
	$TextureRect.texture = preview
