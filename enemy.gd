extends Area2D

@export var speed = 500
@onready var ray_cast_2d = $RayCast2D
@onready var player = $Player
@onready var animation_player = $DrawGun
@onready var holstersound = $"../Player/Camera2D/UI/Gun/drawgun/holstersound"
@onready var timer = $Timer
@onready var area_2d = $Area2D

@onready var enemy_2 = $"../Enemy2"
@onready var enemy = $"."
signal playerhasbeenshot
@export var drawspeed : float
signal badkill
var armed = false
signal bossdeath
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	if Input.is_action_pressed("shoot"):
		$AnimatedSprite2D.animation = "shoot"
		$AnimatedSprite2D.play()
		
	#else:
		#$AnimatedSprite2D.animation="idle"
	

#position = position.clamp(Vector2.ZERO, screen_size)
	
	#if velocity.x != 0:
		#$AnimatedSprite2D.animation = "walk"
		#$AnimatedSprite2D.flip_v = false
		#$AnimatedSprite2D.flip_h = velocity.x < 0
	pass
	
	

	
func _on_area_2d_body_entered(body):
	animation_player.speed_scale = 0.5
	animation_player.play("Draw")
	holstersound.play()
		
	
		
	pass # Replace with function body.
	
	




	
	
	
	pass # Replace with function body.


func _on_draw_delay_timeout():
	#This function is where we can customize the specific draw difficulty of bandits on each duplicate
	#of the base bandit scene type
	#It's also when it becomes 'moral' to gun the guy down without taking a hit to your soul
	$AnimatedSprite2D.speed_scale=drawspeed
	armed=true;
	$AnimatedSprite2D.play("shoot")
	
	holstersound.play()
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	$enemygunshot.play()
	playerhasbeenshot.emit()
	pass # Replace with function body.


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$enemyLOS/playerspottedgrunt.play()
	pass # Replace with function body.


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$enemyLOS/playerspottedgrunt.play()
	pass # Replace with function body.


func _on_gun_kill():
	if $AnimatedSprite2D.animation!="shoot":
		badkill.emit()
	
	self.hide()
	self.queue_free()
	pass # Replace with function body.


func _on_hitboxevent_button_down():
	if armed==false:
		badkill.emit()
	if get_parent().gunusable==true:
		bossdeath.emit()
		self.queue_free()
	pass # Replace with function body.


func _on_player_sinner():
	pass # Replace with function body.





func _on_monologue_trigger_bossprep():
	$enemyLOS.scale.x=1.2
	pass # Replace with function body.
