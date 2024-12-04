extends Node2D

var balance = 0;
var intrest = 0.0169;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_ui():
	$Balance.text = "Balance $" + str(balance)
	
func deposit_money(num):
	var money = $"..".getCoins()
	if(num > money):
		return
	balance += num;
	$"..".removeCoin(num)
	update_ui()
	
func withdraw_money(num):
	if(num > balance):
		return
	balance -= num;
	$"..".addCoin(num)
	update_ui()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Intrest.text = "Intrest Rate: 1.69% (next tick in " + str(round($Timer.time_left)) + "s)"


func _on_deposit_pressed():
	$panel.init(true)


func _on_withdraw_pressed():
	$panel.init(false)


func _on_timer_timeout():
	balance += balance * intrest 
	balance = round(balance)
	update_ui()


func _on_button_pressed():
	$"..".locked = false;
	self.visible = false
	print("unlocked")
