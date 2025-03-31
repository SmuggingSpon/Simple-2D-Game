extends CharacterBody2D
const SPEED = 120.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	if direction < 0:
		animated_sprite_2d.flip_h = true 
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			animated_sprite_2d.play("Run")
		else:
			animated_sprite_2d.play("Jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animated_sprite_2d.play("Idle")
		else:
			animated_sprite_2d.play("Jump")
	move_and_slide()
