extends Node2D

var deposit = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func init(deposit_mode):
	deposit = deposit_mode;
	$"../Withdraw".disabled = true;
	$"../Deposit".disabled = true;
	if(deposit):
		$ok.text = "Deposit"
	else:
		$ok.text = "Withdraw"
	self.visible = true;


func _on_ok_pressed():
	$"../Withdraw".disabled = false;
	$"../Deposit".disabled = false;
	self.visible = false;
	if(deposit):
		$"..".deposit_money(int($LineEdit.text))
	else:
		$"..".withdraw_money(int($LineEdit.text))
	$LineEdit.text = ""
