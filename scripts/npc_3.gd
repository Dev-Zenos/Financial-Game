extends Node2D

var done = false
@onready var narrator = $"../Player/narrator"
@onready var sceneTwo = preload("res://scenes/questions_page.tscn")
var arr = ["Ahoy there, sailor! Ye’ve found me treasure, but it ain’t free for the takin’. Ye’ll need to prove yer worth first.", "Answer me questions—get ‘em right, and the gold is yours. Fail, and ye’ll walk away empty-handed!", "Ready to test yer wits? Only the sharpest minds earn the spoils of the sea. Let’s see what ye’ve got!"]
var qNum = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if(body.name != "Player"):
		return
	print("player")
	if(!done):
		narrator.say(arr, "narrator3")
		done = true
		$"Exclamation Mark".visible = false;
		


var active_instance = null  # To track the instance
var qDone = false

func _on_narrator_narrator_done(done):
	if(qDone):
		return;
	if done != "narrator3":
		return
	$"../Player/CoinCounter".visible = false;
	# Instance the new scene

	# Set parameters for the instance if needed
	$"../Player/QuestionsPage".set_parameter(
		"To be ready for emergencies or big costs",
		"So you can show off",
		"To be ready for emergencies or big costs",
		"Because spending is boring",
		"Numbers Go Up! -> Good",
		"Why is it smart to save some money?",
		self  # Reference to the current scene for callback if needed
	)

	# Add the instance as a child to the root or the current scene

	# Optionally hide the current scene instead of freeing it

func onDone():
	qDone = true;
	qNum+=1;
	if(qNum > 3):
		narrator.say(["Arrr, well done, matey! Ye’ve proven yerself sharper than a cutlass! Take yer treasure and spend it wisely—don’t let it slip through yer fingers like sand!"], "narrator3")
		$"../Player/CoinCounter".visible = true;
		$"../Player".addCoin(50 * (qNum - 1))
	else:
		if(qNum == 2):
			$"../Player/QuestionsPage".set_parameter(
				"Your money is safe and earns interest over time.",
				"Your money is safe and earns interest over time.",
				"You can withdraw as much as you want, anytime.",
				"You can hide it from friends and family.",
				"The bank will spend it for you.",
				"What’s the main benefit of a savings account?",
				self  # Reference to the current scene for callback if needed
			)
		else:
			$"../Player/QuestionsPage".set_parameter(
				"To grow your money over time by taking calculated risks.",
				"To avoid saving in a bank.",
				"To keep it hidden from others.",
				"To spend it faster on things you like.",
				"To grow your money over time by taking calculated risks.",
				"What is the main goal of investing your money?",
				self  # Reference to the current scene for callback if needed
			)
	



