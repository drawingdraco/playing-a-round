extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var amount  = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func updatesprite():
	var start = len(str(amount))-1
	var end = len(str(amount))
	for i in get_children():
		if i is Sprite2D:
			var texture = load('res://sprites/%sNum.png' % (str(amount).substr(start,end)).substr(0,1))
			i.texture = texture
			if amount <= 9:
				texture = load('res://sprites/0Num.png')
				$Sprite2D2.texture = texture
			if amount <= 99:
				texture = load('res://sprites/0Num.png')
				$Sprite2D3.texture = texture
			if start != 0:
				start-=1
				end-=1
			else:
				break
func _on_button_pressed() -> void:
	amount+=1
	if "Armymen" in  name:
		Global.enemy2 = amount
	if "BrickMen" in  name:
		Global.enemy1 = amount
	if "drawings" in  name:
		Global.enemy3 = amount
	if "Stiffed animals" in  name:
		Global.enemy4 = amount
	print(str(amount))
	var start = len(str(amount))-1
	var end = len(str(amount))
	updatesprite()
	
func _on_button_2_pressed() -> void:
	
	if amount > 0:
		amount-=1
		if "Armymen" in  name:
			Global.enemy2 = amount
		if "BrickMen" in  name:
			Global.enemy1 = amount
		if "drawings" in  name:
			Global.enemy3 = amount
		if "Stuffed animals" in  name:
			Global.enemy4 = amount
		updatesprite()
	
	else:
		pass


func _on_button_3_pressed() -> void:
	amount+=10
	
	if "Armymen" in  name:
		Global.enemy2 = amount
	if "BrickMen" in  name:
		Global.enemy1 = amount
	if "drawings" in  name:
		Global.enemy3 = amount
	if "Stuffed animals" in  name:
		Global.enemy4 = amount
	print(str(amount))
	var start = len(str(amount))-1
	var end = len(str(amount))
	updatesprite()


func _on_button_4_pressed() -> void:
	if amount > 9:
		amount-=10
		if "Armymen" in  name:
			Global.enemy2 = amount
		if "BrickMen" in  name:
			Global.enemy1 = amount
		if "drawings" in  name:
			Global.enemy3 = amount
		if "Stuffed animals" in  name:
			Global.enemy4 = amount
		updatesprite()
	
	else:
		pass


func _on_button_5_pressed() -> void:
	amount+=100
	
	if "Armymen" in  name:
		Global.enemy2 = amount
	if "BrickMen" in  name:
		Global.enemy1 = amount
	if "drawings" in  name:
		Global.enemy3 = amount
	if "Stuffed animals" in  name:
		Global.enemy4 = amount
	var start = len(str(amount))-1
	var end = len(str(amount))
	updatesprite()


func _on_button_6_pressed() -> void:
	if amount > 99:
		amount-=100
		if "Armymen" in  name:
			Global.enemy2 = amount
		if "BrickMen" in  name:
			Global.enemy1 = amount
		if "drawings" in  name:
			Global.enemy3 = amount
		if "Stuffed animals" in  name:
			Global.enemy4 = amount
		updatesprite()
	
	else:
		pass
