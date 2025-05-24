extends Node2D

class_name Local

@export var preu: int = 10
@export var purchased: bool = false
@export var nameOg: String = "nom"
@export var descriptionOg: String = "descripcio"
@export var nameNew: String
@export var descriptionNew: String
@export var revenue: int = 0

func load_init_data():
	#TODO load data for option
	print("Implementation pending...")

func on_local_pressed() -> void:
	if !purchased:
		get_tree().call_group("gameController", "handle_local_selected", self)
	else:
		#TODO s'hauria de mostrar una altra pantalla amb la nova info, que sigui només de consulta
		print("El local ja ha estat desnonat")	
	
func purchase_local(newName: String, newDesc: String, newRevenue: int):
	nameNew = newName
	descriptionNew = newDesc
	revenue = newRevenue
	purchased = true
	$Control/PlaceholderFons.color = "FF00FF"
