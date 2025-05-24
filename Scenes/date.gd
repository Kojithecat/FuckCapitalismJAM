extends Label

var date = {"month":9, "year":1992}

func _ready():
	print(date["month"])
	update_display()
	
func update_display():
	text = "%02d-%04d" % [date["month"], date["year"]]

#Incrementa un mes
func increment_date():
	print("TIMER")
	date["month"] = (date["month"] + 1) % 13
	if(date["month"] == 0):
		date["month"] += 1
		date["year"] += 1
	update_display()
