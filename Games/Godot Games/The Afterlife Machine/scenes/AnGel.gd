
extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (Array, Texture) var frames
export var frame_index = 0 setget set_frame_index

# Called when the node enters the scene tree for the first time.
func _ready():
	if frames:
		texture = frames[0]
	pass # Replace with function body.

func set_frame_index(new_index):
	frame_index = clamp(new_index, 0, len(frames)-1)
	texture = frames[frame_index]

func set_random_frame(sec, start, end):
	while true:
		self.frame_index = start + (randi() % (end-start))
		yield(get_tree().create_timer(sec), "timeout")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
