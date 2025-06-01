extends PanelContainer

func _ready():
	var style = StyleBoxFlat.new()
	var new_focus_style = StyleBoxFlat.new()
	new_focus_style.border_color = Color(1, 0.5, 0.2) #
	new_focus_style.border_width_left = 2
	new_focus_style.border_width_right = 2
	new_focus_style.border_width_top = 2
	new_focus_style.border_width_bottom = 2
	new_focus_style.corner_radius_top_left = 12
	new_focus_style.corner_radius_top_right = 12
	new_focus_style.corner_radius_bottom_right = 12
	new_focus_style.corner_radius_bottom_left = 12
	$Option1.add_theme_stylebox_override("focus", new_focus_style)
	
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
