extends RichTextLabel
var score_text = "abc"
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "[wave amp=100 freq=1  ]"+ score_text 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#self.text = "[wave amp=100 freq=1  ]"+ score_text 
	pass


func _on_game_update_score():
	pass # Replace with function body.
