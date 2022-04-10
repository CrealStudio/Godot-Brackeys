extends Spatial

export (PackedScene) var HitObjects

onready var spawn1 : Node = $SpawnPoints/P1
onready var spawn2 : Node = $SpawnPoints/P2
onready var spawn3 : Node = $SpawnPoints/P3
onready var SpawnTimer : Node = $SpawnPoints/Timer
onready var ScoreLabel : Label = $CanvasLayer/Label
onready var MainMenu : Control = $MainMenu/Control
var can_pause : bool = true

var weight :float = .1

func pause():
	if can_pause:
		get_tree().set_deferred("paused", true)

func resume():
	if can_pause:
		get_tree().set_deferred("paused", false)


func _process(delta):
		ScoreLabel.text = "Score: " + str(Global.score)
		difficulty_curve()

func _on_Area_body_entered(body):
	pass

func _ready():
	pause()
	SpawnTimer.wait_time = Global.SpawnTimer
	SpawnTimer.start()

func spawnObjects():
	var Blocks = HitObjects.instance()
	add_child(Blocks)
	var spawn_choices = [spawn1, spawn2, spawn3]
	var i = randi() % spawn_choices.size()
	Blocks.global_transform = spawn_choices[i].global_transform
	Blocks.scale.x = rand_range(1, 4)

func _on_Timer_timeout():
	spawnObjects()
	

func _on_Area2_body_entered(body):
	if body.is_in_group("HitObjects"):
		print("Deleted")
		body.queue_free()


func _on_Play_pressed():
	if get_tree().paused:
		resume()
		MainMenu.visible = false
		ScoreLabel.visible = true

func difficulty_curve():
	if Global.score >= 15:
		Global.ObjSpeed = 30
		Global.SpawnTimer = .8
	if Global.score >= 50:
		Global.ObjSpeed = 40
		Global.SpawnTimer = .6
	if Global.score >= 100:
		Global.ObjSpeed = 50
		Global.SpawnTimer = .4
	if Global.score >= 150:
		Global.ObjSpeed = 60
		Global.SpawnTimer = .2
	
	
	print(Global.ObjSpeed)
func _on_Quit_pressed():
	get_tree().quit()
