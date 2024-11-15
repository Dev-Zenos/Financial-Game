extends Node2D

@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var label = $Label
@onready var character_body_2d = $".."	
var msgs = ["Arrr, ye’ve washed ashore in quite the mess, haven’t ye? Ship’s broken, gold’s runnin’ low, and it’s up to ye to get us seaworthy again!", "Listen up! We’ve got repairs to make and supplies to gather. Spend yer doubloons wisely, or ye’ll be stuck here longer than a sailor’s curse!", "I’ll be keepin’ a sharp eye on ye. Don’t go wastin' our gold on trifles—use it smart, or ye’ll have the sea to answer to!", "Ye’ve got yer orders, but if yer ever unsure what’s still needin’ fixin’, come talk to me again. I’ll tell ye what parts and supplies we’re still lackin’!"]
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
	
func say(arr, anim):
	msgs = arr
	visible2 = true;
	animatedSprite.visible = true
	animatedSprite.play(anim)
	character_body_2d.locked = true;

	
