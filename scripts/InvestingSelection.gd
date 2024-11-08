extends Button

@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	print("Pressed")


func _on_mouse_entered():
	sprite_2d.scale *= 1.25
	sprite_2d.z_index = 10


func _on_mouse_exited():
	sprite_2d.scale /= 1.25
	sprite_2d.z_index = 0
