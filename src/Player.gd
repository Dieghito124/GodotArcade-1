extends Node2D

signal bullet_instanciated(position, rotation)

export var bullet_scene : PackedScene
export var bullet_velocity : Vector2

var turret_moving : bool = false

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch && !turret_moving:
#------------ALLOWS TO ROTATE ONLY IF THE PREVIOUS ROTATION IS FINISHED------------#		
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
	if !turret_moving:
#------------INSTANCIATE THE BULLET WHEN THE BUTTON IS PRESSED & TURRET NOT MOVING------------#	
		$Timers/ShotTimer.start()
		var bul = bullet_scene.instance()
		get_node("/root/Game/World1/Bullets").add_child(bul)
		emit_signal("bullet_instanciated", position, rotation)
		connect("bullet_instanciated", bul, "initialize")
#------------START THE SOUND OF THE CANNON ROTATION------------#
		$Cannon/CannonShot.pitch_scale = rand_range(0.9, 1.2)
		$Cannon/CannonShot.volume_db = rand_range(-2, 2)
		$Cannon/CannonShot.play()

func _player_move() -> void:
	pass

func _on_Tween_started(object: Object, key: NodePath) -> void:
	turret_moving = true
#------------START THE SOUND OF THE CANNON SHOT------------#	
	$Cannon/TurretMove.pitch_scale = rand_range(0.7, 0.8)
	$Cannon/TurretMove.volume_db = rand_range(-7, -3)
	$Cannon/TurretMove.play()

func _on_Tween_all_completed() -> void:
#------------STOP THE SOUND OF THE CANNON ROTATION------------#
	$Cannon/TurretMove.play(2.90)
	$Cannon/TurretMove/RotationDuration.start()

func _on_RotationDuration_timeout() -> void:
	turret_moving = false
#------------STOP THE SOUND OF THE CANNON ROTATION AFTER THE FINAL "CLICK"------------#
	$Cannon/TurretMove.stop()