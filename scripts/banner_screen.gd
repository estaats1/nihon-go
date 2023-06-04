extends Control

var f = FileAccess.open("res://data/user_data.json", FileAccess.READ)
var j = JSON.new()
var parse_res = j.parse(f.get_as_text())
var user_data = j.get_data()

# Called when the node enters the scene tree for the first time.
func _ready():
	$ItemBar/Coins.set_text(str(user_data["coins"]))
	$ItemBar/Item1.set_text(str(user_data["item1"]))
	$ItemBar/Item2.set_text(str(user_data["item2"]))
	$ItemBar/Item3.set_text(str(user_data["item3"]))
	$ItemBar/Tickets.set_text(str(user_data["tickets"]))
	
	if(user_data["tickets"] < 10):
		get_node("Banners/Support/10PullSup").disabled = true
		get_node("Banners/Damage/10PullDam").disabled = true
		get_node("Banners/Debuff/10PullDeb").disabled = true
	if(user_data["tickets"] < 1):
		get_node("Banners/Support/1PullSup").disabled = true
		get_node("Banners/Damage/1PullDam").disabled = true
		get_node("Banners/Debuff/1PullDeb").disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_levels_button_pressed():
	f.close()
	get_tree().change_scene_to_file("res://level_screen.tscn")


func _on_char_button_pressed():
	f.close()
	get_tree().change_scene_to_file("res://character_screen.tscn")


func _on_1_pull_supp_pressed():
	get_tree().change_scene_to_file("res://banners/1_pull_sup.tscn")


func _on_10_pull_supp_pressed():
	get_tree().change_scene_to_file("res://banners/10_pull_sup.tscn")


func _on_1_pull_dam_pressed():
	get_tree().change_scene_to_file("res://banners/1_pull_dam.tscn")


func _on_10_pull_dam_pressed():
	get_tree().change_scene_to_file("res://banners/10_pull_dam.tscn")


func _on_1_pull_deb_pressed():
	get_tree().change_scene_to_file("res://banners/1_pull_deb.tscn")


func _on_10_pull_deb_pressed():
	get_tree().change_scene_to_file("res://banners/10_pull_deb.tscn")
