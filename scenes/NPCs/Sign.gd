extends Node2D

var in_range = false

var talk_counter = 0

var day1_dialogue = [
	'"Sageberry Farm"',
	"(It's named after mum's favorite crop)",
	"(The farm's seen better days...)"
]
var default = "Press F to read"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Text.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("talk") and in_range:
		if day1_dialogue.size() == talk_counter:
			$Text.percent_visible = 0
			$Text.text = day1_dialogue[0]
			$AnimationPlayer.play("text_roll")
			talk_counter = 1
		else:
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
