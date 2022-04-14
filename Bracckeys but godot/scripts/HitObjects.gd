extends KinematicBody

var velocity : Vector3 = Vector3()

func _physics_process(delta):
	velocity.z = Global.ObjSpeed
	move_and_slide(velocity)

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://scenes/Ui.tscn")
		Global.score = 0
