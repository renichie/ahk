;©David Eichiner

;This file functions as the entry point for all hotkeys
;- defines global variables
;- includes hotkey files
;- defines global functions


; FORMAT FOR PARSING Hotkeys to CHEATSHEET: (used by ahk_cheatsheet_generator.py)
; <hotkey>::<*><description>
; es wird Zeilenweise geparst mit folgendem Pattern:
; --> regExPattern = "^(.*?)::.*?;(.*?*)$"


;===================================Modifiers | TIPS ===============================================
; !	==	alt
; ^ ==	ctrl
; +	==	shift
; #	==	win_key
; < 	Use the left key of the pair. e.g. <!a is the same as !a except that only the left Alt key will trigger it.
; > 	Use the right key of the pair.
; <^>! 	AltGr (alternate graving)
; Wildcard: Fire the hotkey even if extra modifiers are being held down. This is often used in conjunction with remapping keys or buttons
; TIP: Generell lassen sich die angeschlagenen Keys über den WindowSpy herausfinden (Kontextmenu, rechtsklick auf laufendes Script)
; TIP: multi-line comments im c-style, müssen allerdings am Anfang(!!) der Zeile stehen (sonst geht einiges kaputt)
; TIP: sobald ein Hotkey mehrzeilig wird muss am Ende ein return stehen <-- kann frustrierend zu debuggen sein

;===================================Ideen/TODOs===============================================
;TODO: per shift so machen, dass ich gleich ein Wort einklammere
;das wäre spitze auch für andere Zeichen (bspw. Pfade)
;also: ^+7 -> komplette Zeile wird als pfad geparst (nützlich?)

;===========================================VARIABLES========================================================
HOTKEY_FILE = C:\Users\EichinDa.DONAT-GROUP\workspace\scripts\ahk\main.ahk
;SetWorkingDir, C:\Users\EichinDa.DONAT-GROUP\workspace\scripts\ahk
SLEEP_INTERVAL_MAXIMIZE = 500
SLEEP_INTERVAL_RELOAD = 100
SROLL_SPEED_VERTICAL = 12

;===========================================INCLUDES=========================================================

#include hotkeys.ahk
#include horizontal_scroll.ahk
#include hotstrings.ahk
#include onenote.ahk
#include text_manipulation.ahk
; #include explorer++.ahk
; #include vim_ahk-master/vim.ahk


;===========================================SHUTDOWN=========================================================
^!Backspace:: Shutdown, 4

;===========================================INCLUDES=========================================================
^!p:: ;save+reload this file	
	;Send ^s 
	;MsgBox, success
	Run, %HOTKEY_FILE%
	Sleep, %SLEEP_INTERVAL_RELOAD% ;necessary for now, because popup needs a few ms
	Send, {Enter}
return 

;====================================== MODIFIERS | TIPS ===================================================
; !	==	alt
; ^ ==	ctrl
; +	==	shift
; #	==	win_key
; < 	Use the left key of the pair. e.g. <!a is the same as !a except that only the left Alt key will trigger it.
; > 	Use the right key of the pair.
; <^>! AltGr (alternate graving)
; Wildcard: Fire the hotkey even if extra modifiers are being held down. This is often used in conjunction with remapping keys or buttons
; TIP: Generell lassen sich die angeschlagenen Keys über den WindowSpy herausfinden (Kontextmenu, rechtsklick auf laufendes Script)
; TIP: multi-line comments im c-style, müssen allerdings am Anfang der Zeile stehen!! (wegen downward-compatibility)
;
; syntax hightlighting für notepad++: https://stackoverflow.com/questions/45466733/autohotkey-syntax-highlighting-in-notepad

;===================================Ideen/TODOs===============================================
;TODO: per shift so machen, dass ich gleich ein Wort einklammere
;das wäre spitze auch für andere Zeichen (bspw. Pfade)
;also: ^+7 -> komplette Zeile wird als pfad geparst (nützlich?)
;<^>!+::


