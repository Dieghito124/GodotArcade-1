extends RigidBody2D

var velocity : Vector2 = Vector2(0, -1000)

func _ready() -> void:

	self.apply_central_impulse(velocity.rotated(rotation))

func _physics_process(delta: float) -> void:
	"""FIX"""
	#rotation_degrees = get_global_transform()
	pass