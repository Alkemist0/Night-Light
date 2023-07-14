extends Sprite2D

var player: Node2D

@export var bolt: PackedScene
var minTime = 2

var timer = randf_range(0.75, 1.25)
var lerpTimer = 0
var isMoving: bool

var startX: float
var endX: float

func _ready():
	player = get_tree().get_nodes_in_group('player')[0]

func fire():
	var newBolt: Node2D = bolt.instantiate()
	$AttackSound.play()
	newBolt.position = position
	add_sibling(newBolt)

func _process(delta):
	if(timer > 0):
		timer -= delta
	else:
		fire()
		startX = position.x
		endX = player.position.x
		isMoving = true
		timer = randf_range(minTime, minTime + 0.5)
	
	if(lerpTimer > 1):
		fire()
		lerpTimer = 0
		isMoving = false
	elif(isMoving):
		position.x = lerpf(startX, endX, lerpTimer)
		lerpTimer += delta
