extends CanvasLayer

signal shot

func _ready() -> void:
	print(get_parent().name)
	$Control/ShotBtn.connect("pressed", get_node("/root/Game/Player"), "_player_shot")
	$Control/MoveButtons/MoveRight.connect("pressed", get_parent(), "_player_move_right")
	$Control/MoveButtons/MoveLeft.connect("pressed", get_parent(), "_player_move_left")
