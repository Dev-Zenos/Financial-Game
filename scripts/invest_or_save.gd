extends Node2D

var investStart = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_savings_pressed():
	$"../narrator".say(["Hey this is a test", "bob"], "narrator1")


func _on_stock_market_pressed():
	$"../Invest".visible = true;
	self.visible = false;
	if(!investStart):
			$"../Invest".get_node("Timer").start()
			investStart = true
