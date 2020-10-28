extends Area2D

export (int) var speed = 100
export (int) var jump_speed = 50 

var velocity = Vector2.ZERO

func get_input():
	var input = velocity
	if Input.is_action_just_pressed("ui_right"):
		input.x = 
