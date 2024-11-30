extends HTTPRequest


@onready var sceneTwo = preload("res://scenes/invest.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	request_completed.connect(_on_request_completed)
	request("https://financial-game-backend.onrender.com/start_connection")
	

func _get_user_data():
	var userId = "none"
	if FileAccess.file_exists("localStorage.txt"):
		var save_file = FileAccess.open("localStorage.txt", FileAccess.READ)
		var json_string = ""
		while save_file.get_position() < save_file.get_length():
			json_string += save_file.get_line();
		var obj = JSON.parse_string(json_string)
		userId = obj["UniqueID"]
	request("https://financial-game-backend.onrender.com/fetch_userData?userId=" + userId)

func _get_QBank():
	request("https://financial-game-backend.onrender.com/fetch_QBank")
	

func _await_save_user_data(obj):
	var obj2;
	if(obj["error"]):
		obj2 = {"UniqueID": obj["UniqueID"]}
	else:
		obj2 = {"UniqueID": obj["name"]}
	var save_file = FileAccess.open("localStorage.txt", FileAccess.WRITE)
	save_file.store_line((JSON.stringify(obj2)))

func _await_save_QBank(obj):
	var save_file = FileAccess.open("QBank.txt", FileAccess.WRITE)
	save_file.store_line(JSON.stringify(obj))
	print("Saving")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_request_completed(result, response_code, headers, body):
	var text = body.get_string_from_utf8()
	var json = JSON.parse_string(text)
	var data = JSON.parse_string(json)  # Parse the string again to get the actual object
	$"../Loading Spinner".get_node("Label").text = data["msg"]
	if(data["startCode"] == 0):
		_get_user_data()
	elif(data["startCode"] == 1):
		if(data["error"] == true):
			$"../Loading Spinner".get_node("Label").text = "Fetching Question Bank"
		_await_save_user_data(data)
		_get_QBank()
	elif(data["startCode"] == 2):
		_await_save_QBank(data)
		$"../CanvasLayer".visible = true
		$"../CanvasLayer".transition()
		
 


func _on_canvas_layer_transitioned():
	get_tree().change_scene_to_packed(sceneTwo)
