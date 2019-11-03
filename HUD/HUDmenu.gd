extends CanvasLayer

var sound = true

func _process(delta):
	if sound == true:
		$Arcade0.volume_db = -10
	elif sound == false:
		$Arcade0.volume_db = -1000
func _on_Play_pressed():
	get_tree().change_scene("res://src/Game.tscn")

func _on_Sound_pressed():
	if sound == true:
		$Sound.icon = load("res://assets/HUD/SoundOffButton.png")
		sound = false
	elif sound == false:
		$Sound.icon = load("res://assets/HUD/SoundOnButton.png")
		sound = true