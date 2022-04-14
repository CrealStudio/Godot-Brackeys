extends Spatial

export (PackedScene) var HitObjects

onready var spawn1 : Node = $SpawnPoints/P1
onready var spawn2 : Node = $SpawnPoints/P2
onready var spawn3 : Node = $SpawnPoints/P3
onready var SpawnTimer : Node = $SpawnPoints/Timer
onready var mesh = $Floor/MeshInstance

func _process(delta):
	if Global.score > 10:
		
		var material = mesh.get_surface_material(0)
		material.albedo_color = Color(255,20,147)
		mesh.set_surface_material(0, material)
		
		Global.SpawnTimer = .1

func _ready():
	SpawnTimer.start(Global.SpawnTimer)

func spawnObjects():
	var Blocks = HitObjects.instance()
	add_child(Blocks)
	var spawn_choices = [spawn1, spawn2, spawn3]
	var i = randi() % spawn_choices.size()
	Blocks.global_transform = spawn_choices[i].global_transform
	Blocks.scale.x = rand_range(2, 4)

func _on_Timer_timeout():
	spawnObjects()
	

func _on_Area2_body_entered(body):
	if body.is_in_group("HitObjects"):
		body.queue_free()

