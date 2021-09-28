extends CPUParticles2D


func _ready():
	$Lifetime.wait_time = Main.rng.randi_range(2,40)
	$Lifetime.start()


func _on_Lifetime_timeout():
	emitting = false
	$KillTimer.start()


func _on_KillTimer_timeout():
	queue_free()
