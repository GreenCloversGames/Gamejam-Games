# ############################################################################ #
# Copyright © 2019-present Frédéric Maquin <fred@ephread.com>
# Licensed under the MIT License.
# See LICENSE in the project root for license information.
# ############################################################################ #

# This version of the template uses a while loop to have the code continue
# the story until it reaches the choice point. It then checks for choices and,
# on getting a choice, recursively calls the continue_story function to continue
# the story. 

extends Control

signal prompt_pressed

const SHOULD_LOAD_IN_BACKGROUND = false

# ############################################################################ #
# Imports
# ############################################################################ #

var Story = load("res://addons/inkgd/runtime/story.gd")

# ############################################################################ #
# Public Properties
# ############################################################################ #

var story
export(String, FILE, "*.json") var exported_story_location

# ############################################################################ #
# Private Properties
# ############################################################################ #

var _loading_thread

# ############################################################################ #
# Lifecycle
# ############################################################################ #

func _ready():
	call_deferred("start_story")

# ############################################################################ #
# Public Methods
# ############################################################################ #

func start_story():
	if SHOULD_LOAD_IN_BACKGROUND:
		_loading_thread = Thread.new()
		_loading_thread.start(self, "_async_load_story", exported_story_location)
	else:
		_load_story(exported_story_location)
		_bind_externals()
		continue_story()
		emit_signal("prompt_pressed")


func continue_story():
	if story.can_continue:
		var text = story.continue()
		if story.current_tags:
			print(story.current_tags)
			for tag in story.current_tags:
				tag = tag.split(" ")
				if tag[0] == "angel":
					if tag[1] != "r":
						$Control/VBoxContainer/HBoxContainer/AnGelContainer/AnGel.frame_index = int(tag[1])
					else:
						$Control/VBoxContainer/HBoxContainer/AnGelContainer/AnGel.set_random_frame(.2, 2, 5)
					show_angel()
				if tag[0] == "narate":
					hide_angel()
				if tag[0] == "sfx":
					$SFXPlayer.stream = load("res://Audio/SFX/"+tag[1])
					$SFXPlayer.play()
				if tag[0] == "music":
					if tag[1] == "e":
						$AudioStreamPlayer.stop()
					else:
						$AudioStreamPlayer.stream = load("res://Audio/Music/"+tag[1])
						$AudioStreamPlayer.play()
				if tag[0] == "bg":
					if tag[1] == "r":
						var files = ["res://images/bg/frontview.png", 
						"res://images/bg/sideview2.png", 
						"res://images/bg/sideview.png",
						"res://images/bg/topview.png"]
						var new_texture_file = files[randi()%4]
						$TextureRect.texture = load(new_texture_file)
					else:
						$TextureRect.texture = load("res://images/bg/"+tag[1])
		# This text is a line of text from the ink story. 
		# Set the text of a Label to this value to display it in your game. 
		$Control/VBoxContainer/PanelContainer/MarginContainer/StoryTextBox.text = text
	elif story.current_choices.size() > 0:
		# current_choices contains a list of the choices.
		# Each choice has a text property that contains the text of the choice.
		
		var story_choice_container = $Control/VBoxContainer/HBoxContainer/StoryChoicesContainer
		if story_choice_container.get_child_count() != 0:
			return
		for choice in story.current_choices:
			var button = Button.new()
			button.size_flags_horizontal = button.SIZE_SHRINK_CENTER
			button.text = choice.text
			button.connect("pressed", self, "_choice_selected", [choice.index])
			story_choice_container.add_child(button)
		yield(get_tree(), "idle_frame")
		story_choice_container.get_child(0).grab_focus()


	else:
		# This code runs when the story reaches it's end. 
		get_tree().quit()
		print("The End")

# ############################################################################ #
# Private Methods
# ############################################################################ #

func _should_show_debug_menu(debug):
	# Contrived external function example, where we just return the pre-existing value.
	return debug

func _observe_variables(variable_name, new_value):
	print(str("Variable '", variable_name, "' changed to: ", new_value))

func _choice_selected(index):
	story.choose_choice_index(index)
	for child in $Control/VBoxContainer/HBoxContainer/StoryChoicesContainer.get_children():
		child.queue_free()
	continue_story()

func _async_load_story(ink_story_path):
	_load_story(ink_story_path)
	call_deferred("_async_load_completed")

func _load_story(ink_story_path):
	var ink_story = File.new()
	ink_story.open(ink_story_path, File.READ)
	var content = ink_story.get_as_text()
	ink_story.close()
	self.story = Story.new(content)


func _bind_externals():
	# Uncomment the below line to observe the variables from your ink story.
	# You can observe multiple variables by putting them into the list as the first argument. 
	# story.observe_variables(["variable1", "variable2"], self, "_observe_variables")
	story.bind_external_function("should_show_debug_menu", self, "_should_show_debug_menu")

func _async_load_completed():
	_loading_thread.wait_to_finish()
	_loading_thread = null

	_bind_externals()
	continue_story()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("prompt_pressed")
	if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_up"):
		if $Control/VBoxContainer/HBoxContainer/StoryChoicesContainer.get_child_count() > 1:
			$ClickFX.play()

func when_prompt_pressed():
	$ClickFX.play()
	continue_story()

func show_angel():
	$AudioStreamPlayer2.play()
	$Control/VBoxContainer/HBoxContainer/AnGelContainer.show()


func hide_angel():
	$AudioStreamPlayer2.play()
	$Control/VBoxContainer/HBoxContainer/AnGelContainer.hide()


func _on_StoryChoicesContainer_gui_input(event):
	if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_up"):
		$ClickFX.play()
	pass # Replace with function body.
