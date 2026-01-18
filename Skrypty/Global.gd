extends Node
enum {NoCam, Cam}
var IsCameraOn := NoCam
var CamTransision := false
var CamUpdate := false

var CurrentCam := 1

var VentDecontamination := false
var VentDecontID = 0
var TripwireID = 0

var IsDoorClosed := false
var Room0State := 0
var Room1State := 0
var Room2State := 0
var Room3State := 0
var Room4State := 0
var Room5State := 0
var Room6State := 0
var Room7State := 0
var Room8State := 0
var Room9State := 0
var Room10State := 0
var Room11State := 0



func _input(event):
	if event.is_action_pressed("statechangedebug"):
		Room1State += 1
		if IsCameraOn == Cam and CurrentCam == 1:
			CamUpdate = true

		
		
		
