extends Node

var choschar = 0
var charlist = ["walk","Hero stand","witch stand","Pop stand"]
var charlistwalk = ["walk","Hero walk","witch walk","Pop walk"]
var charhp = 3
var enemy1 = 0
var enemy2 = 0
var enemy3 = 0
var enemy4 = 0
var boss = 0

var pexp = 0
var to_next_level = 10
var prevlev = 0
var enmtot =0
var enmdef = 0

var charspeed = 0

var weapinv = []
var iteminv = []

var weap1sp = 1.0
var weap2sp = 1.0
var weap3sp = 1.0
var weap1lv = 1
var weap2lv = 1
var weap3lv = 1

var wave = 1

#item chaging stats
var screw = false
var fireworks = false
var glue = 1.0
var pickuprange = 50
var shield = false
var glasses = 1
var target = false
var attackspeed = 1.0


var shieldcnt = 0

var damage = 0

var dificulty = 0

var invincible = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
