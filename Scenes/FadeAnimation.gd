extends CanvasLayer

signal transitioned

# Called when the node enters the scene tree for the first time.
#func _ready():
	#transition()
func transition():
	$AnimationPlayer.play("fade_to_black_slow")
	print ("Fade to black")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black_slow" :
		print ("emit signal transitioned")
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal_slow")
	if anim_name == "fade_to_normal_slow":
		print ("fininsh fading")

