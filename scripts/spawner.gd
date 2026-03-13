extends Node2D

@onready var main = get_node("/root/Bedroom/Spawner")

var enemysc = preload("res://Scenes/enemy.tscn")
var Armysc = preload("res://Scenes/Army men.tscn")
var spawnpoints = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		if i is Marker2D:
			spawnpoints.append(i)
			


func _on_timer_timeout() -> void:
	if Global.enemy1 > 0:
		var spawn = spawnpoints[randi() % spawnpoints.size()]
		var enemy = enemysc.instantiate()
		enemy.position = spawn.global_position
		main.add_child(enemy)
		Global.enemy1 -= 1
	
	if Global.enemy2 > 0:
		var spawn = spawnpoints[randi() % spawnpoints.size()]
		var armymen = Armysc.instantiate()
		armymen.position = spawn.global_position
		main.add_child(armymen)
		Global.enemy2 -= 1
