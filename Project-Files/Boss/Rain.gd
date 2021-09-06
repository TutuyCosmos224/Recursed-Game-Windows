extends RigidBody2D
signal hit
func _ready():
	applied_force.x = 0
	applied_force.y = 1500

func _process(delta):
	if get_colliding_bodies() != []:
		pass






func _on_Area2D_area_entered(area):

	if "Player" in area.name:
		Global.player_health -= 5
		queue_free()

func _on_Timer_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if "Map" in body.name:
		queue_free()
	
