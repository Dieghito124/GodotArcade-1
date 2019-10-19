extends Node2D

export var bullet_scene : PackedScene
var bullet_spawn_pos : Vector2


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var angle = $Cannon.get_angle_to(get_global_mouse_position()) + PI/2
		$Tween.interpolate_property($Cannon, "rotation", $Cannon.rotation,
			$Cannon.rotation + angle, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		$Tween.start()
		print($Cannon.rotation)

func _on_Shot_pressed() -> void:
	bullet_spawn_pos = $Cannon/BulletSpawnPos.global_position
	Events.emit_signal("player_shot", bullet_spawn_pos)

func _on_Tween_all_completed() -> void:
	pass #Stop the FX sounds

func _on_Tween_started(object: Object, key: NodePath) -> void:
	pass #Start the FX sounds