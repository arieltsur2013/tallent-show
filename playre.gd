extends CharacterBody2D
@export var speed = 1300.0
@export var jamp_power = -1600
@onready var anim = $AnimatedSprite2D
@onready var cd = $Node2D
var accelarate = 0.1
var deccelarate = 0.1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 2


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("ui_up") and (is_on_floor() or $Node2D/RayCast2D.lanchd):
		velocity.y += jamp_power
		$Node2D/RayCast2D.retract()
		
		
	var diriction = Input.get_axis("ui_left", "ui_right")
	if diriction:
		velocity.x = lerp(velocity.x, speed * diriction, accelarate)
		anim.play("walke")
	else:
		velocity.x = lerp(velocity.x, 0.0, deccelarate)
		anim.stop()
	move_and_slide()
