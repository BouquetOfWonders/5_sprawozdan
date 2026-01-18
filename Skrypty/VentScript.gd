extends Button
@onready
var Root = $"."
var PressedFor := 0.0
var ShouldLetGo := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Root.button_pressed:
		if PressedFor > 1:
			print("Decontamination")
			PressedFor = 0
			ShouldLetGo = true
			GlobalVar.VentDecontamination = true
			GlobalVar.VentDecontID = int(Root.name)
			print(GlobalVar.VentDecontID)
		elif ShouldLetGo:
			pass
		else:
			PressedFor += delta 
	elif PressedFor > 0 and not ShouldLetGo:
		PressedFor = 0
		GlobalVar.TripwireID = int(Root.name)
	elif ShouldLetGo:
		ShouldLetGo = false
