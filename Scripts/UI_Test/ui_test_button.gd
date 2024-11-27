extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	var wild_color = get_theme_color("wild_color", "WildThemeType")
	add_theme_color_override("font_color",wild_color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
