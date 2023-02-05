extends Area2D

var cont
var timer_time

var enemy1 = preload("res://Bodies/stone.tscn")
var enemy2 = preload("res://Bodies/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	release()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func release():
	var mob = enemy1.instantiate()
	mob.position = position
	get_parent().add_child.call_deferred(mob)
	
func release2():
	var mob = enemy2.instantiate()
	mob.position.x = position.x
	mob.position.y = position.y - 50
	get_parent().add_child.call_deferred(mob)

func _on_timer_timeout():
	cont = randi() % 20 + 0
	if cont <= 10:
		release()
	else:
		release2()

	timer_time = randf_range(1,1.4)
	$timer.wait_time = timer_time
