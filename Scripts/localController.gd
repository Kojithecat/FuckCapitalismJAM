extends Node2D

class_name Local

@export var price: int = 10;
@export var purchased: bool = false;
@export var nameOg: String;
@export var descriptionOg: String;
@export var nameNew: String;
@export var descriptionNew: String;
@export var revenue: int = 20;

signal local_selected

func _on_local_pressed() -> void:
	#emit_signal("local_selected")
	get_tree().call_group("locals", "handle_child_signal", self)
