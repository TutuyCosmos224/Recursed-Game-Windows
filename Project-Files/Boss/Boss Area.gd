extends Node2D
var rain = preload("res://Boss/Rain.tscn")
var faya = preload("res://Boss/Fayaball.tscn")
# var a = 2
var time

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.checkpoint = 9
	Global.key = 0
	
	$CanvasLayer/Sprite2.visible=false
	$AudioStreamPlayer2D.play()
	Global.player_health = 100
	$bagi3.operan = "/"
	$bagi3.number = 3
	$plus3.operan = "+"
	$plus3.number = 3
	$min20.operan = "-"
	$min20.number = 20
	$kali4.operan = "x"
	$kali4.number = 4
	$plus1.operan = "+"
	$plus1.number = 1
	$Kali5.operan = "x"
	$Kali5.number = 5
	$Kali52.operan = "x"
	$Kali52.number = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.position.x = $Player.position.x

func rain():
	var rain_instance = rain.instance()
	rain_instance.position.y = $Sprite.position.y
	rain_instance.position.x = $Sprite.position.x
	get_tree().get_root().call_deferred("add_child",rain_instance)
	

func faya():
	var faya_instance = faya.instance()
	faya_instance.position.y = $Player.position.y
	faya_instance.position.x = $Boss.position.x - 100
	get_tree().get_root().call_deferred("add_child",faya_instance)
	ball += 1
	if ball == 5:
		ball = 0
		breded = false
		if ($Boss.health*100/$Boss.max_health) < 80:
			$TimerFaya.wait_time = 5
		elif ($Boss.health*100/$Boss.max_health) < 50:
			$TimerFaya.wait_time = 3
		elif ($Boss.health*100/$Boss.max_health) < 30:
			$TimerFaya.wait_time = 2
	
func _on_TimerHujan_timeout():
	rain()

var ball = 0
var breded = true

func _on_TimerFaya_timeout():
	ball = 0
	breded = true
	

func _on_TimerBall_timeout():
	if breded == true:
		faya()
		


func _on_Boss_dead():
	$CanvasLayer/Sprite2.visible = true
	$CanvasLayer/Timer.start()
	


func _on_Timer_timeout():
	get_tree().quit()
