extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.pexp = 0
	Engine.time_scale = 1.0
	freeze(0, -1)


func freeze(timescale : float, duration : float):
	Engine.time_scale = timescale
	await get_tree().create_timer(duration,true,false,true).timeout
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		


func _on_button_pressed() -> void:
	Engine.time_scale = 1.0
	queue_free()


func _on_button_2_pressed() -> void:
	Engine.time_scale = 1.0
	queue_free()


func _on_button_3_pressed() -> void:
	Engine.time_scale = 1.0
	queue_free()
