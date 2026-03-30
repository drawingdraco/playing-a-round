extends TextureProgressBar

var expprog = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	expprog =  (float(Global.pexp) - Global.prevlev) / float(Global.to_next_level) *100
	value = expprog
