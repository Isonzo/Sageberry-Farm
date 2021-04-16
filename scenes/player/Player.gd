extends KinematicBody2D

const MOVE_SPEED = 48
const GRAVITY = 48
var velocity = Vector2(0, 1)
var money = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D/UI/Money.set_text("$" + str(money)) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):

	if not is_on_floor():
		velocity.y = GRAVITY
	else:
		velocity.y = GRAVITY * delta
	
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimatedSprite.play("walking")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite.play("walking")
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.play("idle")
	move_and_slide(Vector2(velocity.x * MOVE_SPEED, velocity.y), Vector2.UP, true, 4)
#	if not is_on_floor():
#		move_and_slide(Vector2.DOWN * 3, Vector2.UP)

