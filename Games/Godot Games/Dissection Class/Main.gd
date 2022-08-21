extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var InkRuntime = load("res://addons/inkgd/runtime.gd")
var Story = load("res://addons/inkgd/runtime/story.gd")

onready var textbox = $MarginContainer/VBoxContainer/CenterContainer2/VBoxContainer/RichTextLabel
onready var image_holder = $MarginContainer/VBoxContainer/CenterContainer/TextureRect

var story

const SHOULD_LOAD_IN_BACKGROUND = false

var _loading_thread

signal prompt
signal choice_made(index)

onready var characters = {
	"Adrienne" : load("res://images/Sprites/Adrienne.png"),
	"Janet" : load("res://images/Sprites/Janet.png"),
	"Kurt" : load("res://images/Sprites/Kurt.png"),
	"Marshell" : load("res://images/Sprites/Marshell.png"),
	"Otis" : load("res://images/Sprites/Otis.png"),
	"Patty" : load("res://images/Sprites/Patty.png"),
	"Door" : load("res://images/Sprites/Items/door.png"),
	"Demon Sign" : load("res://images/Sprites/Items/demonsign.png"),
	"Dissected Frog" : load("res://images/Sprites/Items/dissectedfrog.png"),
	"Empty Frog" : load("res://images/Sprites/Items/frog.png"),
	"Lab" : load("res://images/Sprites/Items/lab.png"),
	"Uncut Frog" : load("res://images/Sprites/Items/wholefrog.png")
}

func _ready():
	call_deferred("_add_runtime")
	call_deferred("start_story")
	$AnimationPlayer.play("BG Animation 1")

func _exit_tree():
	call_deferred("_remove_runtime")

func _add_runtime():
	InkRuntime.init(get_tree().root)

func _remove_runtime():
	InkRuntime.deinit(get_tree().root)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("prompt")

func start_story():
	_add_runtime()

	if SHOULD_LOAD_IN_BACKGROUND:
		_loading_thread = Thread.new()
		_loading_thread.start(self, "_async_load_story", "res://story#/story.ink.json")
	else:
		_load_story("res://story#/story.ink.json")
		continue_story()

func _async_load_story(ink_story_path):
	_load_story(ink_story_path)
	call_deferred("_async_load_completed")

func _async_load_completed():
	_loading_thread.wait_to_finish()
	_loading_thread = null

	continue_story()


func _load_story(ink_story_path):
	var ink_story = File.new()
	ink_story.open(ink_story_path, File.READ)
	var content = ink_story.get_as_text()
	ink_story.close()

	self.story = Story.new(content)

func continue_story():
	while story.can_continue:
		var text = story.continue()
		
		if story.current_tags != []:
			for tag in story.current_tags:
				var tagtype = tag[0]
				tag = tag.right(2)
				match tagtype:
					"a" : play_audio(tag)
					"b" : play_ambience(tag)
					"c" : set_character(tag)
				print(tag)
		textbox.text = text
		yield(self, "prompt")

	if story.current_choices.size() > 0:
		textbox.text = ""
		var container = $MarginContainer/VBoxContainer/CenterContainer2/VBoxContainer
		for i in range(len(story.current_choices)):
			var line = story.current_choices[i]
			var button = Button.new()
			button.text = line.text
			container.add_child(button)
			button.connect("pressed", self, "emit_signal", ["choice_made", i])
		container.get_child(1).grab_focus()
		var choice_index = yield(self, "choice_made")
		story.choose_choice_index(choice_index)
		for i in range(1, container.get_child_count()):
			container.call_deferred("remove_child", container.get_child(i))
		continue_story()

	else:
		$AnimationPlayer.play("The End")
		yield(self, "prompt")
		get_tree().quit()

func play_audio(filename):
	if filename == "none":
		$SFX.stop()
	else:
		$SFX.stream = load("res://sfx/"+filename+".wav")
		$SFX.play()
	pass

func play_ambience(filename):
	if filename == "none":
		$Ambience.stop()
	else:
		$Ambience.stream = load("res://sfx/ambience/"+filename+".wav")
		$Ambience.play()
		if filename != "Heavy Rain 2":
			$Ambience.volume_db = -5
	pass

func set_character(name):
	if name == "clear":
		image_holder.texture = null
	else:
		if not name in characters.keys():
			image_holder.text = null
		else:
			image_holder.texture = characters[name]
