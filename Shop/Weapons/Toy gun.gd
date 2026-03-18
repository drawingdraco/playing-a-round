extends CharacterBody2D

var speed : int = 1000
var direction : Vector2
var shot = false
@onready var main = get_node("/root/Bedroom")
var expsc = preload("res://Scenes/exp.tscn")

var pierce = 1
func _physics_process(delta):
	if (not shot):
		direction = (get_global_mouse_position() - position)
		shot = true
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()




func _on_timer_timeout() -> void:
	for i in get_children():
			if i is not Area2D:
				i.queue_free()
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if "enemy" in area.name or "CharacterBody2D" in area.name:
		pierce -= 1
		area.get_parent().damage(20)
		if pierce == 0:
			for i in get_children():
				if i is not Area2D:
					i.queue_free()
			queue_free()
		
		
		
		
