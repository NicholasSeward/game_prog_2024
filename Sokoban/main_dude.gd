extends CharacterBody2D
var x=position.x
var y=position.y
var rot=0

var bullet_maker = preload("res://bullet.tscn")

func _physics_process(delta):
	var has_input=false
	#if abs(position.x-x)+abs(position.y-y)>32:
		#pass
	if Input.is_action_just_pressed("ui_accept"):
		var bullet = bullet_maker.instantiate()
		bullet.position=position
		bullet.rotation_degrees=rot
		add_sibling(bullet)

	
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.animation="left"
		$AnimatedSprite2D.play()
		x-=64
		has_input=true
		rot=180
	elif Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.animation="right"
		$AnimatedSprite2D.play()
		x+=64
		has_input=true
		rot=0
	elif Input.is_action_just_pressed("ui_down"):
		$AnimatedSprite2D.animation="down"
		$AnimatedSprite2D.play()
		y+=64
		has_input=true
		rot=90
	elif Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite2D.animation="up"
		$AnimatedSprite2D.play()
		y-=64
		has_input=true
		rot=270
	if has_input:
		var tween=create_tween().set_parallel(true)
		tween.tween_property(self,"position:x",x,.5).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		tween.tween_property(self,"position:y",y,.5).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		#tween.tween_property(self,"rotation",rotation+2*PI,.5)
	
		
		#twe.tween_property($Sprite, "modulate", Color.RED, 1)
		
	move_and_slide()

