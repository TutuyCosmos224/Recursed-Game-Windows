extends KinematicBody2D

var movement = Vector2()
var current_position = Vector2()
var speed = 2
var health = 600
var die = false


func _physics_process(delta):
	
	var player = get_parent().get_node("Player")
	position += (((player.position - position)/50).normalized() * speed )
	
	current_position = player.position.x - position.x
	
	if current_position > 0 && die ==false:
		$AnimationPlayer.play("WalkRight")
	elif current_position <= 0 && die == false:
		$AnimationPlayer.play("WalkLeft")
		
		
	
	move_and_collide(movement)


func _on_Hitbox_body_entered(body):
	if "Player" in body.name:
		die = true
		Global.player_health -= 10
		$Death.playing = true
		$AnimationPlayer.stop(true)
		$AnimationPlayer.play("Dying")
		
		
		
		


func _on_AnimationPlayer_animation_finished(anim_name):
	if "Dying" in anim_name:
		queue_free()


func _on_Hitbox_area_entered(area):
	if "Bullet" in area.name:
		if Global.player_health < 20:
			health -= 300
		else:
			health -= 100
		if health == 0:
			$Death.playing = true
			die = true
			$AnimationPlayer.stop(true)
			$AnimationPlayer.play("Dying")
			speed = 0
			
		
		print(health)
