extends Node2D

var nomNewBuilding: String = "NOM 1"
var descNewBuilding: String = "DESCRIPCIO 1"
var revenue: int = 20

func _ready() -> void:
	#S'haurà de moure a load_init_data això
	$Nom.text = nomNewBuilding
	$Desc.text = descNewBuilding
	$Revenue.text = str(revenue)

func load_init_data():
	#TODO load data for option
	print("Implementation pending...")

func onSelect():
	get_tree().call_group("chooseNewBuildingGroup", "handle_building_option_selected", self)
