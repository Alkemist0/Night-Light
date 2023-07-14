extends Sprite2D

var rotateTimer: float

func _ready():
	pass

func _process(delta):
	if(rotateTimer > 0):
		rotateTimer -= delta
	else:
		rotate(randi_range(1, 4) * 0.5 * PI)
		frame = randi_range(0, 2)
		rotateTimer = randf_range(0.5, 1)
