extends TextureButton


# Called when the node enters the scene tree for the first time.


func _on_button_down() -> void:
	GlobalVar.IsDoorClosed = true


func _on_button_up() -> void:
	GlobalVar.IsDoorClosed = false
