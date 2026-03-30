extends Area2D
@onready var main = get_node("/root/Bedroom")
var expsc = preload("res://Scenes/exp.tscn")
var explosc = preload("res://Scenes/Explosion.tscn")

var damage = 5 + Global.damage

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.name)
	if "enemy" in area.name or "CharacterBody2D" in area.name:
		print("area entered")
		var exp = expsc.instantiate()
		exp.position = area.get_parent().position
		main.add_child(exp)
		area.get_parent().queue_free()
		
		
		print(Global.charhp)


#func _on_body_entered(body: Node2D) :
#	if "Enemy" in body.name or "CharacterBody2D" in body.name:
#		print("area entered")
#		var exp = expsc.instantiate()
#		exp.position = body.position
#		main.add_child(exp)
#		body.queue_free()
		
		
#		print(Global.charhp)

func _on_timer_timeout():
	var tempdam = damage
	if Global.weapinv[0] == "Mic":
		tempdam *= Global.weap1lv
	elif Global.weapinv[1] == "Mic":
		tempdam *= Global.weap2lv
	elif Global.weapinv[2] == "Mic":
		tempdam *= Global.weap3lv
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if "Player" not in body.name and "Static" not in body.name:
			if randi_range(1,3) == 3 and Global.fireworks == true:
				var explosion = explosc.instantiate()
				explosion.position = global_position
				main.add_child(explosion)
			body.damage(tempdam)
