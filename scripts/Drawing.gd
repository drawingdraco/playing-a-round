extends CharacterBody2D

@onready var main = get_node("/root/Bedroom")
@onready var player = get_node("/root/Bedroom/Player")
var speed : int = 200 + (Global.dificulty * 10)
var direction : Vector2
var expsc = preload("res://Scenes/exp.tscn")
var screwsc = preload("res://Scenes/Screw.tscn")
var health = 5 * (Global.dificulty + 1)
var glued = false

func damage(value):
	health -= value
	if health <= 0:
		var exp = expsc.instantiate()
		exp.position = position
		main.add_child(exp)
		Global.enmdef += 1
		if "Hampster ball" in Global.iteminv:
			Global.shieldcnt += 1
		if Global.screw and randi_range(1,30) == 30:
			var screw = screwsc.instantiate()
			screw.position = position
			main.add_child(screw)
		if "glue" in Global.iteminv:
			if randi_range(1,3) == 3:
				glued = true
		queue_free()


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
