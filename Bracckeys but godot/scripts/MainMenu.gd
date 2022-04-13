extends CanvasLayer

var can_pause : bool = true
onready var MainMenu : Control = $Control
onready var ScoreLabel : Label = $Control/Label
onready var PlayBtn = $Control/VBoxContainer/Play

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
	$Tween.interpolate_property(PlayBtn, "position", Vector2(0,0), Vector2(0, 1000), .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
	yield(get_tree().create_timer(1), "timeout")
	if get_tree().paused:

		MainMenu.visible = false
		ScoreLabel.visible = true
		
func _on_Quit_pressed():
	get_tree().quit()

