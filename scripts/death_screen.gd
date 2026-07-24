extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var canvas_modulate: CanvasModulate = $CanvasModulate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Event.has_died.connect(_on_death)
	animation_player.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_death() -> void:
	animation_player.play("dead")
