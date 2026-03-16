extends Node2D

@onready var main = get_node("/root/Bedroom")

@onready var ymax = get_node("/root/Bedroom/StaticBody2D/CollisionShape2D2/Yhighmark")
@onready var xmax = get_node("/root/Bedroom/StaticBody2D/CollisionShape2D/Ylowmark")
@onready var ymin = get_node("/root/Bedroom/StaticBody2D/CollisionShape2D2/Yhighmark")
@onready var xmin = get_node("/root/Bedroom/StaticBody2D/CollisionShape2D4/XRmark")

var enemysc = preload("res://Scenes/enemy.tscn")
var Armysc = preload("res://Scenes/Army men.tscn")
var spawnpoints = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		if i is Marker2D:
			spawnpoints.append(i)
			


func _on_timer_timeout() -> void:
	var spawn = spawnpoints[randi() % spawnpoints.size()]
	#if spawn.global_position.x > xmax.global_position.x or  spawn.global_position.x < xmin.global_position.x or spawn.global_position.y > ymax.global_position.y or  spawn.global_position.y < ymin.global_position.y:
		#while spawn.global_position.x > xmax.global_position.x or  spawn.global_position.x < xmin.global_position.x or spawn.global_position.y > ymax.global_position.y or  spawn.global_position.y < ymin.global_position.y:
			#spawn = spawnpoints[randi() % spawnpoints.size()]
		
	if Global.enemy1 > 0:
		var enemy = enemysc.instantiate()
		enemy.position = spawn.global_position
		main.add_child(enemy)
		Global.enemy1 -= 1
	
	if Global.enemy2 > 0:
		var armymen = Armysc.instantiate()
		armymen.position = spawn.global_position
		main.add_child(armymen)
		Global.enemy2 -= 1
