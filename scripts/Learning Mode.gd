extends Button


@onready var sprite = $"../../Label1"
var scene = preload("res://scenes/panel_selection.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	sprite.scale *= 1.25;
	sprite.position.y += 25;


func _on_mouse_exited():
	sprite.scale /= 1.25;
	sprite.position.y -= 25;


func _on_pressed():
	get_tree().change_scene_to_packed(scene)
