extends Node
"""
QUA CI VA LA LOGICA DI GIOCO
HERE GOES THE GAME LOGIC
"""

func _ready() -> void:
	#$Arcade1.play()
	pass

func _shot_pressed() -> void:
	emit_signal("player_shot")

func _process(delta: float) -> void:
	if not $Arcade1.playing and not $"Arcade1(part2)".playing:
		#$"Arcade1(part2)".play()
		pass
func _physics_process(delta: float) -> void:
	pass
