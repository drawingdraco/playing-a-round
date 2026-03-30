extends CharacterBody2D

var speed : int = 500
var direction : Vector2
var shot = false
@onready var main = get_node("/root/Bedroom")
var explosc = preload("res://Scenes/Explosion.tscn")
var Attacksp = 1.0
var damage = 10 + Global.damage 


func _ready() -> void:
	if Global.weapinv[0] == "Fist":
		Global.weap1sp = Attacksp
	elif Global.weapinv[1] == "Fist":
		Global.weap2sp = Attacksp
	elif Global.weapinv[2] == "Fist":
		Global.weap3sp = Attacksp
	if Global.weapinv[0] == "Fist":
		damage *= Global.weap1lv
	elif Global.weapinv[1] == "Fist":
		damage *= Global.weap2lv
	elif Global.weapinv[2] == "Fist":
		damage *= Global.weap3lv



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
		area.get_parent().damage(damage)
		if randi_range(1,3) == 3 and Global.fireworks == true:
			var explosion = explosc.instantiate()
			explosion.position = global_position
			main.add_child(explosion)
