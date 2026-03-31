extends CharacterBody2D

@onready var main = get_node("/root/Bedroom")
@onready var player = get_node("/root/Bedroom/Player")
var speed : int = 80
var direction : Vector2
var expsc = preload("res://Scenes/exp.tscn")
var health = 1000
var glued = false

func damage(value):
	health -= value
	if health <= 0:
		var exp = expsc.instantiate()
		exp.position = position
		main.add_sibling(exp)
		Global.enmdef += 1
		Global.boss -= 1
		queue_free()
	if "glue" in Global.iteminv:
			if randi_range(1,3) == 3:
				glued = true


func _physics_process(delta):
	direction = (player.position - position)
	direction = direction.normalized()
	velocity = direction * speed
	if glued:
		velocity *= Global.glue
	move_and_slide()




func _on_area_2d_area_entered(area: Area2D) -> void:
	if "player" in area.name:
		print("player entered")
		if Global.shield == false:
			Global.charhp -= 1
		else:
			Global.shield = false
		print(Global.charhp)
