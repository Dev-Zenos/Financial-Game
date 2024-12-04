extends Node2D

var moving = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func go():
	$AnimatedSprite2D.play("fixed_boat")
	$".".position.y -= 8
	$"../Player".position.x = 88
	$"../Player".locked = true;
	$"../Player".position.y = 22
	moving = true
	$Timer.start();


func _on_timer_timeout():
	if(moving):
		$".".position.x += 1
		$"../Player".position.x += 1
