extends Node

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Hi_score.text = "HI_SCORE: " + str(GAME.hi_score)
	$Score.text = "POINTS: " + str(score)
	GAME.speed_factor = 1
	$Parallax.play("Parallax")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_speed_timer_timeout():
	if GAME.speed_factor < 2.2:
		GAME.speed_factor += 0.1*GAME.speed_factor
		$Parallax.speed_scale = GAME.speed_factor



func _on_score_timer_timeout():
	score += 10 
	$Score.text = "POINTS: " + str(score)
	if score >= GAME.hi_score:
		GAME.hi_score = score
		$Hi_score.text = "HI_SCORE: " + str(GAME.hi_score)
