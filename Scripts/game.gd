extends Node2D

@onready var viewport = $SubViewport
@onready var sprite = $BusinessMan

func _process(delta):
	var texture = viewport.get_texture()
	sprite.texture = texture
