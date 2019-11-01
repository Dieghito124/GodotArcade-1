extends CanvasLayer

func _ready() -> void:
	pass
	
func _on_ShotBtn_pressed() -> void:
	Events.emit_signal("player_shot")

func _on_MoveBtn_pressed():
	Events.emit_signal("turret_move")