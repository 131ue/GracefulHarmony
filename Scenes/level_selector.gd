extends Control
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_song_1_button_down():
	if get_tree().change_scene_to_file("res://Scenes/Game.tscn") != OK:
		print ("Error changing scene to Game")
	pass # Replace with function body.


func _on_song_2_button_down():
	if get_tree().change_scene_to_file("res://Scenes/GameScene.tscn") != OK:
		print ("Error changing scene to Game")
	pass # Replace with function body.
