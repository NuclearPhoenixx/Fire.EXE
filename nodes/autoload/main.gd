extends Node2D


var rng := RandomNumberGenerator.new()
var viewport_override := Vector2(1024,600)

signal fire_spread # Signal for Water/Fire spread
signal burnt # Signal when something burnt to crisps


func _ready():
	#OS.set_window_title("Test Titel")
	rng.randomize()
	#OS.shell_open("https://godotengine.org")
	#get_viewport().connect("size_changed",self,"viewport_changed")


func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("fire_spread",get_global_mouse_position())
