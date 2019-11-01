extends Node

"""GAME LOGIC"""

signal load_game
signal load_menu
signal unload_game
signal unload_menu
signal player_shot
signal bullet_spawned(cannon_rotation)

var m = false

func _ready() -> void:
	$Arcade1.play()

func _shot_pressed() -> void:
	emit_signal("player_shot")

func _process(delta: float) -> void:
	if not $Arcade1.playing and m == false:
		$"Arcade1(part2)".play()
		m = true

func _physics_process(delta: float) -> void:
	pass
