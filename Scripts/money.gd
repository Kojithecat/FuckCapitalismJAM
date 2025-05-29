extends Label

var counter: int = 1000000

var shake_offset = Vector2.ZERO
var shake_power: float = 0.0
var base_position = Vector2.ZERO

func _ready():
	add_theme_font_size_override("font_size", 45)  # Bigger text
	add_theme_color_override("font_color", Color.GREEN)
	add_theme_color_override("font_outline_color", Color.DARK_RED)
	add_theme_constant_override("outline_size", 4)
	base_position = position
	set_process(true)
	update_display()

func _process(delta):
	if shake_power > 0:
		# Apply random offset while maintaining base position
		shake_offset = Vector2(
			randf_range(-shake_power, shake_power),
			randf_range(-shake_power, shake_power)
		)
		position = base_position + shake_offset
		
		# Gradually reduce shake power
		shake_power = max(0, shake_power - delta * 10)  # Faster decay
	else:
		position = base_position

func shake(amount: float = 5.0, duration: float = 0.5):
	shake_power = amount
	# Optional: Automatically stop shaking after duration
	if duration > 0:
		await get_tree().create_timer(duration).timeout
		shake_power = 0

	
func increment_money(num):
	counter += num
	shake(8.0, 0.3)
	update_display()

func decrement_money(num):
	counter -= num
	update_display()

#El cost de desnonar es constant	
func decrement_cost_desnonar():
	counter -= 10000
	update_display()	


func update_display():
	self.text = "Wealth:\n" + str(counter) + "€"
