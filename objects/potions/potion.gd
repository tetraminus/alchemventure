extends Area2D

const textures = [
	preload("res://tex/POTIONS/RND_POTION.png"),
	preload("res://tex/POTIONS/SQR_POTION.png"),
	preload("res://tex/POTIONS/POLY_POTION.png")
]
export (Array) var effects = []
export (int) var Power = 1
onready var pot_Sprite = self.get_node("Sprite")
onready var player = get_node("/root/Node2D/player")


func _ready():
	randomize()
	var cur_tex = int(round(rand_range(0,textures.size()-1)))
	pot_Sprite.set_texture(textures[cur_tex])
	print(effects)
	print(Power)


func _on_Base_potion_body_entered(body):
	
	player.inventory.append([effects,Power])
	hide()
	queue_free()
