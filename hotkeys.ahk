;@author: David Eichiner

; FORMAT FOR PARSING Hotkeys to CHEASHEET:
; <hotkey>::<*><description>
; -> regExPattern = "^([^:]*)::[^:]*;([^:]*)$"
; -> (UNTESTED) regExPattern = "^(.*?)::.*?;(.*?*)$"

;=======================================Variables=========================================================================
#if (!WinExist("ahk_exe idea64.exe"))
;{
	;=======================================Edit=========================================================================

	;#IMPR: delete more than one line (take number as an optional argument; numpad)
	;#TODO: some programs (like OneNote) don't behave properly -> Abfragen welches Programm läuft und dementsprechend anpassen
	#IfWinNotActive ahk_class MozillaWindowClass
	;#IfWinNotActive ahk_class Framework::CFrame
	;^d:: ;delete line (independent of text-cursor(/caret) position)
	;^+Backspace:: Send, {End}+{HOME}{Del}{Backspace} ;delete line (independent of text-cursor(/caret) position)
	^+Backspace:: Send, {End}+{HOME}+{UP}+{END}{Del} ;delete line (independent of text-cursor(/caret) position)
	#IfWinNotActive

	#IfWinNotActive ahk_exe OUTLOOK.exe
	^Enter::Send, {End}{Enter} ;insert new line below(independent of caret position)
	^+Enter::Send, {HOME}{UP}{HOME}{Enter}{UP} ;insert new line above (independent of caret position)
	#IfWinNotActive

	;^+z::Send, ^y ; (rebinding) undo last change
	!RButton::Send, ^z
	!+RButton::Send, ^y


	; !MButton::
	; {
		; Click, left
		; Send, ^v
		; return
	; }

	;=========================================== Copy/Paste ===============================================================
	#IfWinNotActive ahk_class MozillaWindowClass
	; MButton::Send, ^v ; insert clipboard
	#IfWinNotActive

	^+x:: Send, {End}+{UP}+{END}^x 		;cut whole line (with line break; independent of text-cursor(/caret) position)
	^+c:: Send, {HOME}+{END}^c 			;copy whole line (with line break; independent of text-cursor(/caret) position)
	^+v:: Send, {END}{ENTER}^v{HOME} 	;copy whole line (with line break; independent of text-cursor(/caret) position)
	; ^MButton:: 							;copy whole line
	; {
		; Click, left
		; IfWinActive, ahk_exe ONENOTE.exe ;because OneNote sucks
			; Click, left
		; ;Send, {End}+{UP}+{END}^c{DOWN}{HOME}
		; Send, {HOME}+{END}^c
		; return
	; }
	; ^+MButton:: 						;cut whole line
	; {
		; Click, left
		; IfWinActive, ahk_exe ONENOTE.exe ;because OneNote sucks
			; Click, left
		; ;Send, {End}+{UP}+{END}^c{DOWN}{HOME}
		; Send, {HOME}+{END}^x{DEL}
		; return
	; }


	;===========================================Navigation===============================================================
	!DOWN::Send, {PGDN} 	;PgDn
	!UP::Send, {PGUP} 		;PgUp

	#IfWinNotActive ahk_exe ONENOTE.exe
	;!LEFT:: Send, {HOME} 	;jump to Pos1
	;!RIGHT:: Send, {END}	;jump to End
	#IfWinNotActive

	^!WheelUp:: Send, ^+{TAB}
	^!WheelDown:: Send, ^{TAB}


	;===========================================VIM-STYLE-Navigation===============================================================
	!j:: Send, {LEFT} 	;jump to Pos1
	!SC027:: 
	!;::
		Send, {RIGHT}	;jump to End
		return
	!k:: Send, {DOWN}
	!l:: Send, {UP}

	!+j:: Send, {HOME} 	;jump to Pos1
	!+SC027:: 
	!+;:: 
		Send, {END}	;jump to End
		return
		
	!^j:: Send, ^{LEFT} 	;jump to Pos1
	!^SC027:: 
	!^;:: 
		Send, ^{RIGHT}	;jump to End
		return
		
	!o:: Send, {END}{ENTER} ; create a blank line after the current line
	!+o:: Send, {HOME}{ENTER}{UP} ; create a blank line before the current line

	
	;======================================= program manipulation =============================================================

	!+q:: Send, !{F4} ;close window

	;!r:: Run, %windir%\system32\cmd.exe  ;opens a batch cmd line or focuses an existing one
	;!p:: Run, %windir%\system32\WindowsPowerShell\v1.0\PowerShell_ISE.exe ;open powerShell

	#f:: WinActivate ahk_class MozillaWindowClass

	#Enter::Send, #r ;open execute cmd window
	; #e:: ; open Explorer++ (replacing Windows Explorer)
	try {
		Run %fileManager%
	} catch e {
		MsgBox Couldn't run Explorer++.`nPlease make sure the file %fileManager% exists
	}
	return

	^!NumpadEnter::
	^!ENTER:: ; open windows terminal
		Run, %LocalAppData%\Microsoft\WindowsApps\wt.exe,,,PID
		return


	;====================================misc============================================================================
	!F12::keyhistory

	~LAlt Up:: return
	AppsKey:: return
	
#if 
;}