extends PanelContainer

func _ready():
	var style = StyleBoxFlat.new()
	
	# Basic style properties
	style.bg_color = Color(0.95, 0.95, 0.96)  # Off-white
	style.border_color = Color(0.2, 0.2, 0.2) # Light gray border
	style.border_width_left = 0.2
	style.border_width_right = 0.2
	style.border_width_top = 0.2
	style.border_width_bottom = 0.2
	
	# Rounded cornersfunc _ready():
	style.corner_radius_top_left = 12
	style.corner_radius_top_right = 12
	style.corner_radius_bottom_right = 12
	style.corner_radius_bottom_left = 12
	
	# Shadow for depth
	style.shadow_color = Color(0, 0, 0, 0.2)
	style.shadow_size = 4
	
	# Apply the style
	add_theme_stylebox_override("panel", style)
