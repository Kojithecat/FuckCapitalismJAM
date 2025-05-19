extends Node2D

@onready var viewport = $SubViewport
@onready var sprite = $BusinessMan
@onready var chooseBuilding = $CanvasGroup/ChooseNewBuildingScreen
@onready var desnonar = $CanvasGroup/desnonar1
var buildingSelected = 0
var localSelected = null
var option = 0

func _ready() -> void:
	pass

func _process(delta):
	if(chooseBuilding.visible):
		buildingSelected = handle_choosing_building()
	if(buildingSelected != 0):
		print(buildingSelected) #Edificació a construir
		print(localSelected) #Local seleccionat (d'aqui es pot treure la illa i el local que toquen)
		desnonar.visible = true #Aqui es posará el desnonar que toqui en el moment qeu toqui
	var texture = viewport.get_texture()
	sprite.texture = texture
	add_to_group("locals")

func handle_child_signal(data):
	chooseBuilding.visible = true
	
	var local = data.name
	var illa = data.get_parent().name
	localSelected =  int(str(illa)[-1])*4 + int(str(local)[-1]) #Calcul del local es: #Illa *4 + #local
	# Handle the signal

func handle_choosing_building():
	if($CanvasGroup/ChooseNewBuildingScreen/ButtonCancel.button_pressed):
		chooseBuilding.visible = false
	for i in range(1,10):
		var button = get_node("CanvasGroup/ChooseNewBuildingScreen/Option" + str(i))
		if(button.button_pressed):
			option = i
	print(option)
	if($CanvasGroup/ChooseNewBuildingScreen/ButtonConfirm.button_pressed and option != 0):
		chooseBuilding.visible = false
		return option
	else:
		return 0	# No selection

		

	
