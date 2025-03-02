extends CharacterBody2D

@export var Bullet : PackedScene

var speed = 100
var rotation_speed = 2

func _ready():
	pass
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
	var move_input = Input.get_axis("backward", "forward")
	var rotation_direction = Input.get_axis("left", "right")
	velocity = transform.y * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Body/Barrel/Muzzle.global_transform
	
	
