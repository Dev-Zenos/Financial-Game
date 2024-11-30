extends Node2D

var arr = ["Ahoy, matey! Let me tell ye about two ways to grow yer riches. First up, the savings account—it’s like a treasure chest where yer gold stays safe and even grows a little over time. Perfect for keepin’ yer doubloons ready for when ye need ‘em!", 
			"Now, if ye fancy a bit more adventure, there’s the stock market. Ye buy shares—pieces of a company—and if they sail strong, yer share grows in value. But beware! The seas can be rough, and not all ventures pay off. Balance yer risks, and ye might strike it rich!", 
			"Come back to me if ye want to open the stock market and start yer journey into the world of trading!"
		  ]
var done = false
var entered = false
var investStart = false
@onready var narrator = $"../Player/narrator"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(done && entered && !$"../Player/Invest".visible):
		if Input.is_action_just_pressed("click"):
			$"../Player".locked = true
			$"../Player/Invest".visible = true
			$"../Player/Label".text = ""
			if(!investStart):
				$"../Player/Invest".get_node("Timer").start()
				investStart = true


func _on_area_2d_body_entered(body):
	if(body.name != "Player"):
		return
	print("player")
	if(!done):
		narrator.say(arr, "narrator2")
	else:
		entered = true
		body.get_node("Label").text = "Press Space to open Stock Market"




func _on_narrator_narrator_done(done):
	if done != "narrator2":
		return
	print("npc 2 done")
	self.done = true
	$"Exclamation Mark".visible = false;


func _on_area_2d_body_exited(body):
	entered = false
	body.get_node("Label").text = ""
