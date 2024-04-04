extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_money_pressed():
	Global.money+=100
	print("button money=%d"%Global.money)
func _on_start_pressed():
	print("Start")
	get_tree().change_scene_to_file("res://game.tscn")
