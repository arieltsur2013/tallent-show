extends RayCast2D

@onready var ray := $"."
@onready var playre := $"../.."
@onready var rope := $"../Line2D"
@export var rest_length = 2.0
@export var stiffnes = 10.0
@export var damping = 2.0

var lanchd = false
var target: Vector2

func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		lunch()
	if Input.is_action_just_released("left_click"):
		retract()
	if lanchd:
		handle_grapple(delta)

func lunch():
	ray.look_at(get_global_mouse_position())
	if ray.is_colliding():
		lanchd = true
		target = ray.get_collision_point()
		rope.show()
		
func retract ():
	lanchd = false
	rope.hide()

func handle_grapple(delta):
	var target_dir = playre.global_position.direction_to(target)
	var target_dist = playre.global_position.distance_to(target)
	
	var displastment = target_dist - rest_length
	
	var force = Vector2.ZERO
	
	if displastment > 0:
		var spring_force_magnetium = stiffnes * displastment
		var spring_force = target_dir * spring_force_magnetium
		
		var vel_dot = playre.velocity.dot(target_dir)
		var damping = -damping * vel_dot * target_dir
		
		force = spring_force + damping
	playre.velocity += force * delta
	update_rope()
	
func update_rope():
	rope.set_point_position(1, to_local(target))
