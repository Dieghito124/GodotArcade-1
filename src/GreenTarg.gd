tool
extends RigidBody2D

export var texture : Texture

func _process(delta) -> void:
	if !$Sprite.texture:
		$Sprite.texture = texture
	if $CollisionArea.get_overlapping_areas():
		print("Gravità")