extends KinematicBody
var direction
var velocity = Vector3()

const FLY_SPEED = 6
const FLY_ACCEL = 3
const MOUSE_SENSE = 0.2

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		var modifier = 1
		
		if Input.is_action_pressed("shift"):
			modifier = 3  
		
		self.rotation.x -= deg2rad(event.relative.y * MOUSE_SENSE)
		self.rotation.y -= deg2rad(event.relative.x * MOUSE_SENSE)

func _physics_process(delta):
		#reset the direction of the player 
	direction = Vector3()
	#get the rotation of the camera
	var aim = get_global_transform().basis
	
	#check input and change direction 
	if Input.is_action_pressed("ui_up"):
		direction -= aim.z
	if Input.is_action_pressed("ui_down"):
		direction += aim.z
	if Input.is_action_pressed("ui_left"):
		direction -= aim.x
	if Input.is_action_pressed("ui_right"):
		direction += aim.x
	
	direction = direction.normalized()
	
	#max speed of player
	var target = direction * FLY_SPEED
	
	
	#calculate a portion of the distance  to go
	velocity = velocity.linear_interpolate(target,FLY_ACCEL * delta)
	
	
	#move
	move_and_slide(velocity)
