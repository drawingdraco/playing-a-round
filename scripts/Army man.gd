extends CharacterBody2D

var projectsc = preload("res://Scenes/Enemy projectile.tscn")
@onready var main = get_node("/root/Bedroom")
@onready var player = get_node("/root/Bedroom/Player")
var expsc = preload("res://Scenes/exp.tscn")
var speed : int = 100
var direction : Vector2
var health = 20

func _physics_process(delta):
	direction = (player.position - position)
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()

func damage(value):
	health -= value
	if health <= 0:
		var exp = expsc.instantiate()
		exp.position = position
		main.add_child(exp)
		Global.enmdef += 1
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == ("Player"):
		print("player entered")
		Global.charhp -= 1
		print(Global.charhp)
		
func _on_timer_timeout() -> void:
	var projectile = projectsc.instantiate()
	projectile.position = global_position
	main.add_child(projectile)
