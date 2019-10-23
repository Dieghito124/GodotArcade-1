extends RigidBody2D
func _ready() -> void:
	self.rotation = Events.ang
	apply_impulse(Vector2(), Vector2(0, -1000).rotated(Events.ang))