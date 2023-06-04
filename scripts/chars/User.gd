extends Sprite2D

class_name User

var char_num
var char_name
var char_data
var hp
var atk
var def
var crit_rate
var crit_dmg

func _init(num):
	char_num = num

	#Get character from party and load texture
	var f = FileAccess.open("res://data/user_data.json", FileAccess.READ)
	var j = JSON.new()
	var parse_res = j.parse(f.get_as_text())
	var user_data = j.get_data()
	char_name = user_data["party"]["char"+str(char_num)]

	var tex = load("res://Assets/"+char_name+".png")
	set_texture(tex)

	#Get character attributes
	var f2 = FileAccess.open("res://data/characters.json", FileAccess.READ)
	var j2 = JSON.new()
	var parse_res2 = j2.parse(f2.get_as_text())
	char_data = j2.get_data()

	hp = char_data[char_name]["HP"]
	atk = char_data[char_name]["attack"]
	def = char_data[char_name]["defense"]
	crit_rate = char_data[char_name]["crit_rate"]
	crit_dmg = char_data[char_name]["crit_dmg"]

func _ready():
	pass
	
func normalAttack():
	var rng = RandomNumberGenerator.new()
	var target = rng.randi_range(0, (len(Global.active_enemies) - 1))
	var crit = rng.randf_range(0, 1)
	
	Global.targets = []
	Global.targets.append("Enemy"+str(Global.enemy_nums[target]))
	
	if(crit <= crit_rate):
		Global.active_enemies[target].hp -= int((atk * crit_dmg) - (Global.active_enemies[target].def * 0.25))
		Global.effect = int(atk * crit_dmg)
	else:
		Global.active_enemies[target].hp -= int(atk - (Global.active_enemies[target].def * 0.25))
		Global.effect = int(atk)
	
	Global.skill = "normal attack"

func specialAttack():
	var target = char_data[char_name]["special"]["target"]
	var skill = char_data[char_name]["special"]["skill"]
	var effect = char_data[char_name]["special"]["effect"]
	
	Global.skill = skill
	Global.effect = effect
	Global.targets = []
	
	var targets = []
	
	match target:
		"front":
			for e in Global.active_enemies:
				if (e.char_num == 1 or e.char_num == 2):
					targets.append(e)
			Global.targets.append("Enemy1")
			Global.targets.append("Enemy2")
		"back":
			for e in Global.active_enemies:
				if (e.char_num == 3 or e.char_num == 4 or e.char_num == 5):
					targets.append(e)
			Global.targets.append("Enemy3")
			Global.targets.append("Enemy4")
			Global.targets.append("Enemy5")
		"lowest_e":
			var temp = []
			for e in Global.active_enemies:
				temp.append(e)
			temp.sort_custom(lowHP)
			targets.append(temp[0])
			Global.targets.append("Enemy"+str(temp[0].char_num))
		"lowest_t":
			var temp = []
			for e in Global.active_chars:
				temp.append(e)
			temp.sort_custom(lowHP)
			targets.append(temp[0])
			Global.targets.append("User"+str(temp[0].char_num))
		"high_atk":
			var temp = []
			for e in Global.active_enemies:
				temp.append(e)
			temp.sort_custom(sortAtk)
			targets.appen(temp[0])
			Global.targets.append("Enemy"+str(temp[0].char_num))
		"high_def":
			var temp = []
			for e in Global.active_enemies:
				temp.append(e)
			temp.sort_custom(sortDef)
			targets.append(temp[0])
			Global.targets.append("Enemy"+str(temp[0].char_num))
		"high_hp":
			var temp = []
			for e in Global.active_enemies:
				temp.append(e)
			temp.sort_custom(highHP)
			targets.append(temp[0])
			Global.targets.append("Enemy"+str(temp[0].char_num))
		"all_e":
			targets = Global.active_enemies
			for x in (Global.enemy_nums):
				Global.targets.append("Enemy"+str(x))
		"all_t":
			targets = Global.active_chars
			for x in (Global.char_nums):
				Global.targets.append("User"+str(x))

	for tar in targets:
		match skill:
			"bonus_f":
				tar.hp -= int((atk + effect) - (tar.def * 0.25))
			"bonus_p":
				tar.hp -= int((atk * effect) - (tar.def * 0.25))
			"lower_atk":
				tar.atk *= effect
			"lower_def":
				tar.def *= effect
			"heal":
				tar.hp += effect
			"boost_atk":
				tar.atk *= effect
			"boost_def":
				tar.def *= effect
			
func enemyAttack():
	var rng = RandomNumberGenerator.new()
	var target = rng.randi_range(0, (len(Global.active_chars) - 1))
	var crit = rng.randf_range(0, 1)
	
	Global.targets = []
	Global.targets.append("User"+str(Global.char_nums[target]))
	
	if(crit <= crit_rate):
		Global.active_chars[target].hp -= int((((Global.cur_level - 1 ) * 5) + atk * crit_dmg) - (Global.active_chars[target].def * 0.25))
		Global.effect = int(((Global.cur_level - 1 ) * 5) + (atk * crit_dmg))
	else:
		Global.active_chars[target].hp -= int(((Global.cur_level - 1 ) * 5) + atk - (Global.active_chars[target].def * 0.25))
		Global.effect = int(((Global.cur_level - 1 ) * 5) + atk)
	
	Global.skill = "normal attack"

func lowHP(a, b):
	return a.hp < b.hp
	
func highHP(a, b):
	return a.hp < b.hp

func sortAtk(a, b):
	return a.atk > b.atk
		
func sortDef(a, b):
	return a.def > b.def

