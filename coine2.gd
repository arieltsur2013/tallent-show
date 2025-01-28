extends Area2D
@onready var gameman: Node = %gameman



func _on_body_entered(body: Node2D) -> void:
	%gameman.add_point()
	queue_free()
