extends CanvasModulate


func _process(_delta):
	var fire_count := get_tree().get_nodes_in_group("fire").size()
	color.g8  = int(255 * pow(1.5,-fire_count/200.0)) #255 - int(fire_count/2)
	color.b8  = int(255 * pow(1.5,-fire_count/200.0)) #255 - int(fire_count/2)
	#color.r8  = 255 * exp(-fire_count) #255 - int(fire_count/10)
