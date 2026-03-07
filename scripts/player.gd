extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var Gravity = 400
var screen_size # Size of the game window.
var camera_change = false
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	#gravity script
	#velocity.y += delta * Gravity
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = velocity.y > 0
	else:
		$AnimatedSprite2D.animation = "stand"
	if Input.is_action_just_pressed("change_camera"):
		camera_change = true
		
		#$AnimatedSprite2D.global_rotation 
	if camera_change==true:
		look_at(get_global_mouse_position())
	
	



func start(pos):
	position = pos
	rotation = 0
	show()
	$CollisionShape2D.disabled = false
