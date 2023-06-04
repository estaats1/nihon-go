extends Sprite2D

class_name Enemy

var char_num
var hp
var atk
var def
var crit_rate
var crit_dmg

func _init(num):
	char_num = num
	hp = Global.cur_level * 100 + (Global.cur_level - 1) * 25
	atk = Global.cur_level * 10
	def = Global.cur_level * 10
	crit_rate = Global.cur_level * 0.01
	crit_dmg = 1 + (Global.cur_level * 0.5)

func _ready():
	pass
			
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
