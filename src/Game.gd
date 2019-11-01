extends Node

"""GAME LOGIC"""

signal load_game
signal load_menu
signal unload_game
signal unload_menu
signal player_shot
signal bullet_spawned(cannon_rotation)

func _ready() -> void:
	$Arcade1.play()
	pass

func _shot_pressed() -> void:
	emit_signal("player_shot")

func _process(delta: float) -> void:
	if not $Arcade1.playing and not $"Arcade1(part2)".playing:
		$"Arcade1(part2)".play()
		pass
func _physics_process(delta: float) -> void:
	pass
