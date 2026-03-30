extends CharacterBody2D

var speed : int = 500
var direction : Vector2
var shot = false
@onready var main = get_node("/root/Bedroom")
var expsc = preload("res://Scenes/exp.tscn")
var explosc = preload("res://Scenes/Explosion.tscn")
var damage = 5 + Global.damage

var pierce = 2

func _ready() -> void:
	if Global.weapinv[0] == "Chip":
		damage *= Global.weap1lv
	elif Global.weapinv[1] == "Chip":
		damage *= Global.weap2lv
	elif Global.weapinv[2] == "Chip":
		damage *= Global.weap3lv

func _physics_process(delta):
	if (not shot):
		direction = (get_global_mouse_position() - position)
		direction.x += randi_range(-100,100)
		direction.y += randi_range(-100,100)
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
	print(area)
	if "enemy" in area.name or "Areay2D" in area.name:
		if randi_range(1,3) == 3 and Global.fireworks == true:
			var explosion = explosc.instantiate()
			explosion.position = global_position
			main.add_child(explosion)
		area.get_parent().damage(damage)
		pierce -= 1
		if pierce == 0:
			for i in get_children():
				if i is not Area2D:
					i.queue_free()
			queue_free()
		
		
