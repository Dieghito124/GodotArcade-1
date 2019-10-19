extends Node2D

export var bullet_scene : PackedScene
var bullet_spawn_pos : Vector2

#var cannon_rotation : float
#var turn_speed : float = 1

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var angle = rad2deg($Cannon.get_angle_to(get_global_mouse_position())) + 90	
		$Tween.interpolate_property($Cannon, "rotation_degrees", $Cannon.rotation_degrees,
			$Cannon.rotation_degrees + angle, 0.1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		$Tween.start()
		

func _physics_process(delta: float) -> void:
	pass


func _on_Shot_pressed() -> void:
	bullet_spawn_pos = $Cannon/BulletSpawnPos.global_position
	Events.emit_signal("player_shot", bullet_spawn_pos)


func _on_Tween_all_completed() -> void:
	pass # Replace with function body.
