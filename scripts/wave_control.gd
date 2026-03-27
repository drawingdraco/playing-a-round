extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.wave >= 2:
		for pannel in get_children():
			print(pannel.name)
			if pannel.name == "Lock":
				pannel.visible = true
	if Global.wave >= 3 or Global.wave <= 1:
		for pannel in get_children():
			print(pannel.name)
			if pannel.name == "Lock2":
				pannel.visible = true
	if  Global.wave <= 2:
		for pannel in get_children():
			print(pannel.name)
			if pannel.name == "Lock3":
				pannel.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	Global.enmtot = Global.enemy1 + Global.enemy2 + Global.enemy3 + Global.enemy4 + Global.boss
	Global.enmdef = 0
	get_tree().change_scene_to_file("res://Scenes/bedroom.tscn")
