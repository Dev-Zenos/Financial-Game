extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.visible = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var ans = await $"..".checkAnswer($Button/Label.text)
	print(ans)
	$AnimatedSprite2D.visible = true;
	$AnimationPlayer.play("shake")
	if(ans):
		$AnimatedSprite2D.play("correct")
		await get_tree().create_timer(0.3).timeout 
		$"..".question_done()
		
	else:
		$AnimatedSprite2D.play("wrong")
