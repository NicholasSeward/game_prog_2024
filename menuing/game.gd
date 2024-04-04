extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$money.text="money=%d"%Global.money
	pass

func _autoclick():
	Global.money+=Global.autoclickers
	print("money=%d"%Global.money)
	

func _on_button_pressed():
	Global.money+=Global.click_power
	print("money=%d"%Global.money)

func _on_upgrade():
	get_tree().change_scene_to_file("res://upgrade.tscn")
