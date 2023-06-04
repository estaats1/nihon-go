extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Question").disabled = true
	
	for x in range(len(Global.active_chars)):
		get_node("User"+str(Global.char_nums[x])+"/HP").set_text(str(Global.active_chars[x].hp))
		
	for y in range(len(Global.active_enemies)):
		get_node("Enemy"+str(Global.enemy_nums[y])+"/HP").set_text(str(Global.active_enemies[y].hp))
	
	var moves = len(Global.active_chars) - Global.incorrect
	
	if(moves < 0):
		moves = 0
	
	var rng = RandomNumberGenerator.new()
	
	for x in range(moves):
		if(len(Global.active_enemies) == 0):
			get_tree().change_scene_to_file("res://win_screen.tscn")
			break
		
		#Use this for code:
		var attack = rng.randi_range(1, 5)
		if (attack == 1):
			Global.active_chars[x].specialAttack()
		else:
			Global.active_chars[x].normalAttack()
		
		#Use this for visual:
		get_node("User"+str(Global.char_nums[x])).add_theme_stylebox_override("normal", load("res://buttons/outline.tres"))
		$Skill.set_text(Global.skill)
		$Effect.set_text(str(Global.effect))
		
		for t in Global.targets:
			if(Global.skill == "heal"):
				get_node(t).add_theme_stylebox_override("normal", load("res://buttons/outline_green.tres"))
			elif(attack > 1):
				get_node(t).add_theme_stylebox_override("normal", load("res://buttons/outline_red.tres"))
			else:
				get_node(t).add_theme_stylebox_override("normal", load("res://buttons/outline_blue.tres"))
		updateHP()
		
		await get_tree().create_timer(0.75).timeout
		get_node("User"+str(Global.char_nums[x])).add_theme_stylebox_override("normal", load("res://buttons/character_button.tres"))
		for t in Global.targets:
			get_node(t).add_theme_stylebox_override("normal", load("res://buttons/character_button.tres"))
		
	for x in range (len(Global.enemy_nums)):
		if(len(Global.active_chars) == 0):
			get_tree().change_scene_to_file("res://loss_screen.tscn")
			break
			
		Global.active_enemies[x].enemyAttack()
		
		get_node("Enemy"+str(Global.enemy_nums[x])).add_theme_stylebox_override("normal", load("res://buttons/outline.tres"))
		$Skill.set_text(Global.skill)
		$Effect.set_text(str(Global.effect))
		
		for t in Global.targets:
			get_node(t).add_theme_stylebox_override("normal", load("res://buttons/outline_red.tres"))
		updateHP()
		
		await get_tree().create_timer(0.75).timeout
		get_node("Enemy"+str(Global.enemy_nums[x])).add_theme_stylebox_override("normal", load("res://buttons/character_button.tres"))
		for t in Global.targets:
			get_node(t).add_theme_stylebox_override("normal", load("res://buttons/character_button.tres"))
			
	
	if(len(Global.questions) == Global.q_num):
		get_tree().change_scene_to_file("res://loss_screen.tscn")
		
	if(len(Global.active_enemies) == 0):
		get_tree().change_scene_to_file("res://win_screen.tscn")
		
	get_node("Question").disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateHP():
	var temp_c = []
	var temp_cnum = []
	for x in range(len(Global.active_chars)):
		temp_c.append(Global.active_chars[x])
		temp_cnum.append(Global.char_nums[x])
	
	for x in range(len(Global.active_chars)):
		if (Global.active_chars[x].hp <= 0):
			get_node("User"+str(Global.char_nums[x])).disabled = true
			get_node("User"+str(Global.char_nums[x])+"/HP").set_text("0")
			temp_c.erase(Global.active_chars[x])
			temp_cnum.erase(Global.char_nums[x])
		else:
			get_node("User"+str(Global.char_nums[x])+"/HP").set_text(str(Global.active_chars[x].hp))
	
	Global.active_chars = temp_c
	Global.char_nums = temp_cnum
	
	var temp_e = []
	var temp_enum = []
	for y in range(len(Global.active_enemies)):
		temp_e.append(Global.active_enemies[y])
		temp_enum.append(Global.enemy_nums[y])
	
	for y in range(len(Global.active_enemies)):
		if (Global.active_enemies[y].hp <= 0):
			get_node("Enemy"+str(Global.enemy_nums[y])).disabled = true
			get_node("Enemy"+str(Global.enemy_nums[y])+"/HP").set_text("0")
			temp_e.erase(Global.active_enemies[y])
			temp_enum.erase(Global.enemy_nums[y])
		else:
			get_node("Enemy"+str(Global.enemy_nums[y])+"/HP").set_text(str(Global.active_enemies[y].hp))
		
	Global.active_enemies = temp_e
	Global.enemy_nums = temp_enum

func _on_question_pressed():
	get_tree().change_scene_to_file("res://questions.tscn")

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://loss_screen.tscn")
