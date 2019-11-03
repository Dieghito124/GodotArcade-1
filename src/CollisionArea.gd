tool
extends Area2D

export var texture : Texture

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if !$Sprite.texture:
		$Sprite.texture = texture