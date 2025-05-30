extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	updateTOOMUCH()
	update_ui() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var stock_name = "Cutlass Cargo Co"
var value = 75.0
var stock_count = 0
var trend_data = [5, 1]

@onready var value_label = $Counter
@onready var buy_button = $Buy/BuyButton
@onready var sell_button = $Sell/SellButton
@onready var graph_line = $graph/Line2D

var graph_height = 212
var max_stock_value = 150.0  # Replace with the highest expected stock value
var scale_factor = graph_height / max_stock_value

func update_ui():
	$Name.text = stock_name
	value_label.text = " $" + str(round(value)) + "(" + str(stock_count) + " owned)"

func sell_stock():
	if stock_count > 0:
		stock_count -= 1
		# Deduct player money and add stock
	$"../..".add(round(value))
	update_ui()

func buy_stock():
	stock_count += 1
	# Add player money and deduct stock
	$"../..".remove(round(value)) #bug can buy even if u got negative shit
	update_ui()

func update_trend():
	trend_data.append(value)
	if trend_data.size() > 53:
		trend_data.pop_front()

func update_stock_prices():
	var change = randf_range(-0.3, 0.3) * value  # Smaller random range for lower volatility
	
	# Rare spikes or drops
	if randf() < 0.03:  # 3% chance for a high spike
		change *= randf_range(1.1, 1.5)
	elif randf() < 0.03:  # 3% chance for a sharp drop
		change *= randf_range(-1.1, -1.5)
	
	# Apply the change
	value += change
	
	# Clamp the value to stay within the range
	value = clamp(value, 10, 150)

	
func update_graph():
	graph_line.clear_points()
	for i in range(trend_data.size()):
		graph_line.add_point(Vector2(i * 10, graph_height - trend_data[i] * scale_factor))



func _on_timer_timeout():
	updateTOOMUCH()

func updateTOOMUCH():
	update_stock_prices()
	update_trend()
	update_graph()
	update_ui()
	print("New Stock2 Price: " + str(value))

func _on_buy_button_pressed():
	buy_stock()




func _on_sell_button_pressed():
	sell_stock()
