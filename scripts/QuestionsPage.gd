extends Node2D

var parameter
@onready var finalScene

func set_parameter(value, option1, option2, option3, option4, question, bob):
	parameter = value
	finalScene = bob
	$Button1/Button/Label.text = option1;
	$Button2/Button2/Label.text = option2
	$Button3/Button3/Label.text = option3
	$Button4/Button4/Label .text = option4
	
	$Button1/AnimatedSprite2D.visible = false;
	$Button2/AnimatedSprite2D.visible = false;
	$Button3/AnimatedSprite2D.visible = false;
	$Button4/AnimatedSprite2D.visible = false;
	
	$Timer.stop()
	$Timer.wait_time = 60.0  
	$Timer.start()   
	
	$Label.text = question
	print("Received parameter: ", parameter)
	self.visible = true;
	$"..".locked = true;

func checkAnswer(ans) -> bool: 
	var boolean = (ans == parameter);
	return boolean;
	
func question_done():
	print("done")
	self.visible = false;
	$"..".locked = false;
	finalScene.onDone()
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time = $Timer.time_left
	time = int(time * 10)
	var floatTimer = time/10.0;
	if(floatTimer == int(floatTimer)):
		floatTimer = str(floatTimer) + ".0"
	if((str(floatTimer) + "s") != $Sprite2D/Sprite2D2/Label.text):
		$Sprite2D/Sprite2D2/Label.text = (str(floatTimer) + "s")
