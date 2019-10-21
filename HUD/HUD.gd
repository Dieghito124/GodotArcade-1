extends CanvasLayer

func _ready() -> void:
	pass

func _process(delta):
	if $Control/ShotBtn.pressed and $ShotTimer.time_left == 0:
		Events.shot = true
		$ShotTimer.start()
	else:
		Events.shot = false

func _on_ShotBtn_pressed() -> void:
	pass