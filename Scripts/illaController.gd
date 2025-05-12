extends Node2D

class_name Illa

@export var total_locals_list: Array[PackedScene] = [];
@export var original_locals_list: Array[PackedScene] = [];
@export var purchased_locals_list: Array[PackedScene] = [];


func _ready():
	for child in get_children():
		if child is Local:
			total_locals_list.append(child)
