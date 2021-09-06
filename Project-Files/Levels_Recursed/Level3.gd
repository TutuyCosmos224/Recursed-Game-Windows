extends Node2D
var spawn = preload ("res://Player/Player.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spawning=0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Kali6.operan = "x"
	$Kali6.number = 6
	$Plus5.operan = "+"
	$Plus5.number = 5
	$Bagi5.operan = "/"
	$Bagi5.number = 5
	$Kali5.operan = "x"
	$Kali5.number = 5
	$Plus4.operan = "+"
	$Plus4.number = 4
	$Plus3.operan = "+"
	$Plus3.number = 3
	$Bagi9.operan = "/"
	$Bagi9.number = 9
	$Kali4.operan = "x"
	$Kali4.number = 4
	$Plus2.operan = "+"
	$Plus2.number = 2
	$Kali0.operan = "x"
	$Kali0.number = 0
	
	if spawning == 0:
		spawn = spawn.instance()
		add_child(spawn)
		
		if Global.key == 3:
			spawn.position.x = 83
			spawn.position.y = 955
		
		if Global.key == 4 and Global.checkpoint == 3:
			spawn.position.x = 447
			spawn.position.y = 955
			
		if Global.key == 4 and Global.checkpoint == 4:
			spawn.position.x = 1825
			spawn.position.y = 194
			
		if Global.key == 5:
			spawn.position.x = 659
			spawn.position.y = 955
			
		if Global.key == 8:
			spawn.position.x = 1861
			spawn.position.y = 955
		
		if Global.current_door == 8:
			spawn.position.x = 1223
			spawn.position.y = 955
		
		spawning+=1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
