extends ColorRect

var strobe_interval: float = 0.3  # Adjust the interval based on your desired strobe speed
var timerColour: float = 0.0
var clickAmount = 1
var clickCount: int = 0
var clickCountLabel
var audio_player_suffer : AudioStreamPlayer
var audio_player_rain : AudioStreamPlayer
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
var carrotShadow : Sprite2D
var carrotSmall : Sprite2D
var continue_process : bool = true
var plsLeave : Label
var timerWhy : Timer


func _ready():
	timerWhy = $TimerWhy
	plsLeave = $TimerWhy/Pls
	carrotSmall = $"../KynoscarrotClick"
	carrotShadow = $"../carrotShadow"
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
	audio_player_suffer = $AudioStreamSuffer
	audio_player_rain = $AudioStreamRain
	audio_player = $"../AudioStreamPlayer"
	


func _process(delta):
	if not continue_process:
		$".".visible = false
	timerColour += delta


	if clickCountLabel.text.to_int() >= 100000 and timerColour >= strobe_interval: # label amount to activate strobe
		$".".visible = true
		checkBeastMode.button_pressed = false
		checkAuto.button_pressed = false
		




func _on_visibility_changed():
	clickCountLabel.visible = false
	checkAuto.visible = false
	checkBeastMode.visible = false
	carrotShadow.visible = false
	carrotSmall.visible = false
	audio_player_suffer.play()
	audio_player_rain.play()
	audio_player.stop()
	timerWhy.start()






func _on_timer_why_timeout():
	plsLeave.visible = true
