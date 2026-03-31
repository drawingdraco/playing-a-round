extends Control
var weaponlist = ["Chip","Dice","Fist","Mic","Toy gun","Wand"]
var itemlist = ["Screwdriver", "Mini fireworks", "Hampster ball", "glue", "magnet", "glasses", "grease"]
var statlist = ["damage", "attack speed","pickup range","speed"]
var slot1 = ""
var slot2 = ""
var slot3 = ""
var stock = []

func weaplv(weapon):
	if weapon == Global.weapinv[0]:
		Global.weap1lv += 1
	elif weapon == Global.weapinv[1]:
		Global.weap2lv += 1
	elif weapon == Global.weapinv[2]:
		Global.weap3lv += 1
func lvadd(weapon, text):
	if weapon == Global.weapinv[0]:
		text += " Lv.%d" %Global.weap1lv
	elif weapon == Global.weapinv[1]:
		text += " Lv.%d" %Global.weap2lv  
	elif weapon == Global.weapinv[2]:
		text += " Lv.%d" %Global.weap3lv 
	return text
func shopstock():
	var slot = ""
	var rand = randi_range(0,len(stock)-1)
	return stock[rand]
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stock.append_array(Global.weapinv)
	stock.append_array(Global.weapinv)
	if len(Global.weapinv) < 3:
		stock.append_array(weaponlist)
	else:
		stock.append_array(Global.weapinv)
	if len(Global.iteminv) < 3:
		stock.append_array(itemlist)
	for item in Global.iteminv:
		stock.erase(item)
	stock.append_array(statlist)
	slot1 = shopstock()
	slot2 = shopstock()
	if slot2 == slot1:
		while slot2 == slot1:
			slot2 = shopstock()
	slot3 = shopstock()
	if slot3 == slot1 or slot3 == slot2:
		while slot3 == slot1 or slot3 == slot2:
			slot3 = shopstock()
	Global.prevlev = Global.to_next_level 
	Global.to_next_level = int(Global.to_next_level * 1.5)
	$Panel/Button/Label.text = slot1
	if slot1 in Global.weapinv:
		$Panel/Button/Label.text = lvadd(slot1, $Panel/Button/Label.text)
	$Panel/Button2/Label.text = slot2
	if slot2 in Global.weapinv:
		$Panel/Button2/Label.text = lvadd(slot2, $Panel/Button2/Label.text)
	$Panel/Button3/Label.text = slot3
	if slot3 in Global.weapinv:
		$Panel/Button3/Label.text = lvadd(slot3, $Panel/Button3/Label.text)
	$Panel/Button/Sprite2D.texture = load("res://sprites/%s.png" %slot1)
	$Panel/Button2/Sprite2D.texture = load("res://sprites/%s.png" %slot2)
	$Panel/Button3/Sprite2D.texture = load("res://sprites/%s.png" %slot3)
	
	


func freeze(timescale : float, duration : float):
	Engine.time_scale = timescale
	await get_tree().create_timer(duration,true,false,true).timeout
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	Engine.time_scale = 1.0
	freeze(0, -1)
		


func _on_button_pressed() -> void:
	if slot1 in itemlist:
		Global.iteminv.append(slot1)
	if slot1 in weaponlist and slot1 not in Global.weapinv:
		Global.weapinv.append(slot1)
	if slot1 == "damage":
		Global.damage += 5
	if slot1 == "attack speed":
		Global.attackspeed -= .05
	if slot1 == "pickup range":
		Global.pickuprange += 10
	if slot1 == "speed":
		Global.charspeed += 10
	if slot1 in Global.weapinv:
		weaplv(slot1) 
	
	Engine.time_scale = 1.0
	queue_free()


func _on_button_2_pressed() -> void:
	if slot2 in itemlist:
		Global.iteminv.append(slot2)
	if slot2 in weaponlist and slot2 not in Global.weapinv:
		Global.weapinv.append(slot2)
	if slot2 == "damage":
		Global.damage += 5
	if slot2 == "attack speed":
		Global.attackspeed -= .05
	if slot2 == "pickup range":
		Global.pickuprange += 10
	if slot2 == "speed":
		Global.charspeed += 10
	if slot2 in Global.weapinv:
		weaplv(slot2) 
	Engine.time_scale = 1.0
	queue_free()


func _on_button_3_pressed() -> void:
	if slot3 in itemlist:
		Global.iteminv.append(slot3)
	if slot3 in weaponlist and slot3 not in Global.weapinv:
		Global.weapinv.append(slot3)
	if slot3 == "damage":
		Global.damage += 5
	if slot3 == "attack speed":
		Global.attackspeed -= .05
	if slot3 == "pickup range":
		Global.pickuprange += 10
	if slot3 == "speed":
		Global.charspeed += 10
	if slot3 in Global.weapinv:
		weaplv(slot3) 
	
	Engine.time_scale = 1.0
	queue_free()
