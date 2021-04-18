extends Node2D

var in_range = false

var talk_counter = 0
# Dialogues stored here, if it gets too unwieldy we can load a json instead.
var day1_dialogue = [
	"Your mother isn't coming this time?",
	"It's best for her to rest anyway",
	"If you want my advice, kid...",
	"Plant some pinkberries",
	"There's a shortage, and it'll help your mum a lot more",
	"I'll even gift you the seeds",
	"Just this once.",
	"Don't you have some work to do, now?"
]
# Structure for handling dialogues
var dialogues = [
	day1_dialogue,
	
]

var default = "Press F to talk"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Text.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("talk") and in_range:
		speak()

func speak():
	$AnimatedSprite.play("talking")
	if day1_dialogue.size() == talk_counter:
		talk_counter -= 1
	talk(talk_counter)
	talk_counter += 1
func talk(counter):
	$Text.percent_visible = 0
	$Text.text = dialogues[Global.day - 1][counter]
	$AnimationPlayer.play("text_roll")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$Text.text = default
		in_range = true



func _on_Area2D_body_exited(body):
	in_range = false
	$Text.text = ""
	$AnimatedSprite.play("idle")
