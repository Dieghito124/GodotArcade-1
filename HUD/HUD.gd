extends CanvasLayer

signal shot

func _ready() -> void:
	$Control/ShotBtn.connect("pressed", get_node("/root/Game/Player"), "_player_shot")
	$Control/MoveBtn.connect("pressed", get_node("/root/Game/Player"), "_player_move")
