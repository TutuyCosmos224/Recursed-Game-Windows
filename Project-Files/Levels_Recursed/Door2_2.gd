extends KinematicBody2D

var player = false
var door_matcher = Global.current_door

func _physics_process(delta):
	if Input.is_action_just_pressed("Use") && player == true && door_matcher == Global.key:
		$OpenDoor.play("open_door")


	


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		player = true


func _on_Area2D_body_exited(body):
	if "Player" in body.name:
		player = false
		


func _on_OpenDoor_animation_finished(anim_name):
	Global.current_door = 1
	Global.checkpoint = 1
	get_tree().change_scene("res://Levels_Recursed/Level1.tscn")
