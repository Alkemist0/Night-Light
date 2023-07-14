extends CharacterBody2D

const SPEED = 128.0
const JUMP_VELOCITY = -216

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 0.7

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if(Input.is_action_just_pressed("up") and is_on_floor()):
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$AnimationPlayer.play("Player_Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimationPlayer.play("Player_Idle")
	
	if(direction > 0):
		$CollisionShape2D.position.x = -3.5
		$Sprite2D.flip_h = false
	elif(direction < 0):
		$CollisionShape2D.position.x = 3.5
		$Sprite2D.flip_h = true

	move_and_slide()
