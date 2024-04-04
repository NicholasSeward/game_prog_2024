extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$double.disabled=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$money.text="money=%d"%Global.money
	$double.disabled=Global.money<10*Global.click_power
	$auto.disabled=Global.money<10*Global.autoclickers
	
	$double.text="Double Click (%d)"%(10*Global.click_power)
	$auto.text="Auto Click (%d)"%(10*Global.autoclickers)
	
	pass

func _on_double():
	if Global.money>10*Global.click_power:
		Global.money-=10*Global.click_power
		Global.click_power*=2

func _on_auto():
	if Global.money>10*Global.autoclickers:
		Global.money-=10*Global.autoclickers
		Global.autoclickers+=1
	

func _on_return():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_auto_pressed():
	pass # Replace with function body.
