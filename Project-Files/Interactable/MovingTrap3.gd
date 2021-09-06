extends KinematicBody2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_Detection_body_entered(body):
	if "Player" in body.name:
		Global.player_health -= 20
	pass # Replace with function body.


func _on_Detection_area_shape_entered(area_id, area, area_shape, local_shape):
	if "Edge" in area.name:
		pass
	pass # Replace with function body.
