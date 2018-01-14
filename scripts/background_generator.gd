extends Node

onready var backgrounds = [
	preload("res://sprites/background_day.png"),
	preload("res://sprites/background_night.png")
]

const BACKGROUND_DAY   = 0
const BACKGROUND_NIGHT = 1

var active

func _ready():
	self.generate_random_background()
	pass
	
func get_sprite():
	return backgrounds[active]
	
func generate_random_background():
	randomize()
	
	var rand_f = randf()
	if rand_f <= 0.2:
		active = BACKGROUND_NIGHT
	else:
		active = BACKGROUND_DAY
	

