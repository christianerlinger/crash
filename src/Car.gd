extends KinematicBody2D


var speed = 100

var rotation_dir = 0

const DRIVE_UP = KEY_W
const DRIVE_DOWN = KEY_S
const DRIVE_LEFT = KEY_A
const DRIVE_RIGHT = KEY_D
const FIRE = KEY_SPACE


var driving_direction = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	driving_direction = Vector2.ZERO
	rotation = driving_direction.angle()
	
func _input(event):
	
	if event is InputEventKey and event.pressed:
		if event.scancode == DRIVE_UP && driving_direction != Vector2.DOWN:
			driving_direction = Vector2.UP
			
		if event.scancode == DRIVE_DOWN && driving_direction != Vector2.UP:
			driving_direction = Vector2.DOWN

		if event.scancode == DRIVE_LEFT && driving_direction != Vector2.RIGHT:
			driving_direction = Vector2.LEFT
			
			
		if event.scancode == DRIVE_RIGHT && driving_direction != Vector2.LEFT:
			driving_direction = Vector2.RIGHT
			
		rotation = driving_direction.angle()


func _physics_process(delta):
	var collision = move_and_collide(driving_direction * speed * delta)
	if collision:
		print("crashed")
		crashed()
	
func crashed():
	queue_free()
