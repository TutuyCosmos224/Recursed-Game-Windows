extends KinematicBody2D

var movement = Vector2()
onready var bullet = preload("res://Interactable/Bullet.tscn")
var bullet_speed = 700
var speed = 50
var current_position = Vector2()
var player_range = false
var direction = Vector2()

func _ready():
	pass



func _physics_process(delta):
	
	var player = get_parent().get_node("Player")
	position += (((player.position - position)/speed))
	current_position = player.position.x - position.x
	
	
	if current_position > 0 && player_range == false:
		$AnimationPlayer.play("WalkRight")
	elif current_position <= 0 && player_range == false:
		$AnimationPlayer.play("WalkLeft")
		
	move_and_collide(movement)
	
	if Input.is_action_just_pressed("Fire"):
		
		$Shoot.playing = true
		fire()

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rad2deg(get_angle_to(get_global_mouse_position()))
	bullet_instance.apply_impulse(Vector2(),(get_global_mouse_position() - get_global_position()).normalized()*bullet_speed)
	get_tree().get_root().call_deferred("add_child",bullet_instance)


func _on_Hitbox_body_entered(body):
	pass


func _on_PlayerDetection_body_entered(body):
	if "Player" in body.name:
		player_range = true
		speed = 5000
		if current_position > 0:
			$AnimationPlayer.play("IdleRight")
		elif current_position <= 0:
			$AnimationPlayer.play("IdleLeft")


func _on_PlayerDetection_body_exited(body):
	if "Player" in body.name:
		player_range = false
		speed = 50
