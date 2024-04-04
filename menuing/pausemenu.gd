extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		visible=not visible
		get_tree().paused=not get_tree().paused


func _on_button_pressed():
	get_tree().paused = false
	visible=false
	
	#var n=get_tree().current_scene.get_node("game")
	#n.paused = true
	
