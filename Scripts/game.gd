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
	if(monthlyIncome > 0):
		$Money.increment_money(monthlyIncome)
		$AudioStreamPlayer2D.play()
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
	set_locals_enabled($Map, false)
	desnonar.load_data(localNode.nameOg, localNode.descriptionOg, localNode.preu)
	
#Rep avís que la pantalla de desnonar s'ha confirmat i activa la de triar nou negoci
func handle_desnonar_confirmed():
	desnonar.visible = false;
	chooseBuilding.visible = true;

#Rep la info del nou negoci (choose_new_building_screen), crida al local perque actualitzi les seves noves dades i gestiona diners
func handle_new_building_selected(chooseNewBuildingNode):
	if(chooseNewBuildingNode.newPrice + 10000 <= $Money.counter):
		localSelected.purchase_local(chooseNewBuildingNode.newName, chooseNewBuildingNode.newDesc, chooseNewBuildingNode.newRevenue)
		monthlyIncome += chooseNewBuildingNode.newRevenue
		$Money.decrement_money(chooseNewBuildingNode.newPrice)
		# Cal ficar el preu local? Ja tenim el de desnonar i el del nou local $Money.decrement_money(localSelected.preu)
		#Descontem el cost de desnonar
		$Money.decrement_cost_desnonar()
		set_locals_enabled($Map, true)
		counter += 1
	else:
		#TODO Hem de fer handle per quan no tinguem prous diners (T'ho financia la familia, herencia, ajuda del banc, etc)
		print("No tens prous diners")
		#Descontar el cost del local en funció del local
	set_locals_enabled($Map, true)

func chooseAndLoadLocal(localNode):
	if counter <= 24:
		var file_path = "res://assets/Locals/" + str(counter) + ".json"
		var json_as_text = FileAccess.get_file_as_string(file_path)
		var json_as_dict = JSON.parse_string(json_as_text)
		localNode.load_init_data(json_as_dict["name"], json_as_dict["desc"], json_as_dict["preu"])
	else:
		print("S'han comprat tots els locals")

func onCancel():
	set_locals_enabled($Map, true)

#Funció recursiva per a descativar/activar els butons de l'escena principal
func set_locals_enabled(node, enabled):
	for child in node.get_children():
		if child is Button:
			child.disabled = !enabled
		set_locals_enabled(child, enabled) # Recursive call
