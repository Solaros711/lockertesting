extends CharacterBody3D

const SENSITIVITY = 0.01
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var gravity = 9.81

@onready var head = $head
@onready var camera = $head/Camera3D
@onready var cursor_pos = camera.get_viewport().get_mouse_position()

func _ready():
	# Hides mouse within game window, and keeps cursor 'locked' in the middle of the screen so that camera can continuously rotate.
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED

# Handles Camera rotation relative to mouse movement.
func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))
		Input.warp_mouse(cursor_pos)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		print(velocity.y)

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		# Stops the player sooner if on ground.
		if is_on_floor():
			var des_rate = SPEED * 0.08
			velocity.x = move_toward(velocity.x, 0, des_rate)
			velocity.z = move_toward(velocity.z, 0, des_rate)
		# Preserves inertia a bit longer if in air.
		else:
			var des_rate = SPEED * 0.02
			velocity.x = move_toward(velocity.x, 0, des_rate)
			velocity.z = move_toward(velocity.z, 0, des_rate)

	move_and_slide()
