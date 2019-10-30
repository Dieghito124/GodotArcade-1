extends Node
var m = false
"""
QUA CI VA LA LOGICA DI GIOCO
HERE GOES THE GAME LOGIC
"""

func _ready() -> void:
	$Arcade1.play()

func _process(delta: float) -> void:
	if not $Arcade1.playing and m == false:
		$"Arcade1(part2)".play()
		m = true
func _physics_process(delta: float) -> void:
	pass
