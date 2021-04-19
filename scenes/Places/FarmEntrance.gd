extends Node2D

var in_range = false

var talk_counter = 0

var day1_dialogue = [
	"(It's our post.)",
	"(I'm surprised it hasn't fallen over)",
	"...",
	"(I should probably do maintenance someday.)"
]
var default = "Press F to observe"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Text.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("talk") and in_range:
		speak()

func speak():
	if day1_dialogue.size() == talk_counter:
			talk_counter = 0
	$Text.percent_visible = 0
	$Text.text = day1_dialogue[talk_counter]
	$AnimationPlayer.play("text_roll")
	talk_counter += 1

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$Text.text = default
		in_range = true



func _on_Area2D_body_exited(body):
	in_range = false
	$Text.text = ""
