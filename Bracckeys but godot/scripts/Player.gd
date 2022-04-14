extends KinematicBody

var velocity : Vector3 = Vector3()
export var speed : int = 15
var CanMove : bool = false

func _ready():
	Global.player = self


func _physics_process(delta):
		if Input.is_action_pressed("left"):
			velocity.x = -speed
		elif Input.is_action_pressed("right"):
			velocity.x = speed
		else:
			velocity.x = 0
		move_and_slide(velocity)


func _on_Area_body_entered(body):
	if body.is_in_group("HitObjects"):
		Global.score += 1
