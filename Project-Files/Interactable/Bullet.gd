extends RigidBody2D


func _ready():
	$Timer.start()
	if Global.player_health < 20:
		$AnimationPlayer.play("Shoot2")
		print(Global.player_health)
	elif Global.player_health >= 20:
		$AnimationPlayer.play("Shoot")


func _on_Timer_timeout():
	queue_free()
