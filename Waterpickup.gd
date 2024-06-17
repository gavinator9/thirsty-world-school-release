extends Area2D

signal waterget
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	waterget.emit()
	$AudioStreamPlayer.play()
	$CollisionShape2D.disabled=true
	self.collision_layer=2
	self.collision_mask=2
	self.hide()
	pass # Replace with function body.
