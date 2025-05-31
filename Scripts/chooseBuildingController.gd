extends Node2D

@export var newName: String
@export var newDesc: String
@export var newRevenue: int
@export var newPrice: int
@export var newIcon: CompressedTexture2D
@export var newSprite: CompressedTexture2D
@export var spriteParking: CompressedTexture2D
@export var spriteCasino: CompressedTexture2D

func _ready() -> void:
	add_to_group("chooseNewBuildingGroup")

func handle_building_option_selected(newBuildingOptionNode):
	newName = newBuildingOptionNode.nomNewBuilding
	newDesc = newBuildingOptionNode.descNewBuilding
	newRevenue = newBuildingOptionNode.revenue
	newPrice = newBuildingOptionNode.price
	newIcon = newBuildingOptionNode.icon
	
	if(newName=="Parking Lot"):
		newSprite = spriteParking
	elif(newName=="Casino"):
		newSprite = spriteCasino
	
	$ButtonConfirm.disabled = false

func onConfirm():
	get_tree().call_group("gameController", "handle_new_building_selected", self)
	self.visible = false

func onCancel():
	self.visible = false
	get_tree().call_group("gameController", "onCancel")
