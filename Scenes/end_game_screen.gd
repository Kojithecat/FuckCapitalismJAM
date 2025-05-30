extends Node2D

func on_confirm():
	self.visible = false
	get_tree().call_group("gameController", "on_confirm_sagrada_familia")
