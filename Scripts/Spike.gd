extends Sprite2D

var player: Node2D

func _ready():
	player = get_tree().get_nodes_in_group('player')[0]

func _on_area_2d_body_entered(body):
	if(body == player):
		$AttackSound.play()
		player.set_script(null)
		ScreenFade.fadeOut('res://Scenes/fail.tscn')
