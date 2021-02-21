extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("NewGame").connect("pressed", self, "_on_new_game_pressed")
	get_node("HostGame").connect("pressed", self, "_on_host_game_pressed")
	get_node("JoinGame").connect("pressed", self, "_on_join_game_pressed")
	get_node("Settings").connect("pressed", self, "_on_settings_pressed")
	get_node("Exit").connect("pressed", self, "_on_exit_pressed")


func _on_new_game_pressed():
	print("new game")
	
func _on_host_game_pressed():
	print("new game")
	
func _on_join_game_pressed():
	print("join game")
	
func on_settings_pressed():
	print("settings")

func _on_exit_pressed():
	print("exit")
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
