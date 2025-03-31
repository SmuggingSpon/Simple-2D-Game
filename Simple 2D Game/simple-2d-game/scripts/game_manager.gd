extends Node
var score = 0
@onready var score_label: Label = $"Score Label"
func add_score() -> void:
	score += 1
	score_label.text = "You have collected " + str(score) + " coins."
