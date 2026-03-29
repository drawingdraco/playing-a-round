extends CharacterBody2D

var speed : int = 1000
var direction : Vector2
var shot = false
@onready var main = get_node("/root/Bedroom")
var expsc = preload("res://Scenes/exp.tscn")
var explosc = preload("res://Scenes/Explosion.tscn")

var Attacksp = 1.5
func _ready() -> void:
	if Global.weapinv[0] == "Toy gun":
		Global.weap1sp = Attacksp
	elif Global.weapinv[1] == "Toy gun":
		Global.weap2sp = Attacksp
	elif Global.weapinv[2] == "Toy gun":
		Global.weap3sp = Attacksp


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
		if randi_range(1,3) == 3 and Global.fireworks == true:
			var explosion = explosc.instantiate()
			explosion.position = global_position
			main.add_child(explosion)
		if pierce == 0:
			for i in get_children():
				if i is not Area2D:
					i.queue_free()
			queue_free()
		
		
		
		
