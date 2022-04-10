extends Control

func _readY():
	pass


func _on_Retry_pressed():
	get_tree().change_scene("res://scenes/World.tscn")


func _on_Quit_pressed():
	get_tree().quit()
