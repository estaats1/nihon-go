extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var f_read = FileAccess.open("res://data/user_data.json", FileAccess.READ)
	var j = JSON.new()
	var parse_res = j.parse(f_read.get_as_text())
	var user_data = j.get_data()
	
	var f_write = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	var rng = RandomNumberGenerator.new()
	var num = rng.randf_range(0, 1000)
	var result
	var amount
	
	var f_char = FileAccess.open("res://data/characters.json", FileAccess.READ)
	var j_char = JSON.new()
	var parse_res_c = j_char.parse(f_char.get_as_text())
	var char_data = j_char.get_data()
	var chars = Array(char_data.values())
	var dps = []
	
	for c in chars:
		if (c["class"] == "DPS"):
			dps.append(c)
	
	user_data["tickets"] -= 1
	
	if(num <= 5):
		result = "character"
		amount = 1
	elif(num <= 400):
		result = "coins"
		amount = rng.randi_range(100, 500)
	elif(num <= 580):
		result = "item1"
		amount = rng.randi_range(1, 5)
	elif(num <= 760):
		result = "item2"
		amount = rng.randi_range(1, 5)
	elif(num <= 940):
		result = "item3"
		amount = rng.randi_range(1, 5)
	else:
		result = "tickets"
		amount = rng.randi_range(1, 3)
	
	if(result == "character"):
		num = rng.randf_range(0, len(dps) - 1)
		result = dps[num]
		$Result.set_texture(load("res://Assets/"+result["name"]+".png"))
		
		if(result["acquired"] == 0):
			char_data[result["name"]]["acquired"] = 1
			print("Congrats, you acquired " + result["name"])
		else:
			char_data[result["name"]]["special"]["effect"] += 0.05
			print("Already owned " + result["name"] + "; skill up!")
	else:
		user_data[result] += amount
		$Result.set_texture(load("res://Assets/"+result+".png"))
	
	$Result/Amount.set_text("x"+str(amount))
		
	var json_str = JSON.stringify(user_data)

	f_write.store_line(json_str)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_return_pressed():
	get_tree().change_scene_to_file("res://banner_screen.tscn")
