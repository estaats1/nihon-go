extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var f = FileAccess.open("res://data/user_data.json", FileAccess.READ)
	var j = JSON.new()
	var parse_res = j.parse(f.get_as_text())
	var user_data = j.get_data()
	
	if(user_data["level"] == Global.cur_level):
		user_data["level"] = Global.cur_level + 1
		
	var f_write = FileAccess.open("res://data/user_data.json", FileAccess.WRITE)
	var rng = RandomNumberGenerator.new()
	var num = rng.randi_range(0, 10)
	var result
	var amount
	var coins = rng.randi_range(50, 200)
	
	if(num <= 3):
		result = "item1"
		amount = rng.randi_range(2, 5)
	elif(num <= 6):
		result = "item2"
		amount = rng.randi_range(2, 5)
	elif(num <= 9):
		result = "item3"
		amount = rng.randi_range(2, 5)
	else:
		result = "tickets"
		amount = 1
		
	user_data["coins"] += coins
	user_data[result] += amount
	$Items.set_texture(load("res://Assets/"+result+".png"))
	$Items/Amount.set_text("x"+str(amount))
	$Coins/Amount.set_text("x"+str(coins))
	
	var json_str = JSON.stringify(user_data)

	f_write.store_line(json_str)
	
	f.close()
	f_write.close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_pressed():
	get_tree().change_scene_to_file("res://level_screen.tscn")
