extends Node2D

@onready var viewport = $SubViewport
@onready var sprite = $BusinessMan
@onready var chooseBuilding = $CanvasGroup/ChooseNewBuildingScreen
@onready var desnonar = $CanvasGroup/DesnonarScreen
var buildingSelected = 0
var localSelected = null
var option = 0
var counter = 1

func _ready() -> void:
	pass

func _process(delta):
	var texture = viewport.get_texture()
	sprite.texture = texture
	add_to_group("gameController")

#Rep avís que s'ha triat un local i activa la pantalla de desnonar amb la info corresponent
func handle_local_selected(localNode):
	localSelected = localNode
	chooseAndLoadLocal(localNode)
	desnonar.visible = true
	desnonar.load_data(localNode.nameOg, localNode.descriptionOg, localNode.preu)

#Rep avís que la pantalla de desnonar s'ha confirmat i activa la de triar nou negoci
func handle_desnonar_confirmed():
	desnonar.visible = false;
	chooseBuilding.visible = true;

#Rep la info del nou negoci (choose_new_building_screen) i crida al local perque actualitzi les seves noves dades
func handle_new_building_selected(chooseNewBuildingNode):
	localSelected.purchase_local(chooseNewBuildingNode.newName, chooseNewBuildingNode.newDesc, chooseNewBuildingNode.newRevenue)

func chooseAndLoadLocal(localNode):
	#TODO Fas counter i crides localNode.load_init_data()
	++counter
