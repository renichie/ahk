;======================================OneNote specific Hotkeys======================================================
#IfWinActive ahk_exe ONENOTE.exe
	^w::
	^UP::			Send, ^{PGUP}
	^s::
	^DOWN::			Send, ^{PGDN}
	^!Left::		Send, ^+{TAB}	;
	^!RIGHT::		Send, ^{TAB}
	^!WheelUp:: 	Send, ^+{TAB}	;
	^!WheelDown:: 	Send, ^{TAB}
	!WheelDown:: 	Send, !{Right}	; [OneNote] Seite vor
	!WheelUP:: 		Send, !{Left}	; [OneNote] Seite zurUEck
	^LButton:: 						; [OneNote] mark line under mouse button --> <C> doubleklick markiert alles
	{
		Click, left
		Click, left
		;Send, ^a
		Send, ^!h
		return
	}

	^h:: 			; [OneNote] springt zur UEbersichtsseite (oder eher: 1. Notebook, 1. Seite)
	^MButton:: 		; [OneNote] springt zur UEbersichtsseite (oder eher: 1. Notebook, 1. Seite)
		Send, ^g{Down}{Enter} 
		return
	
	^l:: 			; [OneNote] Verweis auf Absatz kopieren (auch fUEr Seiten verwendbar)
	^+MButton:: 	; [OneNote] Verweis auf Absatz kopieren (auch fUEr Seiten verwendbar)
	{
		Click, Right
		Loop 5
			Send, {DOWN}
		Send, {ENTER}
		return
	}
	
	^d::
	^+Backspace:: Send, {HOME}+{End}+{UP}{Del}{Del} ; [OneNote] delete line (independent of text-cursor(/caret) position)
	
	^+7::
		Send, {HOME}({END})
	
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

#IfWinActive ;EndIF OneNote