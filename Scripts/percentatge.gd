extends Label

var edificis_locals: int = 20
var edificis_guiris: int = 1

func _ready():
	update_display()

func update_display():
	var percentage: float = 100.0 * edificis_guiris/(edificis_locals + edificis_guiris)
	var formatted = str("%.2f" % percentage)
	self.text = formatted + "% touristification"
