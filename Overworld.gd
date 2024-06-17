extends Node2D
@export var gunusable : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gunusable=$Player/Camera2D/UI/Gun.gunusable
	pass
