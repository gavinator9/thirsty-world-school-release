extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("r"):
		button_down.emit()
		button_up.emit()
	pass





func _on_clickspamprevention_timeout():
	show()
	pass # Replace with function body.


func _on_button_up():
	$clickspamprevention.start()
	hide()
	pass # Replace with function body.
