extends Node2D

export var bullet_scene : PackedScene

func _ready() -> void:
	Events.connect("player_shot", $".", "_player_shot")

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var angle = $Cannon.get_angle_to(get_global_mouse_position()) + PI/2
		if angle > PI:
			if get_global_mouse_position().x < get_viewport_rect().size.x / 2: 
				angle = $Cannon.get_angle_to(get_global_mouse_position()) - 3*PI/2
			if get_global_mouse_position().x > get_viewport_rect().size.x / 2: 
				angle = $Cannon.get_angle_to(get_global_mouse_position()) + PI/2
		$Tween.interpolate_property($Cannon, "rotation", $Cannon.rotation,
			$Cannon.rotation + angle, 1.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		$Tween.start()

func _player_shot() -> void:
	$Timers/ShotTimer.start()
	var bul = bullet_scene.instance()
	get_node("/root/Game/World1/Bullets").add_child(bul)
	bul.position = self.position
	Events.emit_signal("bullet_spawned", $Cannon.rotation)
	_play_shot_sound()

func _on_Tween_all_completed() -> void:
	$Laser.clear_points()
	$Laser.add_point($Cannon.position)
	$Laser.add_point(get_global_mouse_position())

func _play_shot_sound() -> void:
	$Cannon/CannonShot.play()
	$Cannon/CannonShot.pitch_scale = rand_range(0.9, 1.2)
	$Cannon/CannonShot.volume_db = rand_range(-2, 2)