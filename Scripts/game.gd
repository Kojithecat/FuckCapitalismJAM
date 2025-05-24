extends Node2D

@onready var viewport = $SubViewport
@onready var sprite = $BusinessMan
@onready var chooseBuilding = $CanvasGroup/ChooseNewBuildingScreen
@onready var desnonar = $CanvasGroup/DesnonarScreen
var buildingSelected = 0
var localSelected = null
var option = 0
var counter = 1
var monthlyIncome = 0

func _ready() -> void:
	$Timer.timeout.connect(_on_timer_timeout)
#Cada 10 segons pasa un mes
func _on_timer_timeout():
	print("This happens every 10 seconds")
	#Increment del mes
	$Date.increment_date()
	#Guanyem l'income del mes 
	$Money.increment_money(monthlyIncome)
	
	# Your repeating code here

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
	#Descontem el cost de desnonar
	$Money.decrement_cost_desnonar()
	chooseBuilding.visible = true;

#Rep la info del nou negoci (choose_new_building_screen) i crida al local perque actualitzi les seves noves dades
func handle_new_building_selected(chooseNewBuildingNode):
	if(chooseNewBuildingNode.newPrice <= $Money.counter):
		localSelected.purchase_local(chooseNewBuildingNode.newName, chooseNewBuildingNode.newDesc, chooseNewBuildingNode.newRevenue)
		monthlyIncome += chooseNewBuildingNode.newRevenue
		$Money.decrement_money(chooseNewBuildingNode.newPrice)
	else:
		#Hem de fer handle per quan no tinguem prous diners (T'ho financia la familia, herencia, ajuda del banc, etc)
		print("No tens prous diners")
	#Descontar el cost del local en funció del local

func chooseAndLoadLocal(localNode):
	#TODO Fas counter i crides localNode.load_init_data()
	++counter
