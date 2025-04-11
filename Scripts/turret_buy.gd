extends TextureRect

@export var turret_scene: PackedScene

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_parent().select_turret(turret_scene)
