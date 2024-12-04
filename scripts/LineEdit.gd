extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_text_changed(new_text):
	var regex = RegEx.new()
	regex.compile("[^0-9]")  # Match anything that's not a number (0-9)
	var filtered_text = regex.sub(new_text, "", false)
	if new_text != filtered_text:
		text = filtered_text
