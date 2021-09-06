extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Polygon.scale.y = 0

	print($Polygon.scale.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Polygon.scale.y *= 1.05
	if $Polygon.scale.y >= 0.7:
		$Polygon/CollisionPolygon2D.polygon = $Polygon.polygon
		$Polygon/Area2D/CollisionPolygon2D.polygon = $Polygon/CollisionPolygon2D.polygon
	if $Polygon.scale.y >=1:
		queue_free()
		
	rotation_degrees -= 0.1


#func _on_Area2D_body_entered(body):
##	if body.name == "Player":
#		Global.player_health -= 20


func _on_Laser_area_entered(area):
	if area.name == "Hitbox":
		Global.player_health -= 30
