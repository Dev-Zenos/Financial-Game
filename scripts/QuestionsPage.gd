extends Node2D

var parameter

func set_parameter(value):
	parameter = value
	print("Received parameter: ", parameter)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time = $Timer.time_left
	time = int(time * 10)
	var floatTimer = time/10.0;
	if(floatTimer == int(floatTimer)):
		floatTimer = str(floatTimer) + ".0"
	if((str(floatTimer) + "s") != $Timer/Label.text):
		$Timer/Label.text = (str(floatTimer) + "s")
