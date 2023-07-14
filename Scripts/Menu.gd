extends Control

@export var gameScene: String

func _ready():
	pass

func _process(_delta):
	pass

func _on_start_button_pressed():
	ScreenFade.fadeOut(gameScene)

func _on_credits_button_pressed():
	$Credits/AnimationPlayer.play('Credits')

func _on_back_button_pressed():
	$Credits/AnimationPlayer.play_backwards("Credits")
