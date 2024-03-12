extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 1
const maxSpeed = 100
const minSpeed = -100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func movement():
	if Input.is_action_pressed("w") and ($car/wheel1.angular_velocity < maxSpeed or $car/wheel2.angular_velocity < maxSpeed):
		$car/wheel2.angular_velocity += speed
		$car/wheel1.angular_velocity += speed
	if Input.is_action_pressed("s") and ($car/wheel1.angular_velocity > minSpeed or $car/wheel2.angular_velocity > minSpeed):
		$car/wheel2.angular_velocity += -speed
		$car/wheel1.angular_velocity += -speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#----camera go to player car
	$Camera2D.position = $car.position
	#funcs
	movement()
