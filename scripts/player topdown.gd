extends CharacterBody2D

@export var speed = Global.charspeed # How fast the player will move (pixels/sec).
enum Dir { Right, Left, Down, Up }
var direction = Dir.Down
var screen_size # Size of the game window.

var timerstart = false

@onready var main = get_node("/root/Bedroom/StaticBody2D")
@onready var cam = get_node("/root/Bedroom/Player/Camera2D")
@onready var player = get_node("/root/Bedroom/Player/Item controler")
@onready var _animated_sprite = $AnimatedSprite2D
var lvupsc = preload("res://Scenes/level_up.tscn")


var micadd = false
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = Global.charlist[Global.choschar]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.invincible and !timerstart:
		$Invincibility.start()
		timerstart = true
	if "Mic" in Global.weapinv and micadd == false:
		var micsc = load("res://Shop/Weapons/Mic.tscn")
		var mic = micsc.instantiate()
		player.add_sibling(mic)
		micadd = true
	
	
	velocity = Vector2() # The player's movement vector.
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
		direction = Dir.Right
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
		direction = Dir.Left
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
		direction = Dir.Down
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
		direction = Dir.Up

	velocity = velocity.normalized() * speed
	if velocity.x != 0:
		_animated_sprite.play(Global.charlistwalk[Global.choschar])
		#$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		_animated_sprite.play(Global.charlistwalk[Global.choschar])
		#$AnimatedSprite2D.flip_v = velocity.y > 0
	else:
		$AnimatedSprite2D.animation = Global.charlist[Global.choschar]
	move_and_slide()

	
	
	
	if (Global.charhp <= 0):
		print("ded")
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		
	
	if Global.pexp >= Global.to_next_level:
		var lvup = lvupsc.instantiate()
		lvup.position = get_child(0).position
		cam.add_sibling(lvup)
		



func start(pos):
	position = pos
	rotation = 0
	show()
	$CollisionShape2D.disabled = false


func _on_weapon_1_timeout() -> void:
	var weapon = Global.weapinv[0]
	for child in get_children():
		if child.name == "Weapon 1":
			child.wait_time = Global.weap1sp * Global.attackspeed
	if weapon != "Mic":
		var projectsc = load("res://Shop/Weapons/%s.tscn" %weapon)
		var projectile = projectsc.instantiate()
		projectile.position = global_position
		projectile.rotation = get_angle_to(get_global_mouse_position())
		main.add_sibling(projectile)


func _on_weapon_2_timeout() -> void:
	if len(Global.weapinv) >= 2:
		var weapon = Global.weapinv[1]
		for child in get_children():
			if child.name == "Weapon 2":
				child.wait_time = Global.weap2sp * Global.attackspeed
		if weapon != "Mic":
			var projectsc = load("res://Shop/Weapons/%s.tscn" %weapon)
			var projectile = projectsc.instantiate()
			projectile.position = global_position
			projectile.rotation = get_angle_to(get_global_mouse_position())
			main.add_sibling(projectile)


func _on_weapon_3_timeout() -> void:
	if len(Global.weapinv) >= 3:
		var weapon = Global.weapinv[2]
		for child in get_children():
			if child.name == "Weapon 3":
				child.wait_time = Global.weap3sp * Global.attackspeed 
		if weapon != "Mic":
			var projectsc = load("res://Shop/Weapons/%s.tscn" %weapon)
			var projectile = projectsc.instantiate()
			projectile.position = global_position
			projectile.rotation = get_angle_to(get_global_mouse_position())
			main.add_sibling(projectile)


func _on_invincibility_timeout() -> void:
	Global.invincible = false
	timerstart=false
