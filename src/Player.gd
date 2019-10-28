extends Node2D

export var bullet_scene : PackedScene

func _ready() -> void:
	Events.connect("player_shot", $".", "_player_shot")

var turret_moving : bool = false

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch && !turret_moving: #it allows you to rotate only if the turret has completed the previous rotation
		var angle = $Cannon.get_angle_to(get_global_mouse_position()) + PI/2
		if angle > PI:
			if get_global_mouse_position().x < get_viewport_rect().size.x / 2: 
				angle = $Cannon.get_angle_to(get_global_mouse_position()) - 3*PI/2
			if get_global_mouse_position().x > get_viewport_rect().size.x / 2: 
				angle = $Cannon.get_angle_to(get_global_mouse_position()) + PI/2
		$Tween.interpolate_property($Cannon, "rotation", $Cannon.rotation,
			$Cannon.rotation + angle, 2, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		$Tween.start()

func _player_shot() -> void:
	if !turret_moving: #shot only if the turret is not moving
		$Timers/ShotTimer.start()
		var bul = bullet_scene.instance()
		get_node("/root/Game/World1/Bullets").add_child(bul)
		bul.position = self.position
		Events.emit_signal("bullet_spawned", $Cannon.rotation)
		_play_shot_sound()

func _on_Tween_all_completed() -> void:
	"""LASER CURRENTLY NOT WORKING"""
	$Laser.clear_points()
	$Laser.add_point(get_global_mouse_position())
	_stop_turret_sound()	

func _on_Tween_started(object: Object, key: NodePath) -> void:
	turret_moving = true
	_play_turret_sound()
	pass #Start the FX sounds

func _play_shot_sound() -> void:
	$Cannon/CannonShot.pitch_scale = rand_range(0.9, 1.2)
	$Cannon/CannonShot.volume_db = rand_range(-2, 2)
	$Cannon/CannonShot.play()

func _play_turret_sound() -> void: #there could be some problems with large rotations
	$Cannon/TurretMove.pitch_scale = rand_range(0.7, 0.8)
	$Cannon/TurretMove.volume_db = rand_range(-7, -3)
	$Cannon/TurretMove.play()

func _stop_turret_sound() -> void:
	$Cannon/TurretMove.play(2.90)
	$Cannon/TurretMove/RotationDuration.start()

func _on_RotationDuration_timeout() -> void: #stops the sound after the final "click"
	$Cannon/TurretMove.stop()
	turret_moving = false	

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	pass


