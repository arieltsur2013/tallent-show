extends Area2D
@onready var gamemaneger: Node = %gamemaneger




func _on_body_entered(body: Node2D) -> void:
	%gamemaneger.add_point()
	queue_free()
