extends Node

const GROUP_PIPES = "pipes"
const GROUP_GROUNDS = "grounds"
const GROUP_BIRDS = "birds"

const MEDAL_BRONZE   = 10
const MEDAL_SILVER   = 20
const MEDAL_GOLD     = 30
const MEDAL_PLATINUM = 40

var score_current = 0 setget _set_score_current
var score_best = 0 setget _set_score_best

signal score_current_changed
signal score_best_changed

func _ready():
	stage_manager.connect("stage_changed", self, "on_stage_changed")
	connect("score_best_changed", self, "on_score_best_changed")
	self.load_game()
	pass
	
func on_stage_changed():
	score_current = 0
	pass
	
func _set_score_current(new_value):
	score_current = new_value
	emit_signal("score_current_changed")
	pass
	
func _set_score_best(new_value):
	if new_value > score_best:
		score_best = new_value
		emit_signal("score_best_changed")
	pass
	
func on_score_best_changed():
	save_game()
	pass
	
func get_save_data():
	var save_dict = {
		score_best=score_best
	}
	return save_dict
	
func save_game():
	var savegame = File.new()
	savegame.open("user://game.save", File.WRITE)
	savegame.store_line(self.get_save_data().to_json())
	savegame.close()
	pass
	
func load_game():
	var savegame = File.new()
	
	if !savegame.file_exists("user://game.save"):
		return
		
	var currentline = {}
	savegame.open("user://game.save", File.READ)
	currentline.parse_json(savegame.get_line())
	
	if currentline.has("score_best"):
		score_best = currentline["score_best"]
	
	savegame.close()
	pass
