extends KinematicBody2D
export var health :int
var laser = preload("res://Boss/Laser.tscn")
var rain = preload("res://Boss/Rain.tscn")
var item = preload("res://Interactable/Item.tscn")
onready var timer = get_node ("Timer")
const max_health = 10000
var charga = 0
var time
var laser_spawn = 0
var rand : int = 0
var pos_awal
var movement : Vector2
var Resonate :float = 81.0
signal dead

func _ready():
	health = max_health
	$AnimationPlayer.play ("Idle")
	lazabeam()

	
func randaction():
	rand = randi()%2+1

	print (rand)
	if rand == 1:
		lazabeam()
	elif rand == 2 and (health*100/max_health) <  50:
		heheXD()
		
func lazabeam():
	$AnimationPlayer.play("Laser")
	add_child_below_node($CollisionBody2D,laser.instance())
	
func _process(delta):
	$Health.text = "Health = "+ str(health)
	$Label.text = str(Resonate)
	
func _on_Timer_timeout():
	$Growl.playing = true
	randaction()
	

func heheXD():
	var hehe = item.instance()
	var namba = randi()%69+1
	var random = randi()%4+1
	hehe.position.x = randi()%1000+0
	hehe.position.y = randi()%500+500
	hehe.number = namba
	if random == 1:
		hehe.operan = "+"
		Resonate += namba
	elif random == 2:
		hehe.operan = "-"
		Resonate -= namba
	elif random == 3:
		hehe.operan = "x"
		Resonate *= namba
	elif random == 4:
		hehe.operan = "/"
		Resonate /= namba
	get_tree().get_root().call_deferred("add_child",hehe)
	$Timer.wait_time += 1

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Laser":
		$AnimationPlayer.play("Idle")



func _on_Area2D_body_entered(body):
	if Global.key == Resonate:
		health -= 50
	if health < 1:
		emit_signal("dead")
		$AnimationPlayer.play("Death")

func _on_Area2D_area_entered(area):
	if Global.key == Resonate:
		health -= 50

