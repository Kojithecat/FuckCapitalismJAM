extends Node2D

@export var newName: String;
@export var newDesc: String;
@export var newRevenue: int;
@export var newPrice: int;

func _ready() -> void:
	add_to_group("chooseNewBuildingGroup")

func handle_building_option_selected(newBuildingOptionNode):
	newName = newBuildingOptionNode.nomNewBuilding
	newDesc = newBuildingOptionNode.descNewBuilding
	newRevenue = newBuildingOptionNode.revenue
	newPrice = newBuildingOptionNode.price
	
	$ButtonConfirm.disabled = false

func onConfirm():
	get_tree().call_group("gameController", "handle_new_building_selected", self)
	self.visible = false

func onCancel():
	self.visible = false
