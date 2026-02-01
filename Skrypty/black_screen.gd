extends MeshInstance2D
signal SetupReady

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalVar.IsStoryMode == true:
		match SaveData.Contents.currentNight:
			0:
				$"../Label".text = "NIGHT_0"
				GlobalVar.BbgAI = 0
				GlobalVar.EtherAi = 0
				GlobalVar.ServoAI = 0 
				GlobalVar.AnalougeAI = 0
				GlobalVar.RandyAI = 0
				GlobalVar.IsEndless = true
			1:
				$"../Label".text = "NIGHT_1"
				GlobalVar.BbgAI = 1
				GlobalVar.EtherAi = 3
				GlobalVar.ServoAI = 0 
				GlobalVar.AnalougeAI = 0
				GlobalVar.RandyAI = 0
				GlobalVar.IsEndless = false
				GlobalVar.DayMultiplier = 1
			2:
				$"../Label".text = "NIGHT_2"
				GlobalVar.BbgAI = 2
				GlobalVar.EtherAi = 5
				GlobalVar.ServoAI = 0 
				GlobalVar.AnalougeAI = 3
				GlobalVar.RandyAI = 0
				GlobalVar.IsEndless = false
				GlobalVar.DayMultiplier = 1
			3:
				$"../Label".text = "NIGHT_3"
				GlobalVar.BbgAI = 3
				GlobalVar.EtherAi = 7
				GlobalVar.ServoAI = 3 
				GlobalVar.AnalougeAI = 5
				GlobalVar.RandyAI = 0
				GlobalVar.IsEndless = false
				GlobalVar.DayMultiplier = 1
			4:
				$"../Label".text = "NIGHT_4"
				GlobalVar.BbgAI = 4
				GlobalVar.EtherAi = 10
				GlobalVar.ServoAI = 5 
				GlobalVar.AnalougeAI = 7
				GlobalVar.RandyAI = 3
				GlobalVar.IsEndless = false
				GlobalVar.DayMultiplier = 1
			5:
				$"../Label".text = "NIGHT_5"
				GlobalVar.BbgAI = 5
				GlobalVar.EtherAi = 10
				GlobalVar.ServoAI = 7 
				GlobalVar.AnalougeAI = 10
				GlobalVar.RandyAI = 5
				GlobalVar.IsEndless = false
				GlobalVar.DayMultiplier = 1.5
			6:
				$"../Label".text = "NIGHT_6"
	else:
		$"../Label".text = "NIGHT_6"
	
	await get_tree().create_timer(5).timeout
	for I in 300:

		$".".self_modulate = Color(1, 1, 1, 1 - float(I)/300)
		$"../Label".self_modulate = Color(1, 1, 1, 1 - float(I)/300)
		await get_tree().process_frame
	$".".visible = false
	$"../Label".visible = false
	GlobalVar.CanCameraMove = true
	SetupReady.emit()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_ai_manager_day_finished() -> void:
	$".".visible = true
	GlobalVar.CanCameraMove = false
	if GlobalVar.IsCameraOn != GlobalVar.NoCam:
		GlobalVar.IsCameraOn = GlobalVar.NoCam
		GlobalVar.CamUpdate = true
		$"../CamEnterExitEffect".play()
	$"../Camera2D".position = Vector2(0, 0)
	await get_tree().create_timer(0.75).timeout
	
	$WestministerChimes.play()
	for I in 1200:
		$".".self_modulate = Color(1, 1, 1, 1 - float(1200-I)/1200)
		await get_tree().process_frame
	await $WestministerChimes.finished
	if GlobalVar.IsStoryMode:
		SaveData.Contents.currentNight = SaveData.Contents.currentNight + 1
		if SaveData.Contents.currentNight == 6:
			SaveData.Contents.currentNight = 0
			SaveData.Contents.isCNunlocked = true
	SaveData._save()
	get_tree().change_scene_to_file("res://Sceny/Menu.tscn")
