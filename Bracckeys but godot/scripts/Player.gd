extends KinematicBody

var velocity = Vector3()
export var speed = 15

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x = 0
	move_and_slide(velocity)