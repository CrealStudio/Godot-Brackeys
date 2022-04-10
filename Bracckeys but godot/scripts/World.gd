extends Spatial

export (PackedScene) var HitObjects

onready var spawn1 : Node = $SpawnPoints/P1
onready var spawn2 : Node = $SpawnPoints/P2
onready var spawn3 : Node = $SpawnPoints/P3
onready var SpawnTimer : Node = $SpawnPoints/Timer
var SpawnFrequency : float = .5

#spawn_choices = [point1, point2, point3]
#var i = randi() % spawn_choices.size()        #give a number between 0 and the amount of array slots - 1
#spawn_location = spawn_choices[i]

var ground = preload("res://scenes/Floor.tscn")


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
