#IfWinActive ahk_exe Explorer++.exe
WheelUP:: ;move back folder in history
	CoordMode, Mouse, Client
	MouseGetPos, xpos, ypos
	MouseMove 20, 20
	Click, Left
	MouseMove %xpos%, %ypos%
	return
	
WheelDOWN:: ; move forward folder in history
	CoordMode, Mouse, Client
	MouseGetPos, xpos, ypos
	MouseMove 95, 20
	Click, Left
	MouseMove %xpos%, %ypos%
	return
	
RButton:: ; deactivate right click (because it crashes explorer++ ^^)
	return
	
#IfWinActive