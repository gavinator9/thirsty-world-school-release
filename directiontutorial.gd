extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ammowatertutorialtext_reveal():
	self.show()
	pass # Replace with function body.


func _on_yepbutton_button_up():
	self.text="Remember that real men don't kill unarmed strangers. If they draw, you know the deal. Good luck."
	$textfade.start()
	pass # Replace with function body.


func _on_textfade_timeout():
	self.hide()
	pass # Replace with function body.
