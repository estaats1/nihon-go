extends Button

var f = FileAccess.open("res://data/user_data.json", FileAccess.READ)
var j = JSON.new()
var parse_res = j.parse(f.get_as_text())
var user_data = j.get_data()
var char_name = user_data["party"]["char3"]

func _ready():
	icon = load("res://Assets/"+char_name+".png")

	if(not Global.char_nums.has(3)):
		disabled = true
