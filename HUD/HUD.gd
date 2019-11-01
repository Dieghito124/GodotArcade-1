extends CanvasLayer

signal shot

func _ready() -> void:
	$Control/BtnShot.connect("pressed", get_node("/root/Game/Player"), "_player_shot")