extends Control


var strobe_interval: float = 0.1  # Adjust the interval based on your desired strobe speed
var timer: float = 0.0

func _ready():
	pass

func _process(delta):
	timer += delta

	# Toggle visibility every strobe_interval seconds
	if timer >= strobe_interval:
		self.visible = !self.visible
		timer = 0.0
