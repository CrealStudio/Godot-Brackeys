extends KinematicBody

var velocity : Vector3 = Vector3()
var speed = 30

func _physics_process(delta):
	velocity.z = speed
	randomize()
	
	move_and_slide(velocity)


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		print("enter")
		get_tree().change_scene("res://scenes/Ui.tscn")
