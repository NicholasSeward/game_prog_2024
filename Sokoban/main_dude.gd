extends CharacterBody2D
var x=0
var y=0
var isDead=false
func _ready():
	x=position.x
	y=position.y

var rot=0

var bullet_maker = preload("res://bullet.tscn")

func is_blocked(x, y):
	var space_state = get_world_2d().direct_space_state
	var query_parameters = PhysicsShapeQueryParameters2D.new()
	var shape = CircleShape2D.new()
	shape.radius = 1.0 # Small radius to effectively check the point
	query_parameters.set_shape(shape)
	query_parameters.transform = Transform2D(0, Vector2(x,y))
	# Perform the query
	var result = space_state.intersect_shape(query_parameters)
	# Check if there's any collider at that position
	return result.size() > 0





func _physics_process(delta):
	if isDead:
		return
	var has_input=false
	#if abs(position.x-x)+abs(position.y-y)>32:
		#pass
	if Input.is_action_just_pressed("ui_accept"):
		var bullet = bullet_maker.instantiate()
		bullet.position=position
		bullet.rotation_degrees=rot
		add_sibling(bullet)

	
	if Input.is_action_just_pressed("ui_left") and not is_blocked(x-64,y):
		$AnimatedSprite2D.animation="left"
		$AnimatedSprite2D.play()
		x-=64
		has_input=true
		rot=180
	elif Input.is_action_just_pressed("ui_right") and not is_blocked(x+64,y):
		$AnimatedSprite2D.animation="right"
		$AnimatedSprite2D.play()
		x+=64
		has_input=true
		rot=0
	elif Input.is_action_just_pressed("ui_down") and not is_blocked(x,y+64):
		$AnimatedSprite2D.animation="down"
		$AnimatedSprite2D.play()
		y+=64
		has_input=true
		rot=90
	elif Input.is_action_just_pressed("ui_up") and not is_blocked(x,y-64):
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

func kill():
	isDead=true
	visible=false
	Start.level+=1
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://level%d.tscn"%[Start.level])

