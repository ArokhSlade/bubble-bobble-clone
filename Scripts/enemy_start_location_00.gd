extends Marker2D

@export_category("my first export category")

const my_resurce : Resource = preload("res://Resources/new_resource.tres")

@export var textures : Array[Texture2D]

enum MyEnum{NONE = 0, CHOMPER = 10, GHOST = 100}

@export var my_enum : MyEnum:
	set(value):
		my_enum = value
		update_texture_index()
		queue_redraw()

var texture_index : int #internal, controlled via my_enum and get_texture_index()

func update_texture_index():
	texture_index = get_texture_index()

func get_texture_index() -> int:
	var result = 0
	MyEnum.find_key(my_enum)
	
	return result
	
func _draw():	
	var texture_index = get_texture_index()
	if texture_index == MyEnum.NONE:
		return
				
	var sprite_dim = 24	
	draw_texture_rect_region(textures[texture_index], Rect2(Vector2(),Vector2(sprite_dim,sprite_dim)), Rect2(Vector2(),Vector2(sprite_dim,sprite_dim)))
