extends Spatial

export (PackedScene) var HitObjects

onready var spawn1 : Node = $SpawnPoints/P1
onready var spawn2 : Node = $SpawnPoints/P2
onready var spawn3 : Node = $SpawnPoints/P3
onready var SpawnTimer : Node = $SpawnPoints/Timer
onready var ScoreLabel = $CanvasLayer/Label
var SpawnFrequency : float = .5

func _process(delta):
	ScoreLabel.text = "Score: " + str(Global.score)

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		pass

func _ready():
	SpawnTimer.wait_time = SpawnFrequency
	SpawnTimer.start(SpawnFrequency)

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
