extends ColorRect

var strobe_interval: float = 0.3  # Adjust the interval based on your desired strobe speed
var timerColour: float = 0.0
var clickAmount = 1
var clickCount: int = 0
var clickCountLabel
var audio_player_celebrate : AudioStreamPlayer
var carrot : Sprite2D
var carrot2 : Sprite2D
var carrot3 : Sprite2D
var carrot4 : Sprite2D
var carrot5 : Sprite2D
var carrot6 : Sprite2D
var carrot7 : Sprite2D
var carrot8 : Sprite2D
var rotateEnabled : bool = false
var timer : Timer
var timerboost : Timer
var timerboost2 : Timer
var checkBeastMode : CheckButton
var checkAuto : CheckButton
var rewardTen: int = 10
var audio_player: AudioStreamPlayer

func _ready():
	clickCountLabel = $"../Score"
	checkBeastMode = $"../CheckBeastMode"
	checkAuto = $"../CheckAuto"
	timerboost2 = $"../CheckAuto/TimerBoost2"
	timerboost = $"../CheckAuto/TimerBoost"
	timer = $"../CheckAuto/Timer"
	carrot = $"../Kynoscarrot"
	carrot2 = $"../Kynoscarrot2"
	carrot3 = $"../Kynoscarrot3"
	carrot4 = $"../Kynoscarrot4"
	carrot5 = $"../Kynoscarrot5"
	carrot6 = $"../Kynoscarrot6"
	carrot7 = $"../Kynoscarrot7"
	carrot8 = $"../Kynoscarrot8"
	audio_player_celebrate = $AudioStreamCelebrate
	audio_player = $"../AudioStreamPlayer"



func _process(delta):
	timerColour += delta

	if rotateEnabled:
		rotate_carrot(delta)

	if clickCountLabel.text.to_int() >= 6333 and timerColour >= strobe_interval:
		$".".visible = true
		if self.color == Color(1, 1, 1):  # If color is white
			self.color = Color(0, 0, 0)   # Set color to black
		else:
			self.color = Color(1, 1, 1)   # Otherwise, set color to white
		timerColour = 0.0

func toggleRotation():
	rotateEnabled = true



func rotate_carrot(delta):
	carrot.rotation_degrees += 411 * delta
	carrot2.rotation_degrees += -890 * delta
	carrot3.rotation_degrees += 673 * delta
	carrot4.rotation_degrees += -412 * delta
	carrot5.rotation_degrees += 653 * delta
	carrot6.rotation_degrees += -311 * delta
	carrot7.rotation_degrees += 300 * delta
	carrot8.rotation_degrees += -450 * delta


func _on_visibility_changed():
	clickCountLabel.visible = false
	checkAuto.visible = false
	checkBeastMode.visible = false
	audio_player_celebrate.play()
	audio_player.stop()
	carrot2.visible = true
	carrot3.visible = true
	carrot4.visible = true
	carrot5.visible = true
	carrot6.visible = true
	carrot7.visible = true
	carrot8.visible = true
	
	toggleRotation()
