#--------------------------------------------------------
#Grupo Jogos Digitais
#Game David e os 5 Elementos
#--------------------------------------------------------

extends Node2D
var velocity = Vector2()
var speed = 6000

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$David/AnimatedSprite.play("default")
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _process(delta):
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_down"):
		$David/AnimatedSprite.set_flip_h(false)
		velocity.x = speed*delta
		if Input.is_action_pressed("ui_up"):
			$David/AnimatedSprite.play("jump")
		else:
			if ($David/AnimatedSprite.get_animation() == "jump" && $David/AnimatedSprite.get_frame() > 21) || $David/AnimatedSprite.get_animation() != "jump":
				$David/AnimatedSprite.play("walk")
				
		
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_down"):
		$David/AnimatedSprite.set_flip_h(true)
		velocity.x = -speed*delta
		if Input.is_action_pressed("ui_up"):
			$David/AnimatedSprite.play("jump")
		else:
			if ($David/AnimatedSprite.get_animation() == "jump" && $David/AnimatedSprite.get_frame() > 21) || $David/AnimatedSprite.get_animation() != "jump":
				$David/AnimatedSprite.play("walk")
			
	
	if $David.is_on_floor() && Input.is_action_pressed("ui_down"):
		$David/AnimatedSprite.play("down")
		#if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
		#	velocity.x = 0
		
	
	#ACTION JUST RELEASED --------------------------------	
	if Input.is_action_just_released("ui_right") && $David/AnimatedSprite.get_animation() != "down":
		#yield(get_node("David/AnimatedSprite"), "finished")
		$David/AnimatedSprite.play("default")
	
	if Input.is_action_just_released("ui_left") && $David/AnimatedSprite.get_animation() != "down":
		$David/AnimatedSprite.play("default")
	
	if Input.is_action_just_released("ui_down"):
		$David/AnimatedSprite.play("up")
	
	if ($David/AnimatedSprite.get_animation() == "up" && $David/AnimatedSprite.get_frame() > 8):
		$David/AnimatedSprite.play("default")
	#-------------------------------------------------------------
	
	if $David.is_on_floor() && Input.is_action_just_pressed("ui_up"):
		$David/AnimatedSprite.set_frame(0)
		$David/AnimatedSprite.play("jump")
		velocity.y = -98000*delta
	
	
	#VELOCITY CONTROL---------------------------------------------
	velocity = $David.move_and_slide(velocity, Vector2(0,-1))
	velocity.x = 0
	velocity.y += (16000)*delta
	#-------------------------------------------------------------	
	pass




