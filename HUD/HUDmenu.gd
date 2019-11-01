extends CanvasLayer

var sound = true

func _on_Play_pressed():
	get_tree().change_scene("res://src/Game.tscn")


func _on_Sound_pressed():
	if sound == true:
		sound = false
		$Sound.icon = load("res://assets/HUD/SoundOffButton.png")
	elif sound == false:
		sound = true
		$Sound.icon = load("res://assets/HUD/SoundOnButton.png")