extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if "Screw driver" in Global.iteminv:
		Global.screw = true
	if "Mini fireworks" in Global.iteminv:
		Global.fireworks = true
	if "glue" in Global.iteminv:
		Global.glue = true
	if "magnet" in Global.iteminv:
		Global.pickuprange = 200
	if "Hampster ball" in Global.iteminv:
		Global.shield = true
	if "target" in Global.iteminv:
		Global.target = true
	if "glasses" in Global.iteminv:
		Global.glasses = true
	if "grease" in Global.iteminv:
		Global.attackspeed = .5
	if Global.shieldcnt == 50:
		Global.shield = true
