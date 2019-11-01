extends RigidBody2D

var velocity : Vector2 = Vector2(0, -1000)

<<<<<<< Updated upstream
func initialize(pos, rot) -> void:
	position = pos
	apply_impulse(Vector2(), velocity.rotated(rot))
=======
<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
func initialize(pos, rot) -> void:
	position = pos
	apply_impulse(Vector2(), velocity.rotated(rot))
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
func _ready() -> void:
	self.apply_central_impulse(velocity.rotated(rotation))

func _physics_process(delta: float) -> void:
	"""FIX"""
	#rotation_degrees = get_global_transform()
<<<<<<< Updated upstream
	pass
=======
	pass
=======
func initialize(pos, rot) -> void:
<<<<<<< HEAD
	position = pos
	apply_impulse(Vector2(), velocity.rotated(rot))
=======
	self.position = pos
	self.apply_central_impulse(velocity.rotated(rot))
<<<<<<< HEAD
>>>>>>> master
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes
=======
>>>>>>> 087182df919af9500c3241a7cc88c895e813e4e0
