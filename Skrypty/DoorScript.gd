extends AnimatedSprite2D
@onready
var root = $"."

func _input(event):
	if event.is_action_pressed("DoorKey"):
		GlobalVar.IsDoorClosed = true
	elif event.is_action_released("DoorKey"):
		GlobalVar.IsDoorClosed = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVar.IsCameraOn == 0:
		if GlobalVar.IsDoorClosed == false and root.frame != 0:
			root.play_backwards()
		elif GlobalVar.IsDoorClosed == true and root.frame != 11:
			root.play()
	if GlobalVar.IsCameraOn == 1:
		root.visible = false
	else:
		root.visible = true
