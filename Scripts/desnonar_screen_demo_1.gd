extends Node2D

@onready var nomDisplay = $Nom
@onready var descDisplay = $Desc
@onready var preuDisplay = $Preu
#El cost de desnonar es constant (10k) per demostrar que qualsevol amb diners te el poder de desnonar 
var costDesnonar = 10000

func load_data(nom: String, desc: String, preu: int):
	nomDisplay.text = nom
	descDisplay.text = desc
	preuDisplay.text = str(preu)

func onAcceptTermsAndConditions():
	$AudioStreamPlayer2D.play()
	get_tree().call_group("gameController", "handle_desnonar_confirmed")
	self.visible = false

func onCancel():
	self.visible = false
	get_tree().call_group("gameController", "onCancel")
