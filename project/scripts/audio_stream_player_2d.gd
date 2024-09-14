extends AudioStreamPlayer2D


const DOS_88_CITY_LIGHTS = preload("res://assets/music/DOS88/DOS88CityLights.wav")
const REST_EASY = preload("res://assets/music/DOS88/Rest Easy.mp3")
const SYSTEM_ONLINE = preload("res://assets/music/DOS88/SystemOnline.mp3")
const LUDUM_DARE_28___02 = preload("res://assets/music/MUSIC LOOP BUNDLE/Ludum Dare 28 - 02.ogg")
const LUDUM_DARE_30___05 = preload("res://assets/music/MUSIC LOOP BUNDLE/Ludum Dare 30 - 05.ogg")
const STREAM_LOOPS_2023_11_29 = preload("res://assets/music/MUSIC LOOP BUNDLE/Stream Loops 2023-11-29.ogg")
const STREAM_LOOPS_2024_04_24_03 = preload("res://assets/music/MUSIC LOOP BUNDLE/Stream Loops 2024-04-24_03.ogg")

var music_list := [
	DOS_88_CITY_LIGHTS,
	REST_EASY,
	SYSTEM_ONLINE,
	LUDUM_DARE_28___02,
	LUDUM_DARE_30___05,
	STREAM_LOOPS_2023_11_29,
	STREAM_LOOPS_2024_04_24_03
]

var tween : Tween

func _ready() -> void:
	finished.connect(_on_finished)
	music_list.shuffle()
	volume_db = -20
	play_next()
	
func _on_finished():
	play_next()

func play_next():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, 'volume_db', 0, 5)
	
	var music = music_list.pop_back()
	music_list.insert(0, music)
	stream = music
	play()
	
	var ease_out_duration := 10
	var wait_for := stream.get_length() - ease_out_duration
	
	await get_tree().create_timer(wait_for).timeout
	
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, 'volume_db', -40, ease_out_duration)
	
	
	
	
	
