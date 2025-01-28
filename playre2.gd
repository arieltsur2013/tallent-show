extends CharacterBody2D
const speed = 1000.0
const jamp_power = -600
const jamp_powerr = 600
@onready var anim = $AnimatedSprite2D
var accelarate = 0.1
var deccelarate = 0.1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 3
var opp = false


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and opp == false:
		velocity.y += jamp_power
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and opp == true:
		velocity.y -= jamp_powerr
		
		
	var diriction = Input.get_axis("ui_left", "ui_right")
	if diriction:
		velocity.x = lerp(velocity.x, speed * diriction, accelarate)
		anim.play("walke")
	else:
		velocity.x = lerp(velocity.x, 0.0, deccelarate)
		anim.stop()
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and opp == true:
		velocity.y -= jamp_power
	if Input.is_action_just_pressed("left_click") and opp == false:
		gravity = gravity - (gravity + gravity)
		opp = true
	if Input.is_action_just_pressed("left_click") and opp == true:
		gravity = gravity - (gravity + gravity)
		opp = false
	move_and_slide()
	if Input.is_action_just_pressed("left_click") and opp == false:
		gravity = gravity - (gravity + gravity)
