extends Node

var clickCount = 0

func _ready():
	# Access the global singleton
	var globalSingleton = get_node("res://Global.gd")
	
	# Access or modify the shared variable
	var value = globalSingleton.clickCount
	globalSingleton.clickCount = 0
