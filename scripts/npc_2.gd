extends Node2D

var arr = ["Ahoy there, matey! Lookin’ to trade? I’ve got the finest wares this side of the sea—if ye’ve got the gold to pay!", "Repair parts, rations, tools—ye name it, I’ve got it. But fair warnin’, cheap gear don’t last long, and the good stuff costs a pretty doubloon!", "Pick wisely, sailor. Once ye spend yer gold, there’s no gettin’ it back. What’ll it be?"]
var done = false
@onready var narrator = $"../Player/narrator"

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
		narrator.say(arr, "narrator2")
		done = true
		$"Exclamation Mark".visible = false;
