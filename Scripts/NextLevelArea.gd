extends Area2D

@export var scene: String

func _ready():
	pass

func _process(_delta):
	pass


func _on_body_entered(body):
	if(body.is_in_group('player')):
		ScreenFade.fadeOut(scene)
