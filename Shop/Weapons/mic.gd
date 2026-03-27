extends Area2D
@onready var main = get_node("/root/Bedroom")
var expsc = preload("res://Scenes/exp.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if "Player" not in body.name and "Static" not in body.name:
			body.damage(5)
