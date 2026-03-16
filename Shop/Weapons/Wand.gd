extends CharacterBody2D

var speed : int = 500
var direction : Vector2
var shot = false
@onready var main = get_node("/root/Bedroom")
var expsc = preload("res://Scenes/exp.tscn")

var pierce = 3
func _physics_process(delta):
	if (not shot):
		direction = (get_global_mouse_position() - position)
		shot = true
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D):
	print(body.name)
	if "Enemy" in body.name or "CharacterBody2D" in body.name:
		print("area entered")
		var exp = expsc.instantiate()
		exp.position = body.position
		main.add_child(exp)
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


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.name)
	if "enemy" in area.name or "CharacterBody2D" in area.name:
		pierce -= 1
		print("area entered")
		var exp = expsc.instantiate()
		exp.position = area.get_parent().position
		main.add_child(exp)
		area.get_parent().queue_free()
		if pierce == 0:
			for i in get_children():
				if i is not Area2D:
					i.queue_free()
			queue_free()
		
		
		
		print(Global.charhp)
