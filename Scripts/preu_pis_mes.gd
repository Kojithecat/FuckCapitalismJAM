extends Label

const totalBuildings = 24

func _ready():
	add_theme_font_size_override("font_size", 32)  # Bigger text
	add_theme_color_override("font_color", Color.RED)
	add_theme_color_override("font_outline_color", Color.DARK_RED)
	add_theme_constant_override("outline_size", 4)
	update_display()
	
func _process(delta: float) -> void:
	update_display()

func update_display():
	var percentage: float = 400 + 2000 * (get_parent().get_parent().get_parent().counter-1)/totalBuildings
	var formatted = str("%.0f" % percentage)
	self.text = "Rent price: " + formatted + "€/month"
