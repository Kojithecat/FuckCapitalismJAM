extends Node2D

@onready var Nom = $Nom
@onready var Desc = $Desc

func _ready():
	load_and_display_json()

func load_and_display_json():
	# Load the JSON file
	var num_historia = get_hist_num()
	var path = "res://assets/Histories/"+str(num_historia)+".json"
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		var error = FileAccess.get_open_error()
		Nom.text = "Error loading file: " + str(error)
		Desc.text = "Error loading file: " + str(error)
		return
	
	# Parse the JSON data
	var json = JSON.new()
	var parse_result = json.parse(file.get_as_text())
	file.close()
	
	if parse_result != OK:
		Nom.text = "JSON Parse Error: " + json.get_error_message()
		Desc.text = "JSON Parse Error: " + json.get_error_message()
		return
	# Get the parsed data
	var data = json.get_data()
	
	# Update the label with the data
	# Modify this part based on your JSON structure
	if typeof(data) == TYPE_DICTIONARY:
		Nom.text = str(data.get("name"))  
		Desc.text = str(data.get("desc"))  
		# OR access specific values, e.g.:
		# label.text = data.get("some_key", "Default text")
		
func get_hist_num():
	#El num el treiem del nom de l'escena, així podem relacionar text, avia, localantic, localnou,...
	var scene_name = get_tree().current_scene.name
	return str(scene_name)[-1]
