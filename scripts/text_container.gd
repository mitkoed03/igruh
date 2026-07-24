extends VBoxContainer

### Emitted when typing starts
#signal started_typing()
#
### Emitted when typing finishes.
#signal finished_typing()

var previous_text = ""
@onready var history_label: RichTextLabel = %HistoryLabel
@onready var character_label: RichTextLabel = %CharacterLabel
@onready var dialogue_label: DialogueLabel = %DialogueLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue_label.started_typing.connect(on_started_typing)
	dialogue_label.finished_typing.connect(on_finished_typing)
	1
func on_started_typing() -> void:
	history_label.text += previous_text
	
func on_finished_typing() -> void:
	previous_text = "[color=#7e8083]" + character_label.text  + "[/color]" + '\n' + dialogue_label.text + "\n\n"
