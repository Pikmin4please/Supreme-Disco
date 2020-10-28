extends Area2D

var speed = 100


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		move(speed,delta)
	if Input.is_action_pressed("ui_left"):
		move(-speed, delta)


func move(xspeed,delta):
	position.x += xspeed * delta
