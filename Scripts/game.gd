extends Node2D

@onready var viewport = $SubViewport
@onready var sprite = $BusinessMan
@onready var chooseBuilding = $CanvasGroup/ChooseNewBuildingScreen
@onready var chooseBuildingParc = $CanvasGroup/ChooseNewBuildingParcScreen
@onready var desnonar = $CanvasGroup/DesnonarScreen

var localSelected = null
var option = 0
var counter = 1
var totalLocalNum = 26
var monthlyIncome = 0
var endGameUnlocked = false

#Cada 10 segons pasa un mes
func _ready() -> void:
	$Timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	print("This happens every 5 seconds")
	#Increment del mes
	$TimerContainer/MarginContainer/Date.increment_date()
	#Guanyem l'income del mes 
	if(monthlyIncome > 0):
		$WealthContainer/MarginContainer/Money.increment_money(monthlyIncome)
		$Income.play()
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
	if(!localSelected.isParc):
		chooseBuilding.visible = true;
	else:
		chooseBuildingParc.visible = true;

#Rep la info del nou negoci (choose_new_building_screen), crida al local perque actualitzi les seves noves dades i gestiona diners
func handle_new_building_selected(chooseNewBuildingNode):
	if(chooseNewBuildingNode.newPrice + 10000 <= $WealthContainer/MarginContainer/Money.counter):
		localSelected.purchase_local(chooseNewBuildingNode.newName, chooseNewBuildingNode.newDesc, 
			chooseNewBuildingNode.newRevenue, chooseNewBuildingNode.newIcon, chooseNewBuildingNode.newSprite)
		monthlyIncome += chooseNewBuildingNode.newRevenue
		$WealthContainer/MarginContainer/Money.decrement_money(chooseNewBuildingNode.newPrice)
		# Cal ficar el preu local? Ja tenim el de desnonar i el del nou local $Money.decrement_money(localSelected.preu)
		#Descontem el cost de desnonar
		$ChaChing.play()
		$WealthContainer/MarginContainer/Money.decrement_cost_desnonar()
		set_locals_enabled($Map, true)
		
		print(counter)
		print(totalLocalNum)
		if(counter >= totalLocalNum): 
			unlock_endgame()
		
		counter += 1
	else:
		#TODO Hem de fer handle per quan no tinguem prous diners (T'ho financia la familia, herencia, ajuda del banc, etc)
		print("No tens prous diners")
		$ErrorContainer.visible = true
		# Wait for 2 seconds
		await get_tree().create_timer(5.0).timeout
		# Hide again
		$ErrorContainer.visible = false
		
	set_locals_enabled($Map, true)

#En ordre, carrega el json corresponent al local que s'hagi seleccionat
func chooseAndLoadLocal(localNode):
	print(counter)
	if counter <= 18 and !localNode.isNegoci and !localNode.isParc:
		var file_path = "res://assets/LocalsTxts/" + str(counter) + ".json"
		var json_as_text = FileAccess.get_file_as_string(file_path)
		var json_as_dict = JSON.parse_string(json_as_text)
		localNode.load_init_data(json_as_dict["name"], json_as_dict["descENG"], json_as_dict["preu"])
	else:
		#TODO gestionar missatge d'avís
		print("S'han comprat tots els locals")

#On cancel any of the form screens
func onCancel():
	set_locals_enabled($Map, true)

#Funció recursiva per a descativar/activar els butons de l'escena principal
func set_locals_enabled(node, enabled):
	for child in node.get_children():
		if child is Button:
			child.disabled = !enabled
		set_locals_enabled(child, enabled) # Recursive call

#Desbloqueja la Sagrada Familia
func unlock_endgame():
	print("Endgame has been unlocked!")
	endGameUnlocked = true
	$Map/SagradaFamilia/TextureButton.disabled = false
	
	$ErrorContainer/MarginContainer/WarningMessage.text = "You can now buy the Sagrada Família!"
	$ErrorContainer.visible = true
	# Wait for 2 seconds
	await get_tree().create_timer(5.0).timeout
	# Hide again
	$ErrorContainer.visible = false
	
	endGameUnlocked = true
	$Map/SagradaFamilia/TextureButton.disabled = false

#Rep l'avís del botó de la sagrada familia
func on_sagrada_familia_selected():
	$CanvasGroup/EndGameScreen.visible = true

#Rep l'avís de la pantalla end_game_scene i deshabilita la sagrada familia
func on_confirm_sagrada_familia():
	print("confirm safa")
	$Map/SagradaFamilia/TextureButton.disabled = true
	$Map/SagradaFamilia/TextureButton.visible = false
	$Map/SagradaFamilia/ParkingFinal.visible = true
