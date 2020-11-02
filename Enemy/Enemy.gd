extends KinematicBody2D

export (int) var MAX_SPEED = 150
export (float) var FRICTION = 0.2
export (float) var acceleration = 0.8


#onready var WallLeft = $WallLeft;

var velocity = Vector2.ZERO;
var dir = true;


func _ready():
	velocity = Vector2(1,0);




# This function is to be called when the enemy reaches one of its boundaries and is required to change direction of moving.
func ChangeDir():
	dir = !dir;

func _physics_process(delta):
	print(-1)
	var collision = move_and_collide(velocity,true,false);
	print(0)
	if (collision):
		print(1)
		var collider = collision.get_collider();
		var collider_type = collider.collision_mask;
		print(collider_type)
		if(collider_type==28):
			ChangeDir();

	#velocity.x = lerp(velocity.x, MAX_SPEED,acceleration);


