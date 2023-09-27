extends CharacterBody2D

const SPEED = 200
const JUMP_VELOCITY = -400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity*delta
		$AnimatedSprite2D.play("jump")
		
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		if is_on_floor():
			$AnimatedSprite2D.play("walk")
	elif is_on_floor():
		$AnimatedSprite2D.play("default")
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	#position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)

