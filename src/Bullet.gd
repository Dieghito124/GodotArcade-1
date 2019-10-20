extends RigidBody2D

func _ready() -> void:
	self.rotation = Events.ang
	apply_impulse(Vector2(), Vector2(0, -500).rotated(Events.ang))
