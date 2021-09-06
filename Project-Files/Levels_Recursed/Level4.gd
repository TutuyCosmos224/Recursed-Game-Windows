extends Node2D
var spawn = preload ("res://Player/Player.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spawning=0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Kali5.operan = "x"
	$Kali5.number = 5
	$Log2.operan = "log"
	$Plus5.operan = "+"
	$Plus5.number = 5
	$Kali4.operan = "x"
	$Kali4.number = 4
	$Kali5_2.operan = "x"
	$Kali5_2.number = 5
	$Plus3.operan = "+"
	$Plus3.number = 3
	
	if spawning == 0:
		spawn = spawn.instance()
		add_child(spawn)
		
		if Global.key == 7:
			spawn.position.x = 111
			spawn.position.y = 955
		
		if Global.key == 8:
			spawn.position.x = 1755
			spawn.position.y = 955
			
		spawning+=1
		
	$ReverseCam.make_current()
	
func _process(delta):
	$ReverseCam.position = spawn.position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
