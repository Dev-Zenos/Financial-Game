extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print(body.name )
	if(body.name == "big_boat"):
		body.moving = false;
		body.get_node("AnimatedSprite2D").play("broken_boat")
		$"../Player".die()


func _on_area_2d_area_entered(area):
	print(area.name )
	if(area.name == "Area2D"):
		$"../Big_Boat".moving = false;
		$"../Big_Boat".get_node("AnimatedSprite2D").play("broken_boat")
		$"../Big_Boat".position.y += 8
		$"../Player".die()
