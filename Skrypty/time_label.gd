extends Label



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVar.IsCameraOn == GlobalVar.Cam and not GlobalVar.IsEndless:
		$".".visible = true
	else:
		$".".visible = false
