extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -350.0

enum{dead,alive}
var status = alive

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$anim.play("skating")
	$shape.disabled = false
	$shape2.disabled = true



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	jump()
#	get_down()
	
	move_and_slide()

func jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and status == alive:
		$Jump.play()
		velocity.y = JUMP_VELOCITY
		$anim.play("jumping")
		await get_tree().create_timer(.6).timeout
		if status == alive:
			$anim.play("skating")


func get_down():
	
	if Input.is_action_pressed("ui_down") and is_on_floor() and status == alive:
		$shape.disabled = true
		$shape2.disabled = false
	if Input.is_action_just_released("ui_down") and is_on_floor():
		$shape.disabled = false
		$shape2.disabled = true
		
		
func play_dead():
	status = dead
	$Die.play()
	remove_from_group("Player")
	$anim.play("dead")
	await get_tree().create_timer(1).timeout
	go_to_endscreen()

func play_dead2():
	status = dead
	$Die.play()
	remove_from_group("Player")
	$anim.play("dead2")
	await get_tree().create_timer(1).timeout
	go_to_endscreen()


func go_to_endscreen():
	if GAME.score <= 500:
		get_tree().change_scene_to_file("res://Scenes/end_1.tscn")
	elif GAME.score > 500 and GAME.score <= 2000:
		get_tree().change_scene_to_file("res://Scenes/end_2.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/end_3.tscn")
