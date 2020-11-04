extends KinematicBody2D

export (int) var jump_speed = -600
export (int) var gravity = 1100
export (int) var MAX_SPEED = 150
export (float) var FRICTION = 0.2
export (float) var acceleration = 0.8
export (int) var LIVES = 3


var velocity = Vector2.ZERO

#Get access to enemy
var ENEMY = preload("res://Enemy/enemy.tscn")

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

func jump():
	velocity.y = jump_speed 

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0,-1))
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		jump()



func _on_HitBox_area_exited(area):
	jump()

func hit():
	if LIVES <= 0:
		queue_free()
	else:
		LIVES -= 1
		var current_dir = ENEMY.instance().dir
		if current_dir:
			position.x = MAX_SPEED
			print(velocity.x)
		else:
			position.x = -MAX_SPEED
			print(velocity.x)

