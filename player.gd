extends CharacterBody2D
var mousepos=get_global_mouse_position()
signal hit
signal sinner
var trackchange=false

@export var speed = 100 # how fast the player moves pixel/sec
var screen_size #size of game window
var gundrawn=false;
var water=25;
var sin=0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D/playerbarks.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # the players movement vector?
	if (gundrawn==false):
		if Input.is_action_pressed("move_right"):
			velocity.x +=1
		if Input.is_action_pressed("move_down"):
			velocity.y +=1
		if Input.is_action_pressed("move_left"):
			velocity.x -=1
		if Input.is_action_pressed("move_up"):
			velocity.y -=1
	
	
	
	if velocity.length() > 0:
		velocity=velocity.normalized() * speed
		$AnimatedSprite2D.animation="walk"
		$AnimatedSprite2D.play()
	else:
		if(gundrawn==false):
			$AnimatedSprite2D.animation="idle"
			$AnimatedSprite2D.play()

	
	position += velocity * delta
	move_and_slide()
#position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation="walk"
		$AnimatedSprite2D.flip_v=false
		$AnimatedSprite2D.flip_h=velocity.x<0
	
	
	
	pass

#this needs implementation with overworld encounters
#func _on_body_entered(body):
#	hide()
#	hit.emit()
#	$CollisionShape2D.set_deferred("disabled", true)
#	pass # Replace with function body.
	
func start(pos):
	position=pos
	show()
	$CollisionShape2D.disabled=false


func _on_drawgun_button_down():
	if(gundrawn==true):
		$holstertimer.start()
		$AnimatedSprite2D.animation="holster"
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.animation="draw"
		$AnimatedSprite2D.play()
		gundrawn=true;
	
	
	
	pass # Replace with function body.


func _on_gundrawdelay_timeout():
	gundrawn=true;
	pass # Replace with function body.


func _on_holstertimer_timeout():
	gundrawn=false;
	pass # Replace with function body.


func _on_gun_shoot():
	$AnimatedSprite2D.animation="shoot"
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.play()
	pass # Replace with function body.

func gameover():
	pass;

func _on_thirsttimer_timeout():
	water-=1;
	$Camera2D/UI/Watertracker/canteen/RichTextLabel.clear()
	$Camera2D/UI/Watertracker/canteen/RichTextLabel.add_text(str(water))
	if (water==0):
		get_tree().change_scene_to_file("res://game over.tscn")
	pass # Replace with function body.


func _on_waterpickup_area_entered(area):
	water=100
	$Camera2D/UI/Watertracker/canteen/RichTextLabel.clear()
	$Camera2D/UI/Watertracker/canteen/RichTextLabel.add_text(str(water))
	pass # Replace with function body.


func _on_waterpickup_waterget():
	water=100
	$Camera2D/UI/Watertracker/canteen/RichTextLabel.clear()
	$Camera2D/UI/Watertracker/canteen/RichTextLabel.add_text(str(water))
	pass # Replace with function body.


func _on_enemy_playerhasbeenshot():
	get_tree().change_scene_to_file("res://game over.tscn")
	pass # Replace with function body.





func _on_enemy_badkill():
	sin=sin+1
	if (sin==2):
		$"Camera2D/UI/sin tracker".hide()
		$Camera2D/playerbarks.show()
		$Camera2D/playerbarks/dialoguetimer.start()
		$Camera2D/playerbarks/playerbarksound.play()
		$soundtrack.stop()
		$bigfightmusic.play()
		trackchange=true
		sinner.emit()
	pass # Replace with function body.




func _on_monologue_trigger_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	$Camera2D/playerbarks.text="He's close. This is it."
	$Camera2D/playerbarks.show()
	$Camera2D/playerbarks/playerbarksound.play()
	$Camera2D/playerbarks/dialoguetimer.start()
	if(trackchange==false):
		$soundtrack.stop()
		$bigfightmusic.play()
	pass # Replace with function body.
