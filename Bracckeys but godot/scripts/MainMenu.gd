extends CanvasLayer

var can_pause : bool = true
onready var MainMenu : Control = $Control
onready var ScoreLabel : Label = $Control/Label
onready var PlayBtn : Button = $Control/VBoxContainer/Play
onready var QuitBtn : Button = $Control/VBoxContainer/Quit

func _ready():
	pause()

func _process(delta):
		ScoreLabel.text = "Score: " + str(Global.score)

func pause():
	if can_pause:
		get_tree().set_deferred("paused", true)

func resume():
	if can_pause:
		get_tree().set_deferred("paused", false)

func _on_Play_pressed():
	$Tween.interpolate_property(PlayBtn, "rect_position:x", 0, 1000, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	$Tween.interpolate_property(QuitBtn, "rect_position:x", 0, -1000, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	
	$Tween.start()
	
	yield(get_tree().create_timer(1), "timeout")
	
	if get_tree().paused:
		MainMenu.visible = false
		ScoreLabel.visible = true
		resume()
	else:
		ScoreLabel.visible = false







func _on_Quit_pressed():
	get_tree().quit()

