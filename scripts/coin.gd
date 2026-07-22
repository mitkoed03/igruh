extends Area2D

@onready var game_manager: Node = %GameManager
@onready var sfx: AudioStreamPlayer2D = $SFX
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	collision_shape_2d.set_deferred("disabled", true)
	game_manager.add_point()
	visible = false
	sfx.play()

func _on_sfx_finished() -> void:
	queue_free()
