extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible=false
	disabled=true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("damage"):
		visible=true
		disabled=false
		await get_tree().create_timer(1.0).timeout
		visible=false
		disabled=true
