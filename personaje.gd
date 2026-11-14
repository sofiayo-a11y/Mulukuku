extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	# Capturamos el movimiento usando directamente las flechas y WASD
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_RIGHT):
		direction.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_LEFT):
		direction.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_DOWN):
		direction.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_UP):
		direction.y -= 1
	
	# Si se presiona más de una dirección (diagonal), normalizamos para que vaya a velocidad constante
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)

	move_and_slide()
