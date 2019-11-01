extends RigidBody2D

var velocity : Vector2 = Vector2(0, -1000)

func initialize(pos, rot) -> void:
	position = pos
	apply_impulse(Vector2(), velocity.rotated(rot))