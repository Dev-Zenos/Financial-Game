extends Node2D

var price_1 = 500;
var price_2 = 250;
var price_3 = 100;

var lvl_1 = 1
var lvl_2 = 1
var lvl_3 = 1

var risk_1 = 99
var risk_2 = 99
var risk_3 = 99

var total_risk = 99

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_pressed():
	self.visible = false;
	$"..".locked = false;
	
func update_total_risk():
	total_risk = round((risk_1 * 0.50) + (risk_2 * 0.35) + (risk_3 * 0.15))
	
func update_ui():
	update_total_risk()
	$VBoxContainer/Hull/price.text = "Cost: $" + str(price_1) + "\nLevel -  " + str(lvl_1)
	$VBoxContainer/Hull/risk.text = "Risk = " + str(risk_1) + "%"
	
	$VBoxContainer/Sails/price.text = "Cost: $" + str(price_2) + "\nLevel -  " + str(lvl_2)
	$VBoxContainer/Sails/risk.text = "Risk = " + str(risk_2) + "%"
	
	$VBoxContainer/Mast/price.text = "Cost: $" + str(price_3) + "\nLevel -  " + str(lvl_3)
	$VBoxContainer/Mast/risk.text = "Risk = " + str(risk_3) + "%"
	
	$totalrisk.text = "Total Risk: " + str(total_risk) + "%"


func _on_hull_upgrade_pressed():
	var coins = $"..".getCoins()
	if(price_1 > coins):
		return
	$"..".removeCoin(price_1);
	lvl_1 += 1;
	risk_1 -= 20
	if(risk_1 < 0):
		risk_1 = 0
	price_1 += round(price_1 * 0.10)
	update_ui()
	


func _on_sails_upgrade_pressed():
	var coins = $"..".getCoins()
	if(price_2 > coins):
		return
	$"..".removeCoin(price_2);
	lvl_2 += 1;
	risk_2 -= 20
	if(risk_2 < 0):
		risk_2 = 0
	price_2 += round(price_2 * 0.15)
	update_ui()


func _on_mast_upgrade_pressed():
	var coins = $"..".getCoins()
	if(price_3 > coins):
		return
	$"..".removeCoin(price_3);
	lvl_3 += 1;
	risk_3 -= 20
	if(risk_3 < 0):
		risk_3 = 0
	price_3 += round(price_3 * 0.20)
	update_ui()


func _on_go_pressed():
	self.visible = false;
	$"../../Big_Boat".go()
