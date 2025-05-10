extends Node

func _ready() -> void:
	# index 0 = first element of your level_music array
	AudioManager.play_level_music(0)
