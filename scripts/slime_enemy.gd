extends Node2D

const SPEED = 60
const FLIP_VECTOR2 = Vector2(-1,1)
@onready var ray_cast_2d: RayCast2D = $RayCast2D

var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction * SPEED * delta
	
	if(ray_cast_2d.is_colliding()):
		direction *= -1
		scale.x *= -1
