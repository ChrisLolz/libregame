extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	$click_sfx.play()
	get_tree().change_scene_to_file("res://src/village.tscn")







func _on_quit_mouse_entered():
	$Quit/AudioStreamPlayer2D.play()


func _on_play_mouse_entered():
	$Play/AudioStreamPlayer2D.play()
