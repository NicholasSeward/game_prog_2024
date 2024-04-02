extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var a=Quaternion(Vector3(0, 1, 0), PI/6)
	var b=Quaternion(Vector3(1, 0, 0), PI)
	var p=(sin(2*PI*(Time.get_ticks_msec()/1000.0)/2)+1)/2
	a=a.slerp(b,p)
	rotation=a.get_euler()
	pass
