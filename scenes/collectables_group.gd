extends Node

@onready var game_manager: Node = %GameManager

func _ready():
	await get_tree().process_frame  # 🟢 Waits 1 frame to let everything load first
	var count = get_child_count()
	game_manager.set_total_collectibles(count)
