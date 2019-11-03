extends RigidBody2D

var velocity : Vector2 = Vector2(0, -600)

func initialize(pos, rot) -> void:
	self.position = pos
	self.apply_central_impulse(velocity.rotated(rot))
