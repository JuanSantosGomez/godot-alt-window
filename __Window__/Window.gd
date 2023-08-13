extends Control

var following = false
var dragging_start_position = Vector2()
var sollowing = false
func _ready():
	$PanelContainer/VBoxContainer/HBoxContainer/Label.text=ProjectSettings.get_setting("application/config/name")
	set_physics_process(false)

func _physics_process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)
	else:
		var ex = get_global_mouse_position().x if get_global_mouse_position().x > 300 else 300
		var ey = get_global_mouse_position().y if get_global_mouse_position().y > 300 else 300
		OS.set_window_size(Vector2(ex,ey))

		$PanelContainer.rect_size=OS.window_size


func _on_dragger_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			if following:
				set_physics_process(true)
			else:
				set_physics_process(false)
			dragging_start_position = get_local_mouse_position()


func _on_Close_pressed():
	get_tree().quit()


func _on_Resize_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			sollowing = !sollowing
			if sollowing:
				set_physics_process(true)
			else:
				set_physics_process(false)
			dragging_start_position = get_local_mouse_position()


