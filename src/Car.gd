extends KinematicBody2D


var speed = 500

var drive_vec = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	drive_vec.y += 1;
func _input(event):
	
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_W:
			drive_vec = Vector2()
			drive_vec.y -= 1
			drive_vec = drive_vec.normalized()
			
		if event.scancode == KEY_S:
			drive_vec = Vector2()
			drive_vec.y += 1
			drive_vec = drive_vec.normalized()

		if event.scancode == KEY_A:
			drive_vec = Vector2()
			drive_vec.x -= 1
			drive_vec = drive_vec.normalized()
			
		if event.scancode == KEY_D:
			drive_vec = Vector2()
			drive_vec.x += 1
			drive_vec = drive_vec.normalized()


func _physics_process(delta):
	var collision = move_and_collide(drive_vec * speed * delta)
	if collision:
		print("crashed")
		crashed()
	
func crashed():
	queue_free()
