extends Node2D
var spawn = preload ("res://Player/Player.tscn")
signal play_music
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spawning=0

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalMusic.play = true
	$plus1.operan = "+"
	$plus1.number = 1
	if spawning == 0:
		spawn = spawn.instance()
		add_child(spawn)
		
		if Global.key == 0:
			spawn.position.x = 106
			spawn.position.y = 931
			
		if Global.key == 1:
			spawn.position.x = 178
			spawn.position.y = 323
		spawning+=1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
