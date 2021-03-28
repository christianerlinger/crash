extends KinematicBody2D


var speed = 100

const DIRECTION_UP = Vector2(0,-1)
const DIRECTION_DOWN = Vector2(0, 1)
const DIRECTION_LEFT = Vector2(-1, 0)
const DIRECTION_RIGHT = Vector2(1, 0)

const DRIVE_UP = KEY_W
const DRIVE_DOWN = KEY_S
const DRIVE_LEFT = KEY_A
const DRIVE_RIGHT = KEY_D
const FIRE = KEY_SPACE


var driving_direction = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	driving_direction = Vector2.ZERO
func _input(event):
	
	if event is InputEventKey and event.pressed:
		if event.scancode == DRIVE_UP && driving_direction != DIRECTION_DOWN:
			#if driving_direction == DIRECTION_LEFT:
				
			driving_direction = DIRECTION_UP
			driving_direction = driving_direction.normalized()
			
		if event.scancode == DRIVE_DOWN && driving_direction != DIRECTION_UP:
			driving_direction = DIRECTION_DOWN
			driving_direction = driving_direction.normalized()

		if event.scancode == DRIVE_LEFT && driving_direction != DIRECTION_RIGHT:
			driving_direction = DIRECTION_LEFT
			driving_direction = driving_direction.normalized()
			
		if event.scancode == DRIVE_RIGHT && driving_direction != DIRECTION_LEFT:
			driving_direction = DIRECTION_RIGHT
			driving_direction = driving_direction.normalized()


func _physics_process(delta):
	var collision = move_and_collide(driving_direction * speed * delta)
	if collision:
		print("crashed")
		crashed()
	
func crashed():
	queue_free()
