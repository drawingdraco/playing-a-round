extends CharacterBody2D

var projectsc = preload("res://Scenes/Enemy projectile.tscn")
@onready var main = get_node("/root/Bedroom/StaticBody2D")
@onready var player = get_node("/root/Bedroom/Player")
var expsc = preload("res://Scenes/exp.tscn")
var screwsc = preload("res://Scenes/Screw.tscn")
var speed : int = 100 + (Global.dificulty * 10)
var direction : Vector2
var health = 20 * (Global.dificulty + 1)
var glued = false

func _physics_process(delta):
	direction = (player.position - position)
	direction = direction.normalized()
	velocity = direction * speed  
	$AnimatedSprite2D.flip_h = velocity.x < 0
	$AnimatedSprite2D.play("new_animation")
	if glued:
			velocity *= Global.glue
	move_and_slide()

func damage(value):
	health -= value
	if health <= 0:
		var exp = expsc.instantiate()
		exp.position = position
		main.add_sibling(exp)
		Global.enmdef += 1
		if "Hampster ball" in Global.iteminv:
			Global.shieldcnt += 1
		if Global.screw and randi_range(1,30) == 30:
			var screw = screwsc.instantiate()
			screw.position = position
			main.add_sibling(screw)
		if "glue" in Global.iteminv:
			if randi_range(1,3) == 3:
				glued = true
		queue_free()
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == ("Player"):
		print("player entered")
		if Global.shield == false:
			Global.charhp -= 1
		else:
			Global.shield = false
		print(Global.charhp)
		
func _on_timer_timeout() -> void:
	var projectile = projectsc.instantiate()
	projectile.position = global_position
	main.add_sibling(projectile)
