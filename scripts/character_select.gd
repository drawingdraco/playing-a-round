extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Global.choschar = 1
	Global.weapinv.append("Fist")
	Global.charhp =5
	get_tree().change_scene_to_file("res://Scenes/wave_control.tscn")

func _on_button_2_pressed() -> void:
	Global.choschar = 2
	Global.weapinv.append("Wand")
	Global.charhp = 3
	get_tree().change_scene_to_file("res://Scenes/wave_control.tscn")

func _on_button_3_pressed() -> void:
	Global.choschar = 3
	Global.weapinv.append("Mic")
	Global.charhp = 4
	get_tree().change_scene_to_file("res://Scenes/wave_control.tscn")
