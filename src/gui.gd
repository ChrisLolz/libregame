extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("HBoxContainer/Label").text = "plant1 " + str(Player.plants["plant1"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
