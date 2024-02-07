extends CharacterBody2D

const WALK_FORCE = 600
const WALK_MAX_SPEED = 300
const STOP_FORCE = 1300
const JUMP_SPEED = 400
var window_size


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	window_size = get_viewport_rect()


func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("d") - Input.get_action_strength("a"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	if walk == 0:
		$AnimatedSprite2D.animation = "default"
	else:
		$AnimatedSprite2D.animation = "right"
		$AnimatedSprite2D.flip_h = walk < 0
	
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	move_and_slide()

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("w"):
		velocity.y = -JUMP_SPEED
	
	$AnimatedSprite2D.play()
	if !window_size.has_point(position):
		$"../BugText".show()
		await get_tree().create_timer(2.0).timeout
		get_tree().reload_current_scene()
