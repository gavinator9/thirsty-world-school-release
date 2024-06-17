extends RichTextLabel
var talky=false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_playerspottedgrunt_finished():
	$coltondialogtimer.start()
	pass # Replace with function body.


func _on_coltondialogtimer_timeout():
	self.show()
	
	$coltondialogtimer.wait_time=7.0;
	$coltondialogtimer.start()
	if(talky==true):
		self.hide()
	talky=true
	pass # Replace with function body.
