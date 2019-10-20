extends Node
"""
QUA CI VA LA LOGICA DI GIOCO
HERE GOES THE GAME LOGIC
"""

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if $HUD/Control/Shot.pressed and $HUD/Control/ShotTimer.time_left == 0:
		Events.shot = true
		$HUD/Control/ShotTimer.start()
	else:
		Events.shot = false
func _physics_process(delta: float) -> void:
	pass
