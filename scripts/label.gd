extends Label
var ehp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ehp = 10
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	set_text("hp: "+str(ehp))
	if ehp <= 0:
		get_tree().change_scene_to_file("res://menu.tscn")

func _on_card_pressed() -> void:
	ehp -= 1
