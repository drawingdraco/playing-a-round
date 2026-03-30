extends RichTextLabel
var seconds = 0
var minutes = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = ("%d" %minutes + ":%d" %seconds)


func _on_timer_timeout() -> void:
	seconds += 1
	if seconds % 30 == 0:
		Global.dificulty += 1
	if seconds % 60 == 0:
		minutes += 1
		seconds = 0
	
