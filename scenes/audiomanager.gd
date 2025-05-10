# AudioManager.gd
extends Node

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# assign these in the Inspector
@export var jump_sfx:    AudioStream
@export var coin_sfx:    AudioStream
@export var stomp_sfx:   AudioStream
@export var hurt_sfx:    AudioStream
@export var hit_sfx:     AudioStream
@export var level_music: Array[AudioStream]

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# must match the names of the child nodes
@onready var music_player: AudioStreamPlayer   = $MusicPlayer
@onready var sfx_player:   AudioStreamPlayer = $SfxPlayer

func play_jump():
	sfx_player.stream = jump_sfx
	sfx_player.play()

func play_coin():
	sfx_player.stream = coin_sfx
	sfx_player.play()

func play_stomp():
	sfx_player.stream = stomp_sfx
	sfx_player.play()

func play_hurt():
	sfx_player.stream = hurt_sfx
	sfx_player.play()

func play_hit():
	sfx_player.stream = hit_sfx
	sfx_player.play()

func play_level_music(level_index: int):
	if level_index >= 0 and level_index < level_music.size():
		music_player.stream = level_music[level_index]
		music_player.play()
