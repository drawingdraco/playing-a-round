extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.wave >= 2:
		for pannel in get_children():
			print(pannel.name)
			if pannel.name == "Lock":
				pannel.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	Global.enmtot = Global.enemy1 + Global.enemy2
	Global.enmdef = 0
	get_tree().change_scene_to_file("res://Scenes/bedroom.tscn")
