extends Area2D

export onready var operan : String
export var number : float
var player_in : bool = false
signal body_enter

func _ready():
	$Label2.visible = false
	sprite()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if operan != "log":
		$Label.text = str(number)
	elif operan == "log":
		$Label.text = "log"
	sprite()
	if player_in == true && Input.is_action_just_pressed("Use"):
		calculate()
		queue_free()

func sprite():
	if operan == "x":
		$AnimatedSprite.play("Multiply")
	elif operan == "/":
		$AnimatedSprite.play("Divide")
	
	elif operan == "+":
		$AnimatedSprite.play("Plus")

	elif operan == "-":
	
		$AnimatedSprite.play("Minus")
	elif operan == "log":
		$AnimatedSprite.play("Log")
	

func calculate():
	if operan == "x":
		$AnimatedSprite.play("Multiply")
		Global.key = Global.key * number
	elif operan == "/":
		$AnimatedSprite.play("Divide")
		Global.key = Global.key / number
	elif operan == "+":
		$AnimatedSprite.play("Plus")
		Global.key = Global.key + number
	elif operan == "-":
		Global.key = Global.key - number
		$AnimatedSprite.play("Minus")
	elif operan == "log":
		$AnimatedSprite.play("Log")
		Global.key = log10(Global.key)

func log10(a):
	return (log(a)/log(10))

func _on_Item_body_entered(body):
	if "Player" in body.name:
		$Label2.visible = true
		player_in = true
		

func _on_Item_body_exited(body):
	if "Player" in body.name:
		$Label2.visible = false
		player_in = false
