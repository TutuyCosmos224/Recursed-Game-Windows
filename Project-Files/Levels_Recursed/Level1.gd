extends Node2D
var spawn = preload ("res://Player/Player.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spawning=0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Kali2.operan = "x"
	$Kali2.number = 2
	$Min3.operan = "-"
	$Min3.number = 3
	$Kali5.operan = "x"
	$Kali5.number = 5
	$Plus11.operan = "+"
	$Plus11.number = 11
	$Bagi4.operan = "/"
	$Bagi4.number = 4
	$Min1.operan = "-"
	$Min1.number = 1
	$Plus6.operan = "+"
	$Plus6.number = 6
	
	if spawning == 0:
		spawn = spawn.instance()
		add_child(spawn)
		
		if Global.key == 1:
			spawn.position.x = 168
			spawn.position.y = 392
			
		if Global.key == 2:
			spawn.position.x = 742
			spawn.position.y = 955
			
		if Global.key == 6:
			spawn.position.x = 959
			spawn.position.y = 955
			
		if Global.key == 7:
			spawn.position.x = 1840
			spawn.position.y = 955
		
		spawning+=1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
