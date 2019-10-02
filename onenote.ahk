;======================================OneNote specific Hotkeys======================================================
#IfWinActive ahk_exe ONENOTE.exe
	^UP::			Send, ^{PGUP}
	^DOWN::			Send, ^{PGDN}
	^!Left::		Send, ^+{TAB}	;
	^!RIGHT::		Send, ^{TAB}
	^!WheelUp:: 	Send, ^+{TAB}	;
	^!WheelDown:: 	Send, ^{TAB}
	!WheelDown:: 	Send, !{Right}	; Seite vor
	!WheelUP:: 		Send, !{Left}	; Seite zurück
;/*	

; mark_mode_active := false
; If mark_mode_active
; {
;	if mark_mode_active
;		^NumPad1::
;	else
		; ; if(GetKeyState(NumPad0))
			; ; MsgBox NumPad0 pressed
		; ; MsgBox, %a_priorkey%
		
		; ; MsgBox, %A_ThisHotkey%
		
		; if A_ThisHotkey = ^NumPad1
		; {
			; dx1 := 175
			; dy1 := -40
			; dx2 := 160
			; dy2 := 80
		; }
		; else if (A_ThisHotkey = ^NumPad2)
		; {
			; dx := 155
			; dy := 47
		; }
		; else if (A_ThisHotkey = ^NumPad3)
		; {
			; dx := 155
			; dy := 47
		; }
		; else if (A_ThisHotkey = ^NumPad4)
		; {
			; dx := 155
			; dy := 47
		; }
		
		; KeyWait, LButton, D   ; <================= USEFUL!!!
		; ; CoordMode, Mouse, Client
		
		; MouseGetPos, x, y
		; ; Click, Right
		; Click, Left, 2
		; ; MouseMove 0, 0
		; ; CoordMode, Mouse, Client
		; MouseMove x+dx1, y+dy1
		; Sleep 1000
		; Click, Left
		; MouseMove x+dx2, y+dy2
		; Sleep 1000
		; Click, Left
		; Send {ESC}
		; ; Send ^+f
		; CoordMode, Mouse, Client
		; MouseMove x, y
		; return
	; }
	;return
; }
;*/

	^h:: ; [OneNote] springt zur Übersichtsseite (oder eher: 1. Notebook, 1. Seite)
	^MButton:: 		; [OneNote] springt zur Übersichtsseite (oder eher: 1. Notebook, 1. Seite)
		Send, ^g{Down}{Enter} 
		return
	
	^l:: ; [OneNote] Verweis auf Absatz kopieren (auch für Seiten verwendbar)
	^+MButton:: ; [OneNote] Verweis auf Absatz kopieren (auch für Seiten verwendbar)
	{
		Click, Right
		Loop 5
			Send, {DOWN}
		Send, {ENTER}
		return
	}
	
^d::
^+Backspace:: Send, {End}+{UP}+{UP}+{END}{Del} ;delete line (independent of text-cursor(/caret) position)
	
#IfWinActive ;EndIF OneNote