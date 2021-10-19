extends Area2D

const textures = [
	preload("res://tex/POTIONS/RND_POTION.png"),
	preload("res://tex/POTIONS/SQR_POTION.png")
]
export (Array) var effects = []
export (int) var Power = 1
onready var pot_Sprite = self.get_node("Sprite")


func _ready():
	print(rand_range(0,textures.size()))
	randomize()
	pot_Sprite.set_texture(textures[int(round(rand_range(0,textures.size()-1)))])
	print(effects)
	print(Power)
