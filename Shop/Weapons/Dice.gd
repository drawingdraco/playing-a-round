extends CharacterBody2D

var speed : int = 500
var direction : Vector2
var shot = false
@onready var main = get_node("/root/Bedroom")
var expsc = preload("res://Scenes/exp.tscn")
var explosc = preload("res://Scenes/Explosion.tscn")
var roll = randi_range(1,6) 
var damage = roll + Global.damage


var Attacksp = 1.5
func _ready() -> void:
	$AnimatedSprite2D.animation = "dice%d" %roll
	if Global.weapinv[0] == "Dice":
		Global.weap1sp = Attacksp
	elif Global.weapinv[1] == "Dice":
		Global.weap2sp = Attacksp
	elif Global.weapinv[2] == "Dice":
		Global.weap3sp = Attacksp
	if Global.weapinv[0] == "Dice":
		damage *= Global.weap1lv
	elif Global.weapinv[1] == "Dice":
		damage *= Global.weap2lv
	elif Global.weapinv[2] == "Dice":
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
	print(area.name)
	if "enemy" in area.name or "CharacterBody2D" in area.name:
		area.get_parent().damage(damage)
		if randi_range(1,3) == 3 and Global.fireworks == true:
			var explosion = explosc.instantiate()
			explosion.position = global_position
			main.add_child(explosion)
