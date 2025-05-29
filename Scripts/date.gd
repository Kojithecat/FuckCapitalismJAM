extends Label

var date = {"month":01, "year":2000}

func _ready():
	add_theme_font_size_override("font_size", 32)  # Bigger text
	add_theme_color_override("font_color", Color.GOLD)
	add_theme_color_override("font_outline_color", Color.DARK_RED)
	add_theme_constant_override("outline_size", 4)
	print(date["month"])
	update_display()
	
func update_display():
	text = "Date: " + "%02d-%04d" % [date["month"], date["year"]]
	
#Incrementa un mes
func increment_date():
	print("TIMER")
	date["month"] = (date["month"] + 1) % 13
	if(date["month"] == 0):
		date["month"] += 1
		date["year"] += 1
	update_display()
