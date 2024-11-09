extends Node2D

@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var label = $Label
@onready var character_body_2d = $".."	
var msgs = ["Woah! That was close", "I hope you learned a lot about poland in 2016, if I had more time, I would show you other time periods.", "But a cats gotta do what a cats gotta do, bye :D"]
var clicks = 0
var timer = 0;
var counter = 0;
const DELAY = 20
var visible2 = true;
@onready var animatedSprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animatedSprite.play("narrator1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!visible2):
		return
	character_body_2d.locked = true;
	if Input.is_action_just_pressed("click"):
		clicks += 1
		timer = 0
		counter = 0;
	if(clicks >=  msgs.size()):
		end();
	timer += delta * 1000
	if(timer > DELAY and clicks <= msgs[clicks].length()):
		timer = 0
		counter += 1
		if(msgs[clicks].substr(counter, 1) == " "):	
			audio_stream_player_2d.play()
	label.text = msgs[clicks].substr(0,counter);
	
func end():
	print("ending")
	visible2 = false;
	timer = 0;
	counter = 0;
	clicks = 0;
	animatedSprite.visible = false
	animatedSprite.play("empty")
	character_body_2d.locked = false;
