extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Anim.play("anim")
	$Score.text = "POINTS: " + str(GAME.score)
	$Hi_score.text = "RECORD: " +  str(GAME.hi_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level.tscn")
