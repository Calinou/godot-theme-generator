extends ColorRect

onready var preview := $VBoxContainer/HBoxContainer/Panel as Panel
onready var button_normal_stylebox := preview.theme.get_stylebox("normal", "Button") as StyleBoxFlat
onready var button_hover_stylebox := preview.theme.get_stylebox("hover", "Button") as StyleBoxFlat
onready var button_pressed_stylebox := preview.theme.get_stylebox("pressed", "Button") as StyleBoxFlat
onready var button_focus_stylebox := preview.theme.get_stylebox("focus", "Button") as StyleBoxFlat
onready var button_disabled_stylebox := preview.theme.get_stylebox("disabled", "Button") as StyleBoxFlat


func _ready() -> void:
	# Prevent resizing the application window down to a size that makes it unusable.
	OS.min_window_size = Vector2(640, 420)

	# Apply settings on startup for consistency.
	_on_base_color_changed(Color())
	_on_corner_radius_changed(4)
	_on_corners_beveled_toggled(false)


func _on_base_color_changed(color: Color) -> void:
	button_normal_stylebox.bg_color = color
	button_hover_stylebox.bg_color = color.lightened(0.1)
	button_pressed_stylebox.bg_color = color.darkened(0.1)
	button_disabled_stylebox.bg_color = color.darkened(0.5)


func _on_corner_radius_changed(value: float) -> void:
	for stylebox in [button_normal_stylebox, button_hover_stylebox, button_pressed_stylebox, button_focus_stylebox, button_disabled_stylebox]:
		stylebox.set_corner_radius_all(int(value))


func _on_corners_beveled_toggled(button_pressed: bool) -> void:
	for stylebox in [button_normal_stylebox, button_hover_stylebox, button_pressed_stylebox, button_focus_stylebox, button_disabled_stylebox]:
		stylebox.corner_detail = 1 if button_pressed else 4
