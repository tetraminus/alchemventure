extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = -400
export (int) var gravity = 1000
export (float, 0, 1.0) var friction = 0.1
var velocity = Vector2.ZERO
var jumping
var jump_frame_count
var inventory = []

func get_input():
	var dir = 0
	if Input.is_action_pressed("walk_right"):
		dir += 1
	if Input.is_action_pressed("walk_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = (jump_speed/5)
			jumping = true
	if not Input.is_action_pressed("jump") or jump_frame_count > 10:
		jumping = false
		jump_frame_count = 1
	if not jumping:
		velocity.y += gravity * delta
	if jumping == true and jump_frame_count <= 10:
		velocity.y += (jump_speed/(jump_frame_count*5))
		jump_frame_count += 1
		
	velocity = move_and_slide(velocity, Vector2.UP)

func _process(delta):
	if inventory.size() > 0:
		get_node("CanvasLayer/Control/Label").text = str(inventory[0])
	

export (float, 0, 1.0) var acceleration = 0.25
