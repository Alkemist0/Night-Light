extends Area2D

var foundPlayer: bool
var player: Node2D
var startPosition: Vector2

var lerpTime: float

func _ready():
	pass

func _process(delta):
	if(foundPlayer):
		get_parent().position = lerp(startPosition, player.position, lerpTime)
		get_parent().scale = lerp(Vector2(1, 1), Vector2(0, 0), lerpTime)
		get_parent().rotation = lerp_angle(0, 360, lerpTime)
		lerpTime += delta
		if(lerpTime >= 1):
			get_parent().queue_free()

func _on_body_entered(body):
	if(body.is_in_group('player')):
		$'../AnimationPlayer'.play("Fade")
		$'../AbsorbSound'.play()
		$CollisionShape2D.queue_free()
		get_parent().set_script(null)
		player = body
		foundPlayer = true
		startPosition = get_parent().position
