extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time = $Timer.time_left;
	$TimeLabel.text = "Next Tick in: " + str(round(time)) + "s"

signal add_coin(num)
signal remove_coin(num)

func locked(bools):
	$"..".locked = bools;
	
func add(nums):
	emit_signal("add_coin", nums)
	
func remove(nums):
	emit_signal("remove_coin", nums)



func _on_button_pressed():
	self.visible = false;
	locked(false)
