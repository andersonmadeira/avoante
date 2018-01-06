extends Node2D

const scn_ground = preload("res://scenes/ground.tscn")
const GROUND_WIDTH = 168
const AMOUTH_TO_FILL_VIEW = 2

func _ready():
	for i in range(AMOUTH_TO_FILL_VIEW):
		spawn_and_move()
	pass
	
func spawn_and_move():
	spawn_ground()
	go_next_pos()
	pass
	
func spawn_ground():
	var new_ground = scn_ground.instance()
	new_ground.set_pos(get_pos())
	new_ground.connect("exit_tree", self, "spawn_and_move")
	get_node("container").add_child(new_ground)
	
func go_next_pos():
	set_pos( get_pos() + Vector2(GROUND_WIDTH, 0) )
	pass
