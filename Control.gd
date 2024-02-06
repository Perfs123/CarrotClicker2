extends Control

var clickAmount = 1
var clickCount: int = 0
var clickCountLabel : Label
var audio_player : AudioStreamPlayer
var carrot : Sprite2D
var rotateEnabled : bool = false
var timer : Timer
var timerboost : Timer
var timerboost2 : Timer
var checkBeastMode : CheckButton
var checkAuto : CheckButton
var rewardTen: int = 10
var carrot1 : AudioStreamPlayer
var carrot2 : AudioStreamPlayer
var carrot3 : AudioStreamPlayer
var carrot4 : AudioStreamPlayer
var carrot_players = []
var soundCheck : CheckButton
var carrotShadow : Sprite2D
var carrotSmall : Sprite2D


func _ready():
	carrotSmall = $KynoscarrotClick
	carrotShadow = $carrotShadow
	soundCheck = $Sound/soundCheck
	clickCountLabel = $Score
	checkBeastMode = $CheckBeastMode
	checkAuto = $CheckAuto
	timerboost2 = $CheckAuto/TimerBoost2
	timerboost = $CheckAuto/TimerBoost
	timer = $CheckAuto/Timer
	carrot = $Kynoscarrot
	audio_player = $AudioStreamPlayer
	update_label()
	
	
	for i in range(4):
		var carrot_player = get_node("Score/Click1/carrot" + str(i + 1))
		carrot_players.append(carrot_player)



func _process(delta):
	
	if rotateEnabled:
		rotate_carrot(delta)
	else:
		pass
		
	if clickCountLabel.text.to_int() == 4: # for beast mode
		checkBeastMode.visible = true
	elif clickCountLabel.text.to_int() >= 4: # for auto clicker
		checkAuto.visible = true
	else:
		pass

func toggleRotation():
	rotateEnabled = !rotateEnabled


func rotate_carrot(delta): # for beast mode
	carrot.rotation_degrees += 300 * delta
	carrotSmall.rotation_degrees += 300 * delta
	carrotShadow.rotation_degrees += 300 * delta 


func update_label():
	clickCountLabel.text = str(clickCount) #update counter


func _on_button_pressed(): #when pressing carrot
	var random_index = randi() % carrot_players.size()
	carrot_players[random_index].play()
	
	clickCount += clickAmount
	update_label()
	
	#flicker to show the carrot going down and smaller
	carrot.visible = not carrot.visible 
	carrotSmall.visible = not carrotSmall.visible
	carrotShadow.visible = not carrotShadow.visible


func _on_check_beast_toggled(toggled_on):
	if toggled_on:
		toggleRotation()
		clickAmount = 5
		audio_player.play()
	else:
		carrot.rotation_degrees = 0
		carrotSmall.rotation_degrees = 0
		carrotShadow.rotation_degrees = 0
		toggleRotation()
		clickAmount = 1
		audio_player.stop()


func _on_check_auto_toggled(toggled_on):
	if toggled_on:
		timer.start()
		timerboost.start()
		timerboost2.start()
	else:
		timer.stop()
		timerboost.stop()
		timerboost2.stop()


func auto_click():
	clickAmount = 6
	clickCount += clickAmount
	update_label()
	
func auto_click2():
	clickAmount = 13
	clickCount += clickAmount
	update_label()


func _on_timer_timeout():
	_on_button_pressed()


func _on_timer_boost_timeout():
	auto_click()


func _on_timer_boost_2_timeout():
	auto_click2()


func _on_check_button_toggled(toggled_on): #mute sound
	if toggled_on:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -800)
