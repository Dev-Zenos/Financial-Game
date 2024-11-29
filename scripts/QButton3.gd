extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.visible = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_3_pressed():
	var ans = await $"..".checkAnswer($Button3/Label.text)
	print(ans)
	$AnimatedSprite2D.visible = true;
	if(ans):
		$AnimatedSprite2D.play("correct")
	else:
		$AnimatedSprite2D.play("wrong")
	$AnimationPlayer.play("shake")
