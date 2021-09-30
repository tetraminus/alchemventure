extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = -600
export (int) var gravity = 1000
export (float, 0, 1.0) var friction = 0.1
var velocity = Vector2.ZERO
var jumping
var jump_frame_count

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
	if not jumping:
		velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if jumping == true and jump_frame_count <= 10:
		velocity.y += (jump_speed/(jump_frame_count*5))
		jump_frame_count += 1
		
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = (jump_speed/5)
			jumping = true
	if not Input.is_action_pressed("jump") or jump_frame_count > 10:
		jumping = false
		jump_frame_count = 1
		
	print(jump_frame_count)
			

export (float, 0, 1.0) var acceleration = 0.25
