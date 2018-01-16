extends Node

onready var backgrounds = [
	preload("res://sprites/background_day.png"),
	preload("res://sprites/background_night.png")
]

const BACKGROUND_DAY   = 0
const BACKGROUND_NIGHT = 1

var active

func _ready():
	randomize()
	self._generate_background()
	pass
	
func get_background():
	return backgrounds[active]

func _generate_background():
	# Generate random background
	var rand_f = randf()
	if rand_f <= 0.5:
		active = BACKGROUND_NIGHT
	else:
		active = BACKGROUND_DAY
	pass
	

