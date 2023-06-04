extends Control

var f_user_r = FileAccess.open("res://data/user_data.json", FileAccess.READ)
var j_user_r = JSON.new()
var parse_res = j_user_r.parse(f_user_r.get_as_text())
var user_data = j_user_r.get_data()

var f_char_r = FileAccess.open("res://data/characters.json", FileAccess.READ)
var j_char_r = JSON.new()
var parse_res2 = j_char_r.parse(f_char_r.get_as_text())
var char_data = j_char_r.get_data()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ItemBar/Coins.set_text(str(user_data["coins"]))
	$ItemBar/Item1.set_text(str(user_data["item1"]))
	$ItemBar/Item2.set_text(str(user_data["item2"]))
	$ItemBar/Item3.set_text(str(user_data["item3"]))
	$ItemBar/Tickets.set_text(str(user_data["tickets"]))
	
	for x in range(1,13):
		if(char_data["Char"+str(x)]["acquired"] == 0):
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)).disabled = true
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/level").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/hp").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/attack").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/defense").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/crit_rate").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/crit_dmg").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/coins").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/coins/Amount").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/items").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/items/Amount").visible = false
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/LevelUp"+str(x)).visible = false
		else:
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/level").set_text("Level: "+str(char_data["Char"+str(x)]["level"]))
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/hp").set_text("HP: "+str(char_data["Char"+str(x)]["HP"]))
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/attack").set_text("Attack: "+str(char_data["Char"+str(x)]["attack"]))
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/defense").set_text("Defense: "+str(char_data["Char"+str(x)]["defense"]))
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/crit_rate").set_text("Crit Rate: "+str(char_data["Char"+str(x)]["crit_rate"]))
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/crit_dmg").set_text("Crit Dmg: "+str(char_data["Char"+str(x)]["crit_dmg"]))
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/coins/Amount").set_text(str(char_data["Char"+str(x)]["level"] * 100))
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/items/Amount").set_text(str(int(char_data["Char"+str(x)]["level"] * 2.5)))
			
		if(char_data["Char"+str(x)]["level"] * 100 > user_data["coins"]):
			get_node("Characters/"+char_data["Char"+str(x)]["class"]+"/Char"+str(x)+"/LevelUp"+str(x)).disabled = true
		
		if(x % 3 == 0):
			if(int(char_data["Char"+str(x)]["level"] * 2.5) > user_data["item3"]):
				get_node("Characters/Support/Char"+str(x)+"/LevelUp"+str(x)).disabled = true
		elif(x % 3 == 1):
			if(int(char_data["Char"+str(x)]["level"] * 2.5) > user_data["item1"]):
				get_node("Characters/DPS/Char"+str(x)+"/LevelUp"+str(x)).disabled = true
		else:
			if(int(char_data["Char"+str(x)]["level"] * 2.5) > user_data["item2"]):
				get_node("Characters/Debuffer/Char"+str(x)+"/LevelUp"+str(x)).disabled = true


func _on_banner_button_pressed():
	f_user_r.close()
	f_char_r.close()
	get_tree().change_scene_to_file("res://banner_screen.tscn")

func _on_party_button_pressed():
	f_user_r.close()
	f_char_r.close()
	get_tree().change_scene_to_file("res://party_screen.tscn")

func _on_level_button_pressed():
	f_user_r.close()
	f_char_r.close()
	get_tree().change_scene_to_file("res://level_screen.tscn")


func _on_level_up_3_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= (char_data["Char3"]["level"] * 100)
	user_data["item3"] -= int(char_data["Char3"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char3"]["level"] += 1
	char_data["Char3"]["HP"] += 5
	char_data["Char3"]["attack"] += 1
	char_data["Char3"]["defense"] += 1
	char_data["Char3"]["crit_rate"] += 0.005
	char_data["Char3"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_6_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char6"]["level"] * 100
	user_data["item3"] -= int(char_data["Char6"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char6"]["level"] += 1
	char_data["Char6"]["HP"] += 5
	char_data["Char6"]["attack"] += 1
	char_data["Char6"]["defense"] += 1
	char_data["Char6"]["crit_rate"] += 0.005
	char_data["Char6"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_9_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char9"]["level"] * 100
	user_data["item3"] -= int(char_data["Char9"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char9"]["level"] += 1
	char_data["Char9"]["HP"] += 5
	char_data["Char9"]["attack"] += 1
	char_data["Char9"]["defense"] += 1
	char_data["Char9"]["crit_rate"] += 0.005
	char_data["Char9"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_12_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char12"]["level"] * 100
	user_data["item3"] -= int(char_data["Char12"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)	
	char_data["Char12"]["level"] += 1
	char_data["Char12"]["HP"] += 5
	char_data["Char12"]["attack"] += 1
	char_data["Char12"]["defense"] += 1
	char_data["Char12"]["crit_rate"] += 0.005
	char_data["Char12"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_1_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char1"]["level"] * 100
	user_data["item1"] -= int(char_data["Char1"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char1"]["level"] += 1
	char_data["Char1"]["HP"] += 5
	char_data["Char1"]["attack"] += 1
	char_data["Char1"]["defense"] += 1
	char_data["Char1"]["crit_rate"] += 0.005
	char_data["Char1"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_4_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char4"]["level"] * 100
	user_data["item1"] -= int(char_data["Char4"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char4"]["level"] += 1
	char_data["Char4"]["HP"] += 5
	char_data["Char4"]["attack"] += 1
	char_data["Char4"]["defense"] += 1
	char_data["Char4"]["crit_rate"] += 0.005
	char_data["Char4"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_7_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char7"]["level"] * 100
	user_data["item1"] -= int(char_data["Char7"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char7"]["level"] += 1
	char_data["Char7"]["HP"] += 5
	char_data["Char7"]["attack"] += 1
	char_data["Char7"]["defense"] += 1
	char_data["Char7"]["crit_rate"] += 0.005
	char_data["Char7"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_10_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char10"]["level"] * 100
	user_data["item1"] -= int(char_data["Char10"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char10"]["level"] += 1
	char_data["Char10"]["HP"] += 5
	char_data["Char10"]["attack"] += 1
	char_data["Char10"]["defense"] += 1
	char_data["Char10"]["crit_rate"] += 0.005
	char_data["Char10"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_2_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char2"]["level"] * 100
	user_data["item2"] -= int(char_data["Char2"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char2"]["level"] += 1
	char_data["Char2"]["HP"] += 5
	char_data["Char2"]["attack"] += 1
	char_data["Char2"]["defense"] += 1
	char_data["Char2"]["crit_rate"] += 0.005
	char_data["Char2"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_5_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char5"]["level"] * 100
	user_data["item2"] -= int(char_data["Char5"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char5"]["level"] += 1
	char_data["Char5"]["HP"] += 5
	char_data["Char5"]["attack"] += 1
	char_data["Char5"]["defense"] += 1
	char_data["Char5"]["crit_rate"] += 0.005
	char_data["Char5"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_8_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char8"]["level"] * 100
	user_data["item2"] -= int(char_data["Char8"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)	
	char_data["Char8"]["level"] += 1
	char_data["Char8"]["HP"] += 5
	char_data["Char8"]["attack"] += 1
	char_data["Char8"]["defense"] += 1
	char_data["Char8"]["crit_rate"] += 0.005
	char_data["Char8"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()


func _on_level_up_11_pressed():
	var f_user_w = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	user_data["coins"] -= char_data["Char11"]["level"] * 100
	user_data["item2"] -= int(char_data["Char11"]["level"] * 2.5)
	var json_str_u = JSON.stringify(user_data)
	f_user_w.store_line(json_str_u)
	f_user_w.close()
	
	var f_char_w = FileAccess.open("res://data/characters.json", FileAccess.WRITE)
	char_data["Char11"]["level"] += 1
	char_data["Char11"]["HP"] += 5
	char_data["Char11"]["attack"] += 1
	char_data["Char11"]["defense"] += 1
	char_data["Char11"]["crit_rate"] += 0.005
	char_data["Char11"]["crit_dmg"] += 0.05
	var json_str_c = JSON.stringify(char_data)
	f_char_w.store_line(json_str_c)
	f_char_w.close()

