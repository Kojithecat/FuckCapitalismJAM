extends Label

var counter: int = 1000000

func _ready():
	update_display()
	
func _input(event):
	pass
	
func increment_money(num):
	counter += num
	update_display()

func decrement_money(num):
	counter -= num
	update_display()

#El cost de desnonar es constant	
func decrement_cost_desnonar():
	counter -= 10000
	update_display()	


func update_display():
	self.text = str(counter) + "€"
