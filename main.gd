extends ColorRect


onready var preview := $VBoxContainer/HBoxContainer/Panel

func _ready() -> void:
	# Prevent resizing the application window down to a size that makes it unusable.
	OS.min_window_size = Vector2(640, 420)


func _on_base_color_changed(color: Color) -> void:
	preview.theme.get_stylebox("normal", "Button").bg_color = color
