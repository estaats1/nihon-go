extends Button

func _ready():
	if(not Global.enemy_nums.has(4)):
		disabled = true
