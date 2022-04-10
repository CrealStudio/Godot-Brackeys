extends Node


var score : int = 0
const DIV = 5

var time_start = 0
var time_now = 0

var CanCount :bool= false
var CanSpawn : bool = false
var CanMove : bool = false

func _ready():
	time_start = OS.get_unix_time()
	
func _process(delta):
	time_now = OS.get_unix_time()
	score = time_now - time_start

	



