extends Node
var pause_screen=null
var level=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	pass
	#if event.is_action_pressed("ui_cancel"):
		#print("Asdf")
		#get_tree().paused=not get_tree().paused

func toggle_pause():
	#print(pause_screen)
	#print(pause_screen==null)
	#if pause_screen==null:
		#get_tree().current_scene.get_parent().process_mode=Node.PROCESS_MODE_PAUSABLE
		#pause_screen=load("res://pause.tscn").instantiate()
		#get_tree().current_scene.add_child(pause_screen)
	#else:
		#pause_screen.queue_free()
		#pause_screen=null
		#get_tree().current_scene.get_parent().process_mode=Node.PROCESS_MODE_INHERIT

	
	pass
	#is_paused = !is_paused
	#if is_paused:
		## Pausing the game - show the pause scene
		#var pause_scene = load(pause_scene_path).instance()
		#get_tree().current_scene.add_child(pause_scene)
		#get_tree().paused = true
	#else:
		## Resuming the game - remove the pause scene and resume
		#get_tree().current_scene.get_node("NameOfYourPauseSceneNode").queue_free()
		#get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
