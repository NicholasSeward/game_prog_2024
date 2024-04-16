extends Node2D

var dude_texture=preload("res://icon.svg")
var dudes={}
var url="https://seward.pythonanywhere.com/get_positions"
var uuid="234";
var nonce="23";
func refresh_positions():
	$HTTPRequest.request(url)

func _ready():
	$HTTPRequest.request_completed.connect(self._on_request_completed)
	$HTTPConnect.request_completed.connect(self._on_connect)
	$HTTPConnect.request("https://seward.pythonanywhere.com/connect")
	# Configure the HTTPRequest node
	refresh_positions()

func _on_connect(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	uuid=json["unique_id"]
	nonce=json["nonce"]
	var x=json["x"]
	var y=json["y"]
	$dude.position=Vector2(x,y);
	

func update_my_position(x,y):
	$HTTPSet.request("https://seward.pythonanywhere.com/set_position?x=%d&y=%d&unique_id=%s&nonce=%s"%[x,y,uuid,nonce])
	$dude.position=Vector2(x,y)

func _on_request_completed(result, response_code, headers, body):
	print("Asdf")
	var json = JSON.parse_string(body.get_string_from_utf8())
	for unique_id in json:
		
		var item=json[unique_id]
		print(item)
		var x = item["x"]
		var y = item["y"]

		# Check if the unique_id already exists in the dictionary
		if unique_id==uuid:
			$dude.position=Vector2(x, y)
		elif dudes.has(unique_id):
			# Update the object's position
			var obj = dudes[unique_id]
			obj.position = Vector2(x, y)
		else:
			# Create a new object, set its position, and add it to the dictionary
			var new_obj = get_circle(x,y)
			dudes[unique_id] = new_obj
	print(json)


func _process(delta):
	var changed=false
	var x=$dude.position.x
	var y=$dude.position.y
	if Input.is_action_just_pressed("ui_left"):
		x-=32
		changed=true
	if Input.is_action_just_pressed("ui_right"):
		x+=32
		changed=true
	if Input.is_action_just_pressed("ui_up"):
		y-=32
		changed=true
	if Input.is_action_just_pressed("ui_down"):
		y+=32
		changed=true
	if changed:
		
		update_my_position(x,y)
	
		
	pass
	#if randf() < 0.1:  # Adjust the probability as needed
		#create_random_circle()

func get_circle(x,y):
	var position = Vector2(x,y)
	var dude = Sprite2D.new()
	dude.texture=dude_texture
	dude.position = position
	dude.scale=Vector2(.5,.5)
	add_child(dude)
	return dude
	

