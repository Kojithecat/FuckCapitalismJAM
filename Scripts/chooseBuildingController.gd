extends Node2D

@export var newName: String;
@export var newDesc: String;
@export var newRevenue: int;

func _ready() -> void:
	add_to_group("chooseNewBuildingGroup")

func handle_building_option_selected(data):
	newName = data.nomNewBuilding
	newDesc = data.descNewBuilding
	newRevenue = data.revenue
	$ButtonConfirm.disabled = false

func onConfirm():
	print("cha ching")
	get_tree().call_group("gameController", "handle_new_building_selected", self)
	self.visible = false

func onCancel():
	self.visible = false
