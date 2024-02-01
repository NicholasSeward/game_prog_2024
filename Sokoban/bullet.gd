extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween=create_tween().set_parallel(true)
	tween.tween_property(self,"position:x",1000,.5)
	tween.tween_property(self,"rotation",10*PI,.5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
