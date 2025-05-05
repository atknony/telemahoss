extends Node

var current_scene: Node = null

func _ready():
	change_scene("res://Scenes/MainMenu.tscn")

func change_scene(scene_path: String):
	# Önceki sahneyi sil
	if current_scene and is_instance_valid(current_scene):
		current_scene.queue_free()

	# Yeni sahneyi yükle
	var new_scene = load(scene_path).instantiate()

	# Sahneye ekle
	get_tree().root.add_child(new_scene)

	# Godot'a "bu artık yeni ana sahne" de
	get_tree().set_current_scene(new_scene)

	# Takip etmek için kaydet
	current_scene = new_scene
