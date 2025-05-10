# res://scenes/collectable.gd
extends Area2D

@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		AudioManager.play_coin()   # ← coin sound
		queue_free()
		game_manager.add_points()
