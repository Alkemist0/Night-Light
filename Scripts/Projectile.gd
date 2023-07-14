extends RigidBody2D

@export var soundLength: float

func _ready():
	pass

func _process(_delta):
	pass

func _on_body_entered(body):
	$CollisionShape2D.queue_free()
	$Sprite2D.queue_free()
	$AnimationPlayer.queue_free()
	$HitSound.play()
	if(body.is_in_group('player')):
		body.set_script(null)
		ScreenFade.fadeOut('res://Scenes/fail.tscn')
	await get_tree().create_timer(soundLength).timeout
	queue_free()
