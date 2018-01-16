extends CanvasLayer

func _ready():
	var sprite = get_node("sprite")
	if sprite:
		sprite.set_texture(randomizer.get_background())
	pass
