extends Node
@onready var label: Label = $Label

var score = 0
func add_point():
	score += 1
	label.text = "you collected " + str(score) + " coines."
func _physics_process(delta: float) -> void:
	if score == 7:
		label.text = "you collected all 7 coins!! you must be a prety good strateflayer"
