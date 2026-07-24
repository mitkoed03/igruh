extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var rewind_duration: float = 2.0
var rewinding: bool = false
var rewind_values = {
	"pos": [],
	"vel": []
}

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func rewind(delta: float) -> void:
	var pos = rewind_values["pos"].pop_back()
	
	if rewind_values["pos"].is_empty():
		rewinding = false
		velocity = rewind_values["vel"][0]
		return
	
	position = pos
	rewind_values["pos"].pop_back()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("rewind") and not rewinding:
		rewinding = true
		print("veler")

func _physics_process(delta: float) -> void:
	if rewinding:
		animated_sprite_2d.play("rewind")
		rewind(delta)
		return
	else:
		rewind_values["pos"].append(position)
		rewind_values["vel"].append(velocity)
		
		if rewind_duration * Engine.physics_ticks_per_second == rewind_values["pos"].size():
			rewind_values["pos"].pop_front()
			rewind_values["pos"].pop_front()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	# flipping the sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	#animation manager	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run") 
	else:
		animated_sprite_2d.play("jump")
	
	# applying the movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
