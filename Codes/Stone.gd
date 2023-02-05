extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

func _ready():
	if has_node("Animation"):
		$Animation.play("anim")

func _physics_process(delta):
	velocity.x = -1 * SPEED * GAME.speed_factor
	move_and_slide()
	


func _on_hitbox_body_entered(body):
	if body.is_in_group("Player") and is_in_group("Ground"):
		body.play_dead()
		queue_free()

	elif body.is_in_group("Player") and is_in_group("Air"):
		body.play_dead2()
		queue_free()
