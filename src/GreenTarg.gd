extends RigidBody2D

func _process(delta) -> void:
	if $CollisionArea.get_overlapping_areas():
		queue_free()