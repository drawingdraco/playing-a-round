extends CharacterBody2D

var speed : int = 500
var direction : Vector2
var shot = false

func _physics_process(delta):
	if (not shot):
		direction = (get_global_mouse_position() - position)
		shot = true
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if "Enemy" in body.name or "CharacterBody2D" in body.name:
		print("area entered")
		body.queue_free()
		for i in get_children():
			if i is not Area2D:
				i.queue_free()
		queue_free()
		print(Global.charhp)


func _on_timer_timeout() -> void:
	for i in get_children():
			if i is not Area2D:
				i.queue_free()
	queue_free()
