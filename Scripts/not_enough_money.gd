extends Label

func _ready():
	add_theme_font_size_override("font_size", 32)  # Bigger text
	add_theme_color_override("font_color", Color.RED)
	add_theme_color_override("font_outline_color", Color.DARK_RED)
	add_theme_constant_override("outline_size", 4)
	update_display()
	
func update_display():
	text = "You don't have enough cash!"
