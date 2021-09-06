extends Node2D
var spawn = preload ("res://Player/Player.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spawning=0

# Called when the node enters the scene tree for the first time.
func _ready():
	$plus1.operan = "+"
	$plus1.number = 1
	$plus2.operan = "-"
	$plus2.number = 2
	if spawning == 0:
		spawn = spawn.instance()
		add_child(spawn)
		spawn.position = $Spawn.position
		spawning+=1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
