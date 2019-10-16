extends Node2D

signal player_shot

export var bullet_scene : PackedScene 

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	$Cannon.rotation_degrees = rad2deg($Cannon.position.angle_to_point(get_local_mouse_position())) + 90
	pass

func _on_Shot_pressed() -> void:
	emit_signal("player_shot")
	var bullet = bullet_scene.instance()
	add_child(bullet)