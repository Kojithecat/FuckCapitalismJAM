extends Node2D

@onready var viewport = $SubViewport
@onready var sprite = $BusinessMan
@onready var chooseBuilding = $CanvasGroup/ChooseNewBuildingScreen
@onready var desnonar = $CanvasGroup/DesnonarScreen
var buildingSelected = 0
var localSelected = null
var option = 0

func _ready() -> void:
	pass

func _process(delta):
	var texture = viewport.get_texture()
	sprite.texture = texture
	add_to_group("gameController")

#Rep avís que s'ha triat un local i activa la pantalla de desnonar amb la info corresponent
func handle_local_selected(data):
	print(data.preu)
	localSelected = data
	desnonar.visible = true
	desnonar.load_data(data.nameOg, data.descriptionOg, data.preu)

#Rep avís que la pantalla de desnonar s'ha confirmat i activa la de triar nou negoci
func handle_desnonar_confirmed():
	desnonar.visible = false;
	chooseBuilding.visible = true;

#Rep la info del nou negoci (choose_new_building_scrren) i crida al local perque actualitzi les seves noves dades
func handle_new_building_selected(data):
	localSelected.purchase_local(data.newName, data.newDesc, data.newRevenue)
