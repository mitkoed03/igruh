extends Control

@onready var label: Label = $MarginContainer/Label

func _ready() -> void:
	Event._change_score.connect(_on_change_score)

func _on_change_score(score):
	label.text = "Score: " + str(score)
