extends Node2D

@onready var narrator = $"../Player/narrator"
var arr = ["Ahoy, traveler! Lookin’ to patch up yer vessel, are ye? I’ve got parts for every corner of that creaky ship of yours—but mind ye, the quality varies.", "Here’s the deal: I’ve got basic parts that’ll do the job, but they might not last through rough waters. Or, ye can invest in premium parts—more costly, but built to weather the fiercest storms. The higher the part level, the lower the risk ye take.", "Take yer pick wisely! Are ye a gambler who trusts the seas, or a sailor who values safety and durability?"]
var done = false
var entered = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(done && entered && !$"../Player/ship_parts".visible && !$"../Big_Boat".moving):
		if Input.is_action_just_pressed("click"):
			$"../Player".locked = true
			$"../Player/ship_parts".visible = true;
			$"../Player/Label".text = ""



func _on_area_2d_body_entered(body):
	if(body.name != "Player"):
		return
	print("player")
	if(!done):
		narrator.say(arr, "narrator1")
		done = true
		$"Exclamation Mark".visible = false;
	else:
		entered = true
		body.get_node("Label").text = "Press Space to open Ship Parts Panel"
