extends Node

onready var backgrounds = [
	preload("res://sprites/background_day.png"),
	preload("res://sprites/background_night.png")
]

onready var bird_frames = [
	preload("res://sprite_frames/bird_orange.tres"),
	preload("res://sprite_frames/bird_blue.tres"),
	preload("res://sprite_frames/bird_red.tres")
]

const BACKGROUND_DAY   = 0
const BACKGROUND_NIGHT = 1

const BIRD_ORANGE = 0
const BIRD_BLUE   = 1
const BIRD_RED    = 2

var _background_sprite_index
var _bird_frame_index

func _ready():
	randomize()
	self._rand_background()
	self._rand_bird()
	pass
	
func get_background_sprite():
	return backgrounds[_background_sprite_index]

func get_bird_frame():
	return bird_frames[_bird_frame_index]

func _rand_background():
	# Generate random background
	var rand_f = randf()
	if rand_f <= 0.2:
		_background_sprite_index = BACKGROUND_NIGHT
	else:
		_background_sprite_index = BACKGROUND_DAY
	pass
	
func _rand_bird():
	# Choose random 
	var rand_f = randf()
	if rand_f <= 0.5:
		_bird_frame_index = BIRD_ORANGE
	elif rand_f > 0.5 and rand_f <= 0.8:
		_bird_frame_index = BIRD_BLUE
	else:
		_bird_frame_index = BIRD_RED
	pass

