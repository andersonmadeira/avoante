extends Area2D

func _ready():
	connect("body_enter", self, "on_body_enter")
	pass
	
func on_body_enter(other_body):
	if other_body.is_in_group(game.GROUP_BIRDS):
		game.score_current += 1
	pass
