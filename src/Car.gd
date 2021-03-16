extends KinematicBody2D


var speed = 100

var drive_vec = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	drive_vec.y -= 1;


func _physics_process(delta):
	if Input.is_action_pressed("move_up"):
		drive_vec = Vector2()
		drive_vec.y -= 1
	elif Input.is_action_pressed("move_down"):
		drive_vec = Vector2()
		drive_vec.y += 1
	elif Input.is_action_pressed("move_left"):
		drive_vec = Vector2()
		drive_vec.x -= 1
	elif Input.is_action_pressed("move_right"):
		drive_vec = Vector2()
		drive_vec.x += 1
		
	move_and_collide(drive_vec * speed * delta)
