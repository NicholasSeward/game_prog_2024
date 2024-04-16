extends Node2D
var speed=30
var astar = AStar2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_parent().
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target=get_parent().get_node("MainDude")
	if target:
		var vec=Vector2(target.position.x-position.x,target.position.y-position.y)
		vec=vec.normalized()
		position=position+vec*speed*delta
	


func _on_area_2d_body_entered(body):
	if body.name=="MainDude":
		body.kill()
