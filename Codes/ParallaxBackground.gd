extends ParallaxBackground

@export var speed = 1000

func _ready():
	pass

func _process(delta):
	scroll_offset.x -= speed*delta
