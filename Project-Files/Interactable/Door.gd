extends KinematicBody2D

var player = false

func _physics_process(delta):
	if Input.is_action_just_pressed("Use") && player == true:
		$AnimationPlayer.play("OpenDoor")





func _on_AnimationPlayer_animation_finished(anim_name):
	if "OpenDoor" in anim_name:
		#change scene
		pass
	


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		player = true

			
			


func _on_Area2D_body_exited(body):
	if "Player" in body.name:
		player = false
	
