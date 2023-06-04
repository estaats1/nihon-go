extends Node2D

var f = FileAccess.open("res://data/level"+str(Global.cur_level)+".json", FileAccess.READ)
var j = JSON.new()
var parse_res = j.parse(f.get_as_text())
var level_data = j.get_data()

var correct

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Continue").disabled = true
	Global.incorrect = 0
	
	var rng = RandomNumberGenerator.new()
	var question = rng.randi_range(1, Global.q_num)
	while(Global.questions.has(question)):
		question = rng.randi_range(1, 15)
	Global.questions.append(question)
	
	correct = rng.randi_range(1,5)
	
	var qs = []
	
	for n in range(4):
		var temp = rng.randi_range(1, 10)
		while(qs.has(temp) or temp == question):
			temp = rng.randi_range(1, 10)
		qs.append(temp)
	
	$QuestionText.set_text(level_data[str(question)]["kanji"])
	
	if(correct == 1):
		$Answer1.set_text(level_data[str(question)]["meaning"])
	else:
		$Answer1.set_text(level_data[str(qs.pop_front())]["meaning"])
	if(correct == 2):
		$Answer2.set_text(level_data[str(question)]["meaning"])
	else:
		$Answer2.set_text(level_data[str(qs.pop_front())]["meaning"])
	if(correct == 3):
		$Answer3.set_text(level_data[str(question)]["meaning"])
	else:
		$Answer3.set_text(level_data[str(qs.pop_front())]["meaning"])
	if(correct == 4):
		$Answer4.set_text(level_data[str(question)]["meaning"])
	else:
		$Answer4.set_text(level_data[str(qs.pop_front())]["meaning"])
	if(correct == 5):
		$Answer5.set_text(level_data[str(question)]["meaning"])
	else:
		$Answer5.set_text(level_data[str(qs.pop_front())]["meaning"])

func _on_answer_1_pressed():
	if (correct == 1):
		$Answer1.add_theme_stylebox_override("disabled", load("res://buttons/correct_button.tres"))
		get_node("Continue").disabled = false
		get_node("Answer2").disabled = true
		get_node("Answer3").disabled = true
		get_node("Answer4").disabled = true
		get_node("Answer5").disabled = true
	else:
		$Answer1.add_theme_stylebox_override("disabled", load("res://buttons/incorrect_button.tres"))
		Global.incorrect += 1
	get_node("Answer1").disabled = true

func _on_answer_2_pressed():
	if (correct == 2):
		$Answer2.add_theme_stylebox_override("disabled", load("res://buttons/correct_button.tres"))
		get_node("Continue").disabled = false
		get_node("Answer1").disabled = true
		get_node("Answer3").disabled = true
		get_node("Answer4").disabled = true
		get_node("Answer5").disabled = true
	else:
		$Answer2.add_theme_stylebox_override("disabled", load("res://buttons/incorrect_button.tres"))
		Global.incorrect += 1
	get_node("Answer2").disabled = true

func _on_answer_3_pressed():
	if (correct == 3):
		$Answer3.add_theme_stylebox_override("disabled", load("res://buttons/correct_button.tres"))
		get_node("Continue").disabled = false
		get_node("Answer1").disabled = true
		get_node("Answer2").disabled = true
		get_node("Answer4").disabled = true
		get_node("Answer5").disabled = true
	else:
		$Answer3.add_theme_stylebox_override("disabled", load("res://buttons/incorrect_button.tres"))
		Global.incorrect += 1
	get_node("Answer3").disabled = true

func _on_answer_4_pressed():
	if (correct == 4):
		$Answer4.add_theme_stylebox_override("disabled", load("res://buttons/correct_button.tres"))
		get_node("Continue").disabled = false
		get_node("Answer1").disabled = true
		get_node("Answer2").disabled = true
		get_node("Answer3").disabled = true
		get_node("Answer5").disabled = true
	else:
		$Answer4.add_theme_stylebox_override("disabled", load("res://buttons/incorrect_button.tres"))
		Global.incorrect += 1
	get_node("Answer4").disabled = true

func _on_answer_5_pressed():
	if (correct == 5):
		$Answer5.add_theme_stylebox_override("disabled", load("res://buttons/correct_button.tres"))
		get_node("Continue").disabled = false
		get_node("Answer1").disabled = true
		get_node("Answer2").disabled = true
		get_node("Answer3").disabled = true
		get_node("Answer4").disabled = true
	else:
		$Answer5.add_theme_stylebox_override("disabled", load("res://buttons/incorrect_button.tres"))
		Global.incorrect += 1
	get_node("Answer5").disabled = true

func _on_continue_pressed():
	get_tree().change_scene_to_file("res://level.tscn")
