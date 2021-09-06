extends KinematicBody2D

var reversecon = 0
var reverse = false
var movement = Vector2()
var speed = 100
var damage = false

func _physics_process(delta):
	
	if reverse == false:
		movement.x += 1
	else:
		movement.x -= 1

	movement = movement.normalized()
	move_and_slide(movement*speed)
	
	
func _on_DetectionAndHitbox_body_entered(body):
	if "Player" in body.name:
		damage = true
		Global.player_health -= 20
		$Timer.start()
		
	if "Map" in body.name:
		reversecon += 1
		if reversecon %2 == 1:
			reverse = true 
		else:
			reverse = false


func _on_Timer_timeout():
	if damage == true:
		Global.player_health -= 20



func _on_DetectionAndHitbox_body_exited(body):
	if "Player" in body.name:
		damage = false
