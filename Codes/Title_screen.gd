extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Anim.play("anim")
	await get_tree().create_timer(2.4).timeout
	$Anim.play("anim2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Instructions.tscn")
