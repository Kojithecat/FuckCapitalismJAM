extends Label

func _ready():
	add_theme_font_size_override("font_size", 32)  # Bigger text
	add_theme_color_override("font_color", Color.WHITE_SMOKE)
	add_theme_color_override("font_outline_color", Color.BLACK)
	add_theme_constant_override("outline_size", 10)
	update_display()
	
func update_display():
	text = "Chooose building"
