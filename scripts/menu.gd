extends Control

func _ready() -> void:
	Global.charhp = 3


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/character_select.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options.tscn")


func _on_button_3_pressed() -> void:
	get_tree().quit()
