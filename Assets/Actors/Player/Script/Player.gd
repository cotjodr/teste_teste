extends Actor

onready var Helicopter = $Helicopter
onready var Gancho = $Gancho


var vel = Vector2.ZERO
var motion = Vector2()

func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)

func _physics_process(delta):
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_up"): 
		direction += Vector2(0, -1)
		Helicopter.animation = "back_left"
		
	if Input.is_action_pressed("ui_down"): 
		direction += Vector2(0, 1)
		Helicopter.animation = "front_right"
		
		
	if Input.is_action_pressed("ui_left"): 
		direction += Vector2(-1, 0)
		Helicopter.animation = "back_right"
		
	if Input.is_action_pressed("ui_right"): 
		direction += Vector2(1, 0)
		Helicopter.animation = "front_left"
	
	if Input.is_action_pressed("ui_select"): 
		Gancho.animation = "Gancho_on"
	else:
		Gancho.animation = "Gancho_idle"
	
	motion = direction
	motion = cartesian_to_isometric(motion)
	
	move_and_collide(motion)
