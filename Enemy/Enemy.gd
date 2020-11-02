extends KinematicBody2D

export (int) var MAX_SPEED = 150
export (float) var FRICTION = 0.2
export (float) var acceleration = 0.8

var velocity = Vector2.ZERO

var dir = true;


# This function is to be called when the enemy reaches one of its boundaries and is required to change direction of moving.
func ChangeDir():
	dir = !dir;

func _physics_process(delta):
	velocity.x = lerp(velocity.x, MAX_SPEED,acceleration);

CollisionObject2D.signal
