extends Area2D

@export var target_level : PackedScene
@onready var game_manager: Node = %GameManager

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		print("Points:", game_manager.points, "/", game_manager.total_collectibles)
		if game_manager.all_collected():
			get_tree().change_scene_to_packed(target_level)
