extends KinematicBody2D

onready var dash = $Dash

export var key_value : float = 0

var gravity = 700
var gravity_ground = gravity
var walkspeed = 500
var constWS = walkspeed
export var pound = 4
var jump_power = -1000
var movement = Vector2()
var on_ground = false
var jump_count = 0


var dashspeed = 1500
var dashright = false
var dashleft = false
var dashduration = 0.1
var dashcooldown = true
var dashmode = false
var direction = Vector2()

var climb = false
var climbspeed = 100
var climbanimation=1


func _ready():
	$Dash/ClimbAnimation.start()
	$CanvasLayer/Menu.visible = false
	
func _physics_process(delta):
	pass


func _process(delta):
	get_node("CanvasLayer/HealthBar/Health").set_current(Global.player_health)
	if is_on_floor():
		on_ground = true
		jump_count = 0
	else:
		on_ground = false
		if movement.y < 0:
			var jump
		else:
			var fall
			
	if Global.player_health <= 0:
		Global.player_health = 100
		load_checkpoint(Global.checkpoint)
#	
	if Input.is_action_just_pressed("Respawn"):
		Global.player_health = 100
		load_checkpoint(Global.checkpoint)
		

	
	
	CheckClimbables()
	
		
		
	if Input.is_action_just_pressed("Right"):
		if dashright == true && dashcooldown == true:
			$Dash/DashCooldown.start()
			dashmode = true
			dashcooldown = false
			gravity = 0
			movement.y = 0
			$Dash/DashTimer.start()
			$MovementAnimation.play("DashRight")
			walkspeed = dashspeed 
	
	
	if Input.is_action_just_pressed("Left"):
		if dashleft == true && dashcooldown == true:
			$Dash/DashCooldown.start()
			dashmode = true
			dashcooldown = false
			gravity = 0
			movement.y = 0
			$Dash/DashTimer.start()
			$MovementAnimation.play("DashLeft")
			walkspeed = dashspeed 
			
		
	if Input.is_action_just_released("Right"):
		dashright = true
		$Dash/DoubleClick.start()
	if Input.is_action_just_released("Left"):
		dashleft = true
		$Dash/DoubleClick.start()
	
	if Input.is_action_pressed("Right"):
		
		movement.x = walkspeed
		if on_ground == true && dashmode == false && climb == false:
			$MovementAnimation.play("WalkRight")
			direction = Vector2.RIGHT
	
	elif Input.is_action_pressed("Left"):
		movement.x = -walkspeed
		if on_ground == true && dashmode == false && climb == false:
			$MovementAnimation.play("WalkLeft")
			direction = Vector2.LEFT
	else:
		movement.x=0
		$MovementAnimation.stop(true)


	if Input.is_action_just_pressed("Jump")&& climb== false:
		
		if on_ground==true:
			
			on_ground= false
			
		if jump_count <2:
			if direction == Vector2.RIGHT:
				if jump_count == 1:
					$MovementAnimation.play("JumpRight1")
					
				else:
					$MovementAnimation.play("JumpRight")
				
			elif direction == Vector2.LEFT:
				if jump_count == 1:
					$MovementAnimation.play("JumpLeft1")
					
				else:
					$MovementAnimation.play("JumpLeft")
			jump_count += 1
			movement.y= jump_power
			$Audio/JumpSound .playing = true
			on_ground= false
	
	if Global.player_health == 0:
		$MovementAnimation.play("Dying")
	
			
	if climb == false && dashmode == false:
		movement.y +=  gravity*delta*pound
		
	movement = move_and_slide(movement, Vector2.UP)
	
	

func CheckClimbables():
	if climb == true:
		jump_count = 0
		movement.y=0
		if Input.is_action_pressed("Jump"):
			
			if climbanimation == 1:
				$Sprite.set_frame(4)
				
				
			elif climbanimation == 2:
				$Sprite.set_frame(9)
				
			
			movement.y -= climbspeed
			
		elif Input.is_action_pressed("Down"):
			if climbanimation == 1:
				$Sprite.set_frame(4)
				
				
			elif climbanimation == 2:
				$Sprite.set_frame(9)
			movement.y += climbspeed
			
		

func _on_DoubleClick_timeout():
	dashright = false
	dashleft = false

func _on_DashTimer_timeout():
	walkspeed = constWS
	dashmode = false
	gravity = 700
	
func _on_DashCooldown_timeout():
	dashcooldown= true


func _on_Hitbox_area_entered(area):
	if "Ladder" in area.name:
		climb = true
		on_ground = false
	
		
		
		
func _on_Hitbox_area_exited(area):
	if "Ladder" in area.name:
		climb = false
		on_ground = true
		


func _on_Hitbox_body_entered(body):
	if "Laser" in body.name:
		Global.player_health -= 30
	if "Rain" in body.name:
		Global.player_health -= 5
	if "EnemyGhost" in body.name:
		Global.player_health -= 10
	

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$CanvasLayer/Menu.visible = not $CanvasLayer/Menu.visible 

func _on_ClimbAnimation_timeout():
	print(climbanimation)
	if climbanimation ==1:
		
		climbanimation+=1
	elif climbanimation ==2:
		climbanimation-=1
		
func load_checkpoint(last):
	Global.key = last
	if last == 0:
		get_tree().change_scene("res://Levels_Recursed/Level0.tscn")
	if last == 1:
		get_tree().change_scene("res://Levels_Recursed/Level1.tscn")
	if last == 2:
		get_tree().change_scene("res://Levels_Recursed/Level2.tscn")
	if last == 3:
		get_tree().change_scene("res://Levels_Recursed/Level3.tscn")
	if last == 4:
		get_tree().change_scene("res://Levels_Recursed/Level3.tscn")
	if last == 5:
		get_tree().change_scene("res://Levels_Recursed/Level2.tscn")
	if last == 6:
		get_tree().change_scene("res://Levels_Recursed/Level1.tscn")
	if last == 7:
		get_tree().change_scene("res://Levels_Recursed/Level4.tscn")
	if last == 8:
		get_tree().change_scene("res://Levels_Recursed/Level3.tscn")
	if last == 9:
		get_tree().change_scene("res://Boss/Boss Area.tscn")
