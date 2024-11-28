extends Node2D

var parameter

func set_parameter(value, option1, option2, option3, option4, question):
	parameter = value
	$Button1/Button/Label.text = option1;
	$Button2/Button2/Label.text = option2
	$Button3/Button3/Label.text = option3
	$Button4/Button4/Label .text = option4
	print("Received parameter: ", parameter)

func checkAnswer(ans) -> bool: 
	return (ans == parameter)

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
