extends Node2D

var delay = 250
var timer = 0;
var goUp = false;
@onready var sprite = $Sprite2D
@onready var yPos = sprite.position.y;



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta * 1000;
	if(timer > delay):
		timer = 0;
		if(sprite.position.y <= yPos):
			goUp = false;
		elif(sprite.position.y >= yPos + 3):
			goUp = true;
		if(goUp):
			sprite.position.y -= 1
		else:
			sprite.position.y += 1
		
	
