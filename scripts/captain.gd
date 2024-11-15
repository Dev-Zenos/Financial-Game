extends Node2D

@onready var narrator = $"../Player/narrator"
var arr = ["bob", "bob"]
var done = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_body_entered(body):
	if(body.name != "Player"):
		return
	print("player")
	if(!done):
		narrator.say(arr, "narrator1")
		done = true
