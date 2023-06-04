extends Control

var f = FileAccess.open("res://data/user_data.json", FileAccess.READ)
var j = JSON.new()
var parse_res = j.parse(f.get_as_text())
var user_data = j.get_data()

var f_char_r = FileAccess.open("res://data/characters.json", FileAccess.READ)
var j_char_r = JSON.new()
var parse_res2 = j_char_r.parse(f_char_r.get_as_text())
var char_data = j_char_r.get_data()

var new_char

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(1,13):
		if(char_data["Char"+str(x)]["acquired"] == 0):
			get_node("CharList/char"+str(x)).disabled = true
		
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for x in range(1,6):
		get_node("Characters/party"+str(x)).icon = load("res://Assets/"+user_data["party"]["char"+str(x)]+".png")

func _on_return_pressed():
	get_tree().change_scene_to_file("res://character_screen.tscn")

func _on_char_1_pressed():
	new_char = "Char1"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_2_pressed():
	new_char = "Char2"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_3_pressed():
	new_char = "Char3"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_4_pressed():
	new_char = "Char4"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_5_pressed():
	new_char = "Char5"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_6_pressed():
	new_char = "Char6"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_7_pressed():
	new_char = "Char7"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_8_pressed():
	new_char = "Char8"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_9_pressed():
	new_char = "Char9"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_10_pressed():
	new_char = "Char10"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_11_pressed():
	new_char = "Char11"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false

func _on_char_12_pressed():
	new_char = "Char12"
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = false
		

func _on_party_1_pressed():
	if((user_data["party"]["char1"] != new_char) and (user_data["party"]["char2"] != new_char) and (user_data["party"]["char3"] != new_char) and (user_data["party"]["char4"] != new_char) and (user_data["party"]["char5"] != new_char)):
		var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
		user_data["party"]["char1"] = new_char

		var json_str_u = JSON.stringify(user_data)
		f_user_w.store_line(json_str_u)
		f_user_w.close()
	
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = true


func _on_party_2_pressed():
	if((user_data["party"]["char1"] != new_char) and (user_data["party"]["char2"] != new_char) and (user_data["party"]["char3"] != new_char) and (user_data["party"]["char4"] != new_char) and (user_data["party"]["char5"] != new_char)):
		var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
		user_data["party"]["char2"] = new_char

		var json_str_u = JSON.stringify(user_data)
		f_user_w.store_line(json_str_u)
		f_user_w.close()
	
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = true


func _on_party_3_pressed():
	if((user_data["party"]["char1"] != new_char) and (user_data["party"]["char2"] != new_char) and (user_data["party"]["char3"] != new_char) and (user_data["party"]["char4"] != new_char) and (user_data["party"]["char5"] != new_char)):
		var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
		user_data["party"]["char3"] = new_char

		var json_str_u = JSON.stringify(user_data)
		f_user_w.store_line(json_str_u)
		f_user_w.close()
	
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = true


func _on_party_4_pressed():
	if((user_data["party"]["char1"] != new_char) and (user_data["party"]["char2"] != new_char) and (user_data["party"]["char3"] != new_char) and (user_data["party"]["char4"] != new_char) and (user_data["party"]["char5"] != new_char)):
		var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
		user_data["party"]["char4"] = new_char

		var json_str_u = JSON.stringify(user_data)
		f_user_w.store_line(json_str_u)
		f_user_w.close()
	
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = true


func _on_party_5_pressed():
	if((user_data["party"]["char1"] != new_char) and (user_data["party"]["char2"] != new_char) and (user_data["party"]["char3"] != new_char) and (user_data["party"]["char4"] != new_char) and (user_data["party"]["char5"] != new_char)):
		var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
		user_data["party"]["char5"] = new_char

		var json_str_u = JSON.stringify(user_data)
		f_user_w.store_line(json_str_u)
		f_user_w.close()
	
	for x in range(1,6):
		get_node("Characters/party"+str(x)).disabled = true
