;==================================================== logins ====================================================================================
global alm_login := "tu8shp", alm_pw := @TaskVM12019
;===================================================== Mouse Coordinates ===========================================================================
insert_procedure_x := 260
insert_procedure_y := 115

;========================================================== modes =================================================================================
debug_mode_active 	:= false
insert_mode_active 	:= false
wrap_mode_active 	:= false
;F1:: debug_mode_active 	:= !debug_mode_active 		;toggle debug mode
F1:: set_mode("debug") 		;toggle debug mode
F2:: set_mode("insert") 	;toggle insert mode
F3:: set_mode("wrap")		;toggle wrap mode
set_mode(mode) {
	global
	if (mode == "debug") {
		debug_mode_active := !debug_mode_active 
		if (debug_mode_active) {
			insert_mode_active 	:= false
			wrap_mode_active 	:= false
		}
		return
	}
	else if (mode == "insert") {
		insert_mode_active := !insert_mode_active 
		if (insert_mode_active) {
			debug_mode_active 	:= false
			wrap_mode_active 	:= false
		}
		return
	}
	else if (mode == "wrap") {
		wrap_mode_active := !wrap_mode_active 
		if (wrap_mode_active) {
			insert_mode_active 	:= false
			debug_mode_active 	:= false
		}
		return
	}
	return
}	

select_dropdown_entry(X1, Y1, X2, Y2) {
	MouseMove X1, Y1
	Click, left
	MouseMove X1+200, Y1
	MouseMove X2, Y2
	Click, left
	return
}

/*
	if !(WinActive ahk_class SunAwtFrame)
		WinActivate ahk_class SunAwtFrame
	;WinGetTitle, qftTitle,,D:\QF-Test_Repo\AVx_Testumgebung
	WinGetTitle, qftTitle, A
	;MsgBox, %qftTitle%
	WinSetTitle, debug_mode_active
	;WinSetTitle, "asdf"
*/

;==================================================================== Navigation ====================================================================

^NumpadEnter:: ;enters the WB pw in the WB login dialog (user: test.qftest01)
	if !(WinActive ahk_class SWT_Window0)
		WinActivate ahk_class SWT_Window0
	CoordMode, Mouse, Client
	MouseMove 200, 100
	Send, tetestuser123{Enter}
	return
;==================================================================== Navigation ====================================================================
#IfWinActive ahk_class SunAwtFrame ;QFTest class

^LEFT::			Send ^{BackSpace} ;springt einen Knoten zurück
^WheelUp:: 		Send ^{BackSpace} ;springt einen Knoten zurück
^RIGHT::		Send ^+{BackSpace};springt einen Knoten vor
^WheelDown:: 	Send ^+{BackSpace};springt einen Knoten vor

#IfWinActive
;==================================================================== View manipulation ====================================================================
#IfWinActive ahk_class SunAwtFrame ;QFTest class
^p:: ; toggle Project view
{
	Send !a
	Loop 2
		Send, {DOWN}
	Send, {Enter}
	return
}
#IfWinActive
;==================================================================== run/debug flow ====================================================================
; direct Mouse movement is preferred over selecting the menu items through moving with arrow buttons, 
; because it is more robust regarding run context (not all funcitons are available all the time)
#If debug_mode_active
{
	^NumpadDot:: ; reset all
		WinActivate ahk_class SunAwtFrame
		Send, !u
		CoordMode, Mouse, Client
		MouseMove 600, 360
		Click, Left
		return
		
	^Numpad0:: ; reset all
		WinActivate ahk_class SunAwtFrame
		Send, !w
		CoordMode, Mouse, Client
		MouseMove 500, 220
		Click, Left
		test_running := false
		return
		
	^Numpad1:: ; start testrun
		; MsgBox, %debug_mode_active%
		WinActivate ahk_class SunAwtFrame
		Send, {HOME}
		Send, {Enter}
		test_running := true
		return
		
	^Numpad2:: ; pause testrun
		WinActivate ahk_class SunAwtFrame
		Send, {F9}
		return
		
	; #If test_running
	; {
			
		^Numpad3:: ; stop testrun
			WinActivate ahk_class SunAwtFrame
			Send, !w
			Send, {DOWN}{Enter}
			test_running := false
			return

		^Numpad4:: ; execute single step
			WinActivate ahk_class SunAwtFrame
			Send, {F7}
			return
			
		^Numpad5:: ; execute to end of node
			WinActivate ahk_class SunAwtFrame
			Send, ^{F7}
			return
			
		^Numpad6:: ; execute whole node
			WinActivate ahk_class SunAwtFrame
			Send, {F8}
			return
			
		^Numpad7:: ; skip node
			WinActivate ahk_class SunAwtFrame
			Send, +{F9}
			return
			
		^Numpad8:: ; jump out of node
			WinActivate ahk_class SunAwtFrame
			Send, ^{F9}
			return
	; }#If
}#If
;==================================================================== INSERTs ====================================================================
;;/*
#IfWinActive ahk_class SunAwtFrame ;QFTest class
	#If insert_mode_active
	{
		^Numpad1:: ; insert package
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 115, 450, 165)
			return
		^Numpad2:: ; insert procedure
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 115, 450, 110)
			return
		^Numpad3:: ; insert return
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 115, 450, 190)
			return
		^Numpad4:: ; insert loop
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 140, 450, 140)
			return
		^Numpad5:: ; insert break
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 140, 450, 185)
			return
		^Numpad6:: ; insert if
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 140, 450, 210)
			return
		^Numpad7:: ; insert else
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 140, 450, 260)
			return
		^Numpad8:: ; insert SUT Skript
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 140, 450, 400)
			return
		^Numpad9:: ; insert Server Skript
			Send, !e
			CoordMode, Mouse, Client
			select_dropdown_entry(260, 140, 450, 420)
			return
	} #If
#IfWinActive
;*/
;==================================================================== Wrap nodes ====================================================================
#IfWinActive ahk_class SunAwtFrame ;QFTest class
^u::
	SplashTextOn, , , Displays only a title bar.
	Sleep, 2000
	SplashTextOn, 400, 300, Clipboard, The clipboard contains:`n%clipboard%
	WinMove, Clipboard, , 0, 0  ; Move the splash window to the top left corner.
	MsgBox, Press OK to dismiss the SplashText
	SplashTextOff
	return
#IfWinActive

;==================================================================== general (integrate with hotkey file later - dont edit it on this machine"!!) ====================================================================
^+x:: Send, {End}+{UP}+{END}^x 		;cut whole line (with line break; independent of text-cursor(/caret) position)
^+c:: Send, {HOME}+{END}^c 			;copy whole line (with line break; independent of text-cursor(/caret) position)
^+v:: Send, {END}{ENTER}^v{HOME} 	;copy whole line (with line break; independent of text-cursor(/caret) position)
^MButton:: 							;copy whole line
{
	Click, left
	IfWinActive, ahk_exe ONENOTE.exe ;because OneNote sucks
		Click, left
	;Send, {End}+{UP}+{END}^c{DOWN}{HOME}
	Send, {HOME}+{END}^c
	return
}
^+MButton:: 						;cut whole line
{
	Click, left
	IfWinActive, ahk_exe ONENOTE.exe ;because OneNote sucks
		Click, left
	;Send, {End}+{UP}+{END}^c{DOWN}{HOME}
	Send, {HOME}+{END}^x{DEL}
	return
}

;======================================================================== ALM =========================================================================
#IfWinExists ahk_class IEFrame
^+i:: ; login to ALM
	global alm_login
	SetTitleMatchMode, 2 ; A window's title can contain WinTitle anywhere inside it to be a match. 
	WinActivate, HPE Application Lifecycle Management
	; ControlGetFocus, ctrl, A
	; if (%ctrl%==WindowsForms10.EDIT.app.0.141b42a_r14_ad12)
	Send, {HOME}+{END}{DEL} ; delete text first
	MsgBox, %alm_login%
	Send, %alm_login%
	; Send, tu8shp
	Send, {TAB}
	Send, {HOME}+{END}{DEL} ; delete text first
	; Send, @TaskVM12019
	Send, %alm_pw%
	Send, {Enter}
	Send, {Enter}
	return
#IfWinExists