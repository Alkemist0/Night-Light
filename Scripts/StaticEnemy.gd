extends Sprite2D

var player: Node2D

@export var bolt: PackedScene
@export var minTime: float
@export var fireAnim: bool

var timer = randf_range(0.75, 1.25)

func _ready():
	player = get_tree().get_nodes_in_group('player')[0]

func fire():
	var newBolt: Node2D = bolt.instantiate()
	$AttackSound.play()
	newBolt.position = position
	add_sibling(newBolt)
	newBolt.apply_central_impulse((player.position - position).normalized() * 100)
	newBolt.rotation = newBolt.position.angle_to_point(player.position)
	$AnimationPlayer.play('Idle')

func _process(delta):
	if(timer > 0):
		timer -= delta
	else:
		if(fireAnim):
			$AnimationPlayer.play('Fire')
		else:
			fire()
		timer = randf_range(minTime, minTime + 0.5)
	
	if(player.position.x > position.x):
		flip_h = false
	else:
		flip_h = true
