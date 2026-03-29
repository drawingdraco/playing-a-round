extends CharacterBody2D

var speed : int = 500
var direction : Vector2
var shot = false
@onready var main = get_node("/root/Bedroom")
var expsc = preload("res://Scenes/exp.tscn")


func _on_area_2d_body_entered(body: Node2D):
	print(body.name)
	if "Enemy" in body.name or "CharacterBody2D" in body.name:
		body.damage(5)
		


func _on_timer_timeout() -> void:
	for i in get_children():
			if i is not Area2D:
				i.queue_free()
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.name)
	if "enemy" in area.name or "CharacterBody2D" in area.name:
		area.get_parent().damage(5)
		
