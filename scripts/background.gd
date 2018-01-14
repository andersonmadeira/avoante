extends CanvasLayer

func _ready():
	var sprite = get_node("sprite")
	if sprite:
		sprite.set_texture(background_generator.get_sprite())	
	pass
