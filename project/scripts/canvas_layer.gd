extends CanvasLayer

@onready var parallax_background: ParallaxBackground = %ParallaxBackground

# Speed of the parallax scrolling
var scroll_speed = Vector2(-10, 0)

func _process(delta):
	parallax_background.scroll_offset += scroll_speed * delta
