extends Label

var counter: int = 0

func _ready():
	update_display()
	
func _input(event):
	
	if event is InputEventKey:
		if event.keycode == KEY_SPACE and event.pressed:
			increment_money()

func increment_money():
	counter += 1
	update_display()

func update_display():
	self.text = str(counter) + "€"
