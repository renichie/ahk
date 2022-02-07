;@author: David Eichiner

; FORMAT FOR PARSING Hotkeys to CHEASHEET:
; <hotkey>::<*><description>
; -> regExPattern = "^([^:]*)::[^:]*;([^:]*)$"
; -> (UNTESTED) regExPattern = "^(.*?)::.*?;(.*?*)$"

;=======================================Variables=========================================================================


	!RButton::Send, ^z
	!+RButton::Send, ^y

	;=========================================== Copy/Paste ===============================================================


	^+x:: Send, {End}+{UP}+{END}^x 		;cut whole line (with line break; independent of text-cursor(/caret) position)
	^+c:: Send, {HOME}+{END}^c 			;copy whole line (with line break; independent of text-cursor(/caret) position)
	^+v:: Send, {END}{ENTER}^v{HOME} 	;copy whole line (with line break; independent of text-cursor(/caret) position)


	;===========================================Navigation===============================================================
	;!DOWN::Send, {PGDN} 	;PgDn
	;!UP::Send, {PGUP} 		;PgUp

	^!WheelUp:: Send, ^+{TAB}	;
	^!WheelDown:: Send, ^{TAB}
	
	;===========================================VIM-STYLE-Navigation===============================================================
	!j:: Send, {LEFT} 	;move left

	!SC027:: 
	!;::
		Send, {RIGHT}	;move right (';', 'ö')
		return
	!k:: Send, {DOWN}	;move down
	!l:: Send, {UP}		;move up

	
	^!j:: Send, !{LEFT} 	;move left with alt modifier

	^!SC027:: 
	^!;::
		Send, !{RIGHT}	;move right (';', 'ö')
		return
	^!k:: Send, !{DOWN}	;move down
	^!l:: Send, !{UP}	;move up

	!+j:: Send, {HOME} 	;jump to Pos1
	!+SC027:: 
	!+;:: 
		Send, {END}	;jump to End
		return
		
	!o:: Send, {END}{ENTER} ; create a blank line after the current line
	!+o:: Send, {HOME}{ENTER}{UP} ; create a blank line before the current line

	;=======================================Manipulate running Programs=============================================================

	!+q:: Send, !{F4} ;close window


	^!NumpadEnter::
	^!ENTER:: ; open windows terminal
		Run, %LocalAppData%\Microsoft\WindowsApps\wt.exe,,,PID
		return
		
	;^+NumpadEnter::
	;^+ENTER:: ; open windows terminal
	;	Run, C:\Users\eichinda\AppData\Local\fman\fman.exe,,,PID
	;	return

	;====================================misc============================================================================
	;!F12::keyhistory



	~LAlt Up:: return
	AppsKey:: return
	
	;==================================== application specific shortcuts =================================================================
	; Biquanda umbegen
	#IfWinActive ahk_exe OpenTime.exe
		^a::
		^LEFT:: Send, {F6}
		^d::
		^RIGHT:: Send, {F8}
	#IfWinActive

	/*================================================= Parenthesis Wrapping ===============================================================*/