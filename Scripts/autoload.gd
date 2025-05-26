extends Node


@onready var music_player = AudioStreamPlayer.new()

func _ready():
	add_child(music_player)
	music_player.stream = load("res://assets/sound/city-traffic-noise.mp3")
	music_player.volume_db = -10
	music_player.play()

func play_sound(sound_path):
	var sound = AudioStreamPlayer.new()
	add_child(sound)
	sound.stream = load(sound_path)
	sound.play()
	sound.connect("finished", Callable(sound, "queue_free"))
