extends Node2D

@onready var nomDisplay = $Nom
@onready var descDisplay = $Desc
@onready var preuDisplay = $Preu
#El cost de desnonar es constant (10k) per demostrar que qualsevol amb diners te el poder de desnonar 
var costDesnonar = 10000

func load_data(nom: String, desc: String, preu: int):
	nomDisplay.text = nom
	descDisplay.text = desc
	preuDisplay.text = str(preu)

#Ja no cal
func load_and_display_json():
	# Load the JSON file
	var num_historia = get_hist_num()
	var path = "res://assets/Histories/"+str(num_historia)+".json"
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		var error = FileAccess.get_open_error()
		nomDisplay.text = "Error loading file: " + str(error)
		descDisplay.text = "Error loading file: " + str(error)
		return
	
	# Parse the JSON data
	var json = JSON.new()
	var parse_result = json.parse(file.get_as_text())
	file.close()
	
	if parse_result != OK:
		nomDisplay.text = "JSON Parse Error: " + json.get_error_message()
		descDisplay.text = "JSON Parse Error: " + json.get_error_message()
		return
	# Get the parsed data
	var data = json.get_data()
	
	# Update the label with the data
	# Modify this part based on your JSON structure
	if typeof(data) == TYPE_DICTIONARY:
		nomDisplay.text = str(data.get("name"))  
		descDisplay.text = str(data.get("desc"))  
		# OR access specific values, e.g.:
		# label.text = data.get("some_key", "Default text")

#Ja no cal
func get_hist_num():
	#El num el treiem del nom de l'escena, així podem relacionar text, avia, localantic, loc
	var scene_name = get_tree().current_scene.name
	return str(scene_name)[-1]

func onAcceptTermsAndConditions():
	$AudioStreamPlayer2D.play()
	get_tree().call_group("gameController", "handle_desnonar_confirmed")
	self.visible = false

func onCancel():
	self.visible = false
