extends Node2D

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

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween=create_tween().set_parallel(true)
	tween.tween_property(self,"position:x",1000,5)
	tween.tween_property(self,"rotation",10*PI,5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if is_blocked(position.x,position.y):
		#print("blocked")
		#queue_free()
	pass


func _on_area_2d_body_entered(body):
	queue_free()
	pass # Replace with function body.
