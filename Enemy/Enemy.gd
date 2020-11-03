extends KinematicBody2D

# Enemy horizontal speed
export (int) var EnemySpeed = 3;

#Enemy 
var velocity = Vector2.ZERO;
var dir = true;

# This function sets the defualt velocity of the enemy.
func _ready():
	velocity = Vector2(EnemySpeed,0);


# This function is to be called when the enemy reaches one of its boundaries 
# and is required to change direction of its movement.
func ChangeDir():
	dir = !dir;
	if(dir):
		velocity = Vector2(EnemySpeed,0);
	else:
		velocity = Vector2(-EnemySpeed,0);

# This is the physics tick function
func _physics_process(delta):	
	# Moves the enemy body to the default direction untill a colission is 
	# detected. It'll return null if no collision is detected
	var collision = move_and_collide(velocity,true,false);
	# Check if collision isn't null. If it isn't null, start processing the 
	# collision data
	if (collision):
		# Get the coliider - The object the enemy is colliding with
		var collider = collision.get_collider();
		# Understand what is the layer of the collider. It is set as such that
		# all the walls have their own seperate layer
		var collider_type = collider.collision_layer;
		# Thus if it the wall layer, it is surely a wall.
		if(collider_type == 1):
			ChangeDir(); # Change direction due to contact with a wall.
