extends Node2D


var enabled = false;
var moving = false;
@onready var player = $"../Player"
var delay = 20;
var counter = 0;
var finalX = -195;
var startX = -40;
var goingBack = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!enabled):
		return
	if(moving):
		counter += delta  * 1000;
		if(counter > delay):
			counter = 0;
			if(!goingBack):
				if($".".position.x <= finalX):
					moving = false;
					enabled = false;
					goingBack = true;
					player.position.x = -241
					player.position.y = -129
					player.locked = false;
				else: 
					player.position.x -= 2;
					$".".position.x -= 2;
			else:
				if($".".position.x >= startX):
					moving = false;
					enabled = false;
					goingBack = false;
					player.position.x = -27
					player.position.y = -79
					player.locked = false;
				else: 
					player.position.x += 2;
					$".".position.x += 2;
	elif Input.is_action_just_pressed("click"):
		player.position.x = $".".position.x + 2;
		player.position.y = $".".position.y - 10;
		moving = true;
		if(goingBack):
			$Sprite2D.flip_h = false;
		else:
			$Sprite2D.flip_h = true;
		player.locked = true;
		player.get_node("Label").text = ""


func _on_area_2d_body_entered(body):
	if(body.name != "Player"):
		return
	body.get_node("Label").text = "Press Space to ride boat"
	enabled = true
	


func _on_area_2d_body_exited(body):
	if(body.name != "Player"):
		return
	body.get_node("Label").text = ""
	enabled = false



