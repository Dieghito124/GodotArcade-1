tool
extends Line2D

func _ready() -> void:
	pass

#func _input(event: InputEvent) -> void:
	#if event is InputEventScreenTouch && !get_parent().turret_moving:
		#clear_points()
		#add_point(get_local_mouse_position())
		#add_point(position)

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass


func _on_Player_turret_move_laser():
	if !get_parent().turret_moving:
		clear_points()
		add_point(get_local_mouse_position())
		add_point(position)
