extends Node2D
var mydelta = 0
var index = 0 # 0: MEMNU | 1: HOW TO PLAY | 2: CREDITS
var animacao = ""
var nova_anim = ""

func _ready():
	set_physics_process(true)
	pass
	
func _physics_process(delta):
	mydelta=delta
	pass

func _process(delta):
	
	if $Play.pressed:
		get_tree().change_scene("stage_fire.tscn")
	
	if index == 0:
		nova_anim = "back_right"
			
	if index == 1:
		nova_anim = "right"
		
		#if $Camera.position.x != 1920:
		#	$Camera.move_local_x(1920*mydelta)
	
	if animacao != nova_anim:
		get_node("AnimationPlayer").play(nova_anim, -1, 3, false)
		animacao = nova_anim
		
	if $Exit.pressed:
		get_tree().quit()

	pass


func _on_How_button_up():
	index = 1
	pass # replace with function body


func _on_Backfromhow_button_up():
	index = 0
	pass # replace with function body
