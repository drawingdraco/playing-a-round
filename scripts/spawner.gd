extends Node2D

@onready var main = get_node("/root/Bedroom/StaticBody2D")

@onready var ymax = get_node("/root/Bedroom/StaticBody2D/CollisionShape2D2/Yhighmark")
@onready var xmax = get_node("/root/Bedroom/StaticBody2D/CollisionShape2D/Ylowmark")
@onready var ymin = get_node("/root/Bedroom/StaticBody2D/CollisionShape2D2/Yhighmark")
@onready var xmin = get_node("/root/Bedroom/StaticBody2D/CollisionShape2D4/XRmark")

var enemysc = preload("res://Scenes/Brickmen.tscn")
var Armysc = preload("res://Scenes/Army men.tscn")
var drawsc = preload("res://Scenes/Drawings.tscn")
var animsc = preload("res://Scenes/Stuffed animal.tscn")
var bosssc = preload("res://Scenes/Robot.tscn")

var theendisnear = false

var spawnpoints = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		if i is Marker2D:
			spawnpoints.append(i)
			


func _on_timer_timeout() -> void:
	var spawn = spawnpoints[randi() % spawnpoints.size()]
	for num in range(1,9):
		if spawn.global_position.x > xmax.global_position.x or  spawn.global_position.x < xmin.global_position.x or spawn.global_position.y > ymax.global_position.y or  spawn.global_position.y < ymin.global_position.y:
			spawn = spawnpoints[randi() % spawnpoints.size()]
	var enmspaw = randi_range(1,4)
	for num in range(1,8):
		print(enmspaw)
		if enmspaw == 1:
			if Global.enemy1 > 0:
				var enemy = enemysc.instantiate()
				enemy.position = spawn.global_position
				main.add_sibling(enemy)
				Global.enemy1 -= 1
				break
			else:
				enmspaw+=1
		if enmspaw == 2:
			if Global.enemy2 > 0:
				var armymen = Armysc.instantiate()
				armymen.position = spawn.global_position
				main.add_sibling(armymen)
				Global.enemy2 -= 1
				break
			else:
				enmspaw+=1
		if enmspaw == 3:
			if Global.enemy3 > 0:
				var drawings = drawsc.instantiate()
				drawings.position = spawn.global_position
				main.add_sibling(drawings)
				Global.enemy3 -= 1
				break
			else:
				enmspaw+=1
		if enmspaw == 4:
			if Global.enemy4 > 0:
				var stuffanim = animsc.instantiate()
				stuffanim.position = spawn.global_position
				main.add_sibling(stuffanim)
				Global.enemy4 -= 1
				break
			else:
				enmspaw = 1
	if Global.boss > 0:
		var boss = bosssc.instantiate()
		boss.position = spawn.global_position
		main.add_sibling(boss)
		
		
	if Global.enemy1 + Global.enemy2 + Global.enemy3 + Global.enemy4 + Global.boss == 0 and !theendisnear and Global.wave != 3:
		$Timer2.start()
		theendisnear = true
	elif Global.boss == 0  and Global.wave == 3:
		get_tree().change_scene_to_file("res://Scenes/credits.tscn")
		


func _on_timer_2_timeout() -> void:
	Global.wave += 1
	theendisnear = false
	get_tree().change_scene_to_file("res://Scenes/wave_control.tscn")
