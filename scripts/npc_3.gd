extends Node2D

var done = false
@onready var narrator = $"../Player/narrator"
var arr = ["Ahoy there, sailor! Ye’ve found me treasure, but it ain’t free for the takin’. Ye’ll need to prove yer worth first.", "Answer me questions—get ‘em right, and the gold is yours. Fail, and ye’ll walk away empty-handed!", "Ready to test yer wits? Only the sharpest minds earn the spoils of the sea. Let’s see what ye’ve got!"]

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
		$"Exclamation Mark".visible = false;

