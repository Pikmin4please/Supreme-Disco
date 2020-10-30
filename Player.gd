extends KinematicBody2D

export (int) var jump_speed = -400
export (int) var gravity = 1100
export (int) var MAX_SPEED = 150
export (float) var FRICTION = 0.2
export (float) var acceleration = 0.8



var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	var moving = false
	if Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x, MAX_SPEED,acceleration)
		moving = true
	if Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x,-MAX_SPEED, acceleration)
		moving = true
	if moving == false:
		velocity.x = lerp(velocity.x, 0, FRICTION)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0,-1))
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_speed 
