extends Node2D

export var bullet_scene : PackedScene
var bullet_spawn_pos : Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var angle = $Cannon.get_angle_to(get_global_mouse_position()) + PI/2
		if angle > PI:
			if get_global_mouse_position().x < get_viewport_rect().size.x / 2: 
				angle = $Cannon.get_angle_to(get_global_mouse_position()) - 3*PI/2
			if get_global_mouse_position().x > get_viewport_rect().size.x / 2: 
				angle = $Cannon.get_angle_to(get_global_mouse_position()) + PI/2
		$Tween.interpolate_property($Cannon, "rotation", $Cannon.rotation,
			$Cannon.rotation + angle, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		$Tween.start()
		print($Cannon.rotation)

func _on_Shot_pressed() -> void:
	#bullet_spawn_pos = $Cannon/BulletSpawnPos.global_position
	#Events.emit_signal("player_shot", bullet_spawn_pos)
	var sc_bul = load("res://src/Bullet.tscn")
	var bul = sc_bul.instance()
	get_node("/root/Game/World1").add_child(bul)
	bul.position = $Cannon/BulletSpawnPos.position

func _process(delta):
	Events.ang = $Cannon.rotation
	if Events.shot == true:
		_on_Shot_pressed()


func _on_Tween_all_completed() -> void:
	$Laser.add_point($Cannon.position)
	$Laser.add_point(get_global_mouse_position())
	pass #Stop the FX sounds

func _on_Tween_started(object: Object, key: NodePath) -> void:
	pass #Start the FX sounds

func _play_shot_sound() -> void:
	$Cannon/CannonShot.pitch_scale = rand_range(0.8, 1.2)
	$Cannon/CannonShot.play()