#extends CPUParticles2D
extends Particles2D


func _ready():
	$SpreadTimer.wait_time = Main.rng.randf_range(0.4,0.9)
	$BurntTimer.wait_time = Main.rng.randf_range(0.2,1.0)
	#$Lifetime.wait_time = Main.rng.randf_range(5.0,10.0)
	$SpreadTimer.start()


func _on_Lifetime_timeout():
	queue_free()


func _on_SpreadTimer_timeout():
	Main.emit_signal("fire_spread", position)
	$BurntTimer.start()


func _on_BurntTimer_timeout():
	Main.emit_signal("burnt", position)
	emitting = false
	$Lifetime.start()
