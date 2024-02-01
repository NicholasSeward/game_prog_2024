extends CharacterBody2D
var x=0
var y=0


func _physics_process(delta):
	var has_input=false
	if abs(position.x-x)+abs(position.y-y)>10:
		pass
	elif Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.animation="left"
		$AnimatedSprite2D.play()
		x-=64
		has_input=true
	elif Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.animation="right"
		$AnimatedSprite2D.play()
		x+=64
		has_input=true
	elif Input.is_action_just_pressed("ui_down"):
		$AnimatedSprite2D.animation="down"
		$AnimatedSprite2D.play()
		y+=64
		has_input=true
	elif Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite2D.animation="up"
		$AnimatedSprite2D.play()
		y-=64
		has_input=true
	if has_input:
		var tween=create_tween().set_parallel(true)
		tween.tween_property(self,"position:x",x,.5)
		tween.tween_property(self,"position:y",y,.5)
	
		
		#twe.tween_property($Sprite, "modulate", Color.RED, 1)
		
	move_and_slide()

