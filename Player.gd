extends KinematicBody2D

export (int) var speed = 100
export (int) var jump_speed = 50 
export (int) var gravity = 25

var velocity = Vector2.ZERO

func get_input():
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_speed

func _process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0,-1))
