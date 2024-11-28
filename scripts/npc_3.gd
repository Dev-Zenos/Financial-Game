extends Node2D

var done = false
@onready var narrator = $"../Player/narrator"
@onready var sceneTwo = preload("res://scenes/questions_page.tscn")
var arr = ["Ahoy there, sailor! Ye’ve found me treasure, but it ain’t free for the takin’. Ye’ll need to prove yer worth first.", "Answer me questions—get ‘em right, and the gold is yours. Fail, and ye’ll walk away empty-handed!", "Ready to test yer wits? Only the sharpest minds earn the spoils of the sea. Let’s see what ye’ve got!"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if(body.name != "Player"):
		return
	print("player")
	if(!done):
		narrator.say(arr, "narrator3")
		done = true
		$"Exclamation Mark".visible = false;
		




func _on_narrator_narrator_done(done):
	if(done != "narrator3"):
		return;
	# Instance the scene instead of just changing to it
	var instance = sceneTwo.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	
	# Set the parameter on the new scene
	instance.set_parameter("Your parameter value here")
	
	# Add the new scene to the tree
	get_tree().root.add_child(instance)
	
	# Optionally, remove the current scene
	get_tree().current_scene.queue_free()
