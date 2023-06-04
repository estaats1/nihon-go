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
	
	for x in range(1,13):
		if(x > user_data["level"]):
			get_node("Levels/Level"+str(x)+"Button").disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_banner_button_pressed():
	f.close()
	get_tree().change_scene_to_file("res://banner_screen.tscn")


func _on_char_button_pressed():
	f.close()
	get_tree().change_scene_to_file("res://character_screen.tscn")


func _on_level_1_button_pressed():
	#Set up characters to be used in level
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 1
	Global.q_num = 15
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_2_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 2
	Global.q_num = 14
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_3_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 3
	Global.q_num = 14
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_4_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 4
	Global.q_num = 15
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_5_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 5
	Global.q_num = 14
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_6_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 6
	Global.q_num = 14
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_7_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 7
	Global.q_num = 15
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_8_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 8
	Global.q_num = 14
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_9_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 9
	Global.q_num = 16
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_10_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 10
	Global.q_num = 14
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_11_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 11
	Global.q_num = 16
	
	get_tree().change_scene_to_file("res://questions.tscn")


func _on_level_12_button_pressed():
	var User1 = User.new(1)
	var User2 = User.new(2)
	var User3 = User.new(3)
	var User4 = User.new(4)
	var User5 = User.new(5)
	
	var Enemy1 = Enemy.new(1)
	var Enemy2 = Enemy.new(2)
	var Enemy3 = Enemy.new(3)
	var Enemy4 = Enemy.new(4)
	var Enemy5 = Enemy.new(5)
	
	Global.active_chars = [User1, User2, User3, User4, User5]
	Global.active_enemies = [Enemy1, Enemy2, Enemy3, Enemy4, Enemy5]
	
	Global.char_nums = [1, 2, 3, 4, 5]
	Global.enemy_nums = [1, 2, 3, 4, 5]
	
	Global.cur_level = 12
	Global.q_num = 16
	
	get_tree().change_scene_to_file("res://questions.tscn")
