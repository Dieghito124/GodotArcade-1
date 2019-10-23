extends CanvasLayer

func _ready() -> void:
	pass
	
func _on_ShotBtn_pressed() -> void:
	Events.emit_signal("player_shot")