extends CanvasLayer

var can_pause : bool = true
onready var MainMenu : Control = $Control
onready var ScoreLabel = $ScoreLabel
onready var PlayBtn : Button = $Control/VBoxContainer/Play
onready var QuitBtn : Button = $Control/VBoxContainer/Quit
onready var GameName : Label = $Control/NameLabel
onready var tween : Tween = $Tween
onready var ChooseUi = $ChooseMode
var TweenTime  : float = .8

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
	tween.interpolate_property(PlayBtn, "rect_position:x", 0, 1000, TweenTime, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	
	tween.interpolate_property(QuitBtn, "rect_position:x", 0, -1000, TweenTime, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	
	tween.interpolate_property(GameName, "rect_position:y", 0, -1000, TweenTime, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	
	tween.start()
	
	yield(get_tree().create_timer(.4), "timeout")
	
	ChooseUi.visible = true
	
	tween.interpolate_property(ChooseUi,"rect_position:y", -900, 280, TweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	tween.start()
	
	
func _on_Quit_pressed():
	get_tree().quit()

func start_game():
	if get_tree().paused:
		resume()
		MainMenu.visible = false
		
		tween.interpolate_property(ScoreLabel, "rect_position:x", -500, 16, .5, Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
		
		tween.start()
	

func _on_EASY_pressed():
	start_game()
	Global.SpawnTimer = 1
	
	ChooseUi.visible = false
	
	tween.interpolate_property(ChooseUi,"rect_position:y", 280, -900, TweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

func _on_EXPERT_pressed():
	start_game()
	Global.SpawnTimer = .7

	ChooseUi.visible = false
	
	tween.interpolate_property(ChooseUi,"rect_position:y", 280, -900, TweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

func _on_HARD_pressed():
	start_game()
	Global.SpawnTimer = .4
	Global.ObjSpeed = 100

	ChooseUi.visible = false
	
	tween.interpolate_property(ChooseUi,"rect_position:y", 280, -900, TweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	
	
	
	
	
	
