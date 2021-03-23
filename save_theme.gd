extends Button

onready var preview := $"../../Panel" as Panel


func _pressed() -> void:
	# ISO 8601-like date format.
	var datetime := OS.get_datetime()
	for key in datetime:
		datetime[key] = str(datetime[key]).pad_zeros(2)

	var directory := Directory.new()
	var output_dir := "user://themes/theme_{year}-{month}-{day}_{hour}.{minute}.{second}" \
			.format(datetime)
	directory.make_dir_recursive(output_dir)
	ResourceSaver.save(output_dir.plus_file("theme.tres"), preview.theme)
	OS.shell_open(ProjectSettings.globalize_path(output_dir))
