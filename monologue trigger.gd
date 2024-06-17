extends Area2D
signal bossprep

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	bossprep.emit()
	self.queue_free()
	pass # Replace with function body.
