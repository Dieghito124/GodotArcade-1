extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	$Cannon.rotation_degrees = rad2deg($Cannon.position.angle_to_point(get_local_mouse_position())) + 90
	pass