extends PanelContainer
		
func _ready():
	# Create and configure the stylebox
	var style = StyleBoxFlat.new()
	
	# Basic style properties
	style.bg_color = Color(0.95, 0.95, 0.96)  # Off-white
	style.border_color = Color(0.8, 0.8, 0.82) # Light gray border
	style.border_width_left = 1
	style.border_width_right = 1
	style.border_width_top = 1
	style.border_width_bottom = 1
	
	# Rounded corners
	style.corner_radius_top_left = 12
	style.corner_radius_top_right = 12
	style.corner_radius_bottom_right = 12
	style.corner_radius_bottom_left = 12
	
	# Shadow for depth
	style.shadow_color = Color(0, 0, 0, 0.2)
	style.shadow_size = 4
	
	# Apply the style
	add_theme_stylebox_override("panel", style)
	
		# Center the label horizontally and vertically
	$MarginContainer.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	
	# Optional: If you want the panel to shrink-wrap the label
	size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	size_flags_vertical = Control.SIZE_SHRINK_CENTER
