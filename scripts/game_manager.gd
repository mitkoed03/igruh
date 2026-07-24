extends Node

var score = 0

func add_point():
	score += 1
	Event.emit_signal("_change_score",score)
	print(score)

@export var dialogue_resource: DialogueResource

func _ready() -> void:
	DialogueManager.show_dialogue_balloon_scene(preload("res://scenes/myDialogue.tscn"), dialogue_resource, "start")
