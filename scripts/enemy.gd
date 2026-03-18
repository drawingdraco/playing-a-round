extends CharacterBody2D

@onready var main = get_node("/root/Bedroom")
@onready var player = get_node("/root/Bedroom/Player")
var speed : int = 80
var direction : Vector2
var expsc = preload("res://Scenes/exp.tscn")
var health = 10

func damage(value):
	health -= value
	if health <= 0:
		var exp = expsc.instantiate()
		exp.position = position
		main.add_child(exp)
		queue_free()


func _physics_process(delta):
	direction = (player.position - position)
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()




func _on_area_2d_area_entered(area: Area2D) -> void:
	if "player" in area.name:
		print("player entered")
		Global.charhp -= 1
		print(Global.charhp)
