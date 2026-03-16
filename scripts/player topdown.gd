extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
enum Dir { Right, Left, Down, Up }
var direction = Dir.Down
var screen_size # Size of the game window.

@onready var main = get_node("/root/Bedroom")
@onready var cam = get_node("/root/Bedroom/Player/Camera2D")
var lvupsc = preload("res://Scenes/level_up.tscn")

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = Global.charlist[Global.choschar]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	move_and_slide()

	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		#$AnimatedSprite2D.flip_v = false
		#$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "walk"
		#$AnimatedSprite2D.flip_v = velocity.y > 0
	else:
		$AnimatedSprite2D.animation = Global.charlist[Global.choschar]
	
	if (Global.charhp <= 0):
		print("ded")
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		
	
	if Global.pexp >= Global.to_next_level:
		var lvup = lvupsc.instantiate()
		lvup.position = get_child(0).position
		cam.add_child(lvup)
		Global.to_next_level = Global.to_next_level * 1.5



func start(pos):
	position = pos
	rotation = 0
	show()
	$CollisionShape2D.disabled = false


func _on_timer_timeout() -> void:
	for weapon in Global.weapinv:
		var projectsc = load("res://Shop/Weapons/%s.tscn" %weapon)
		var projectile = projectsc.instantiate()
		projectile.position = global_position
		main.add_child(projectile)
