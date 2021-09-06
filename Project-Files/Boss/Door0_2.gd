extends KinematicBody2D

var player = false

func _physics_process(delta):
	if Input.is_action_just_pressed("Use") && player == true:
		$OpenDoor.play("open_door")

	


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		player = true


func _on_Area2D_body_exited(body):
	if "Player" in body.name:
		player = false
		


func _on_OpenDoor_animation_finished(anim_name):
	Global.current_door = 8
	Global.checkpoint = 8
	get_tree().change_scene("res://Levels_Recursed/Level3.tscn")
