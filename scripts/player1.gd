extends CharacterBody2D


const SPEED = 60.0
const JUMP_VELOCITY = -75.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravityOn = false
var coins = 10000;
var locked = false
@onready var animated_sprite_2d = $AnimatedSprite2D

func addCoin(num):
	coins += num;
	$CoinCounter.get_node("Label").text = str(coins)
	
func removeCoin(num):
	coins -= num;
	$CoinCounter.get_node("Label").text = str(coins)
	
func getCoins() -> int:
	return int(coins)
	

func _physics_process(delta):
	if(locked):
		animated_sprite_2d.play("idle")
		return
	# Add the gravity.
	if not is_on_floor() and gravityOn:
		velocity.y += gravity * delta
		#print("Applying Gravity")

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor() and gravityOn:
		velocity.y = JUMP_VELOCITY
		


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("run")
	elif direction > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if(!gravityOn):
		direction = Input.get_axis("move_down", "move_up") * -1;
		if direction:
			velocity.y = direction * SPEED
			#animated_sprite_2d.play("run")
			#print("Run")
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
		
	

	move_and_slide()


func _on_invest_add_coin(num):
	addCoin(num)


func _on_invest_remove_coin(num):
	removeCoin(num)
