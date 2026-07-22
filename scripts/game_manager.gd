extends Node

var score = 0

func add_point():
	score += 1
	Event.emit_signal("_change_score",score)
	print(score)
