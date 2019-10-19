extends Node2D

export var bullet_scene : PackedScene
var bullet_spawn_pos : Vector2

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	$Cannon.rotation_degrees = rad2deg($Cannon.position.angle_to_point(get_local_mouse_position())) + 90
	pass

func _on_Shot_pressed() -> void:
	bullet_spawn_pos = $Cannon/BulletSpawnPos.global_position
	Events.emit_signal("player_shot", bullet_spawn_pos)