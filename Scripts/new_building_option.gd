extends Node2D

@export var nomNewBuilding: String = "NOM 1"
@export var descNewBuilding: String = "DESCRIPCIO 1"
@export var revenue: int = 20
@export var price: int = 100
var icon: CompressedTexture2D

func _ready() -> void:
	#S'haurà de moure a load_init_data això
	$Nom.text = nomNewBuilding
	$Price.text = str(price) + " $"
	$Revenue.text = str(revenue) + " $/month"
	
	icon = $PanelContainer/Option1.icon

func load_init_data():
	#TODO load data for option
	print("Implementation pending...")

func onSelect():
	get_tree().call_group("chooseNewBuildingGroup", "handle_building_option_selected", self)
