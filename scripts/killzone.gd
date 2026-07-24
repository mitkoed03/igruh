extends Area2D

@onready var timer: Timer = $Timer
@onready var hitbox: CollisionShape2D = $CollisionShape2D

func _process(delta: float) -> void:
	hitbox.position.x += delta * 4

func _on_body_entered(body: Node2D) -> void:
	print("Dead!")
	timer.start()
	Event.has_died.emit()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
