extends RigidBody2D

var velocity : Vector2 = Vector2(0, -800)

func _ready() -> void:
	Events.connect("bullet_spawned", self, "initialize")

func _physics_process(delta: float) -> void:
	"""FIX"""
	#rotation_degrees = get_global_transform()
	pass

func initialize(cannon_rotation : float) -> void:
	self.rotation = cannon_rotation
	self.apply_central_impulse(velocity.rotated(cannon_rotation))
	Events.disconnect("bullet_spawned", self, "initialize")