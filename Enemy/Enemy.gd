extends KinematicBody2D

export (int) var EnemySpeed = 3;

var velocity = Vector2.ZERO;
var dir = true;

func _ready():
	velocity = Vector2(EnemySpeed,0);


# This function is to be called when the enemy reaches one of its boundaries and is required to change direction of moving.
func ChangeDir():
	dir = !dir;
	if(dir):
		velocity = Vector2(EnemySpeed,0);
	else:
		velocity = Vector2(-EnemySpeed,0);

func _physics_process(delta):
	
	# Moves the enemy body to the right (by defualt) untill a colission is detected (returns null if none is detected)
	var collision = move_and_collide(velocity,true,false);
	
	if (collision):
		var collider = collision.get_collider();
		var collider_type = collider.collision_layer;
		if(collider_type == 1):
			ChangeDir();
