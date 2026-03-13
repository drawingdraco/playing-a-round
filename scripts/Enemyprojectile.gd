extends CharacterBody2D

var speed : int = 200
var direction : Vector2
var shot = false
@onready var main = get_node("/root/Bedroom")
@onready var player = get_node("/root/Bedroom/Player")
var expsc = preload("res://Scenes/exp.tscn")
func _physics_process(delta):
	if (not shot):
		direction = (player.position - position)
		shot = true
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D):
	pass


func _on_timer_timeout() -> void:
	for i in get_children():
			if i is not Area2D:
				i.queue_free()
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.name)
	if "Player" in area.name:
		print("area entered")
		Global.charhp = Global.charhp - 1
		print(Global.charhp)
		queue_free()
