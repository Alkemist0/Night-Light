extends Sprite2D

func _ready():
	pass

func _process(_delta):
	pass

func fadeOut(scene: String):
	$AnimationPlayer.play_backwards("ScreenFade")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file(scene)
	$AnimationPlayer.play("ScreenFade")

