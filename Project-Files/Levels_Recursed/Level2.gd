extends Node2D
var spawn = preload ("res://Player/Player.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spawning=0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Plus4.operan = "+"
	$Plus4.number = 4
	$Kali1_5.operan = "x"
	$Kali1_5.number = 1.5
	$Min2.operan = "-"
	$Min2.number = 2
	$Kali3.operan = "x"
	$Kali3.number = 3
	$Kali6.operan = "x"
	$Kali6.number = 6
	$Kali5.operan = "x"
	$Kali5.number = 5
	$Log.operan = "log"
	$Kali4.operan = "x"
	$Kali4.number = 4
	
	if spawning == 0:
		spawn = spawn.instance()
		add_child(spawn)
		
		if Global.key == 2:
			spawn.position.x = 887
			spawn.position.y = 955
		
		if Global.key == 3:
			spawn.position.x = 99
			spawn.position.y = 955
		
		if Global.key == 5:
			spawn.position.x = 1213
			spawn.position.y = 955
			
		if Global.key == 6:
			spawn.position.x = 1859
			spawn.position.y = 149
		
		spawning+=1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
