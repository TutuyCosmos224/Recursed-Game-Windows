extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity.x = -100
	applied_force.x = -400
	applied_force.y = 0
	gravity_scale = 0
	rotation_degrees = 180
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.rotation_degrees = 0
	$AnimationPlayer.play("Faya")

func _on_Area2D_area_entered(area):
	queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Global.player_health -= 5
