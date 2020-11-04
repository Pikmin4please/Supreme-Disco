extends KinematicBody2D

enum DIRECTION {LEFT = -1, RIGHT = 1}
export (DIRECTION) var WALKING_DIRECTION

export (int) var speed = 100
var velocity = Vector2.ZERO

var state 

onready var wall_left = $WallLeft
onready var wall_right= $WallRight
onready var floor_right = $FloorRight
onready var floor_left = $FloorLeft
onready var sprite = $Sprite

func _ready():
	state = WALKING_DIRECTION

func _physics_process(delta):
	match state:
		DIRECTION.RIGHT:
			velocity.x = speed
			
		DIRECTION.LEFT:
			velocity.x = -speed
	move_and_slide(velocity)

