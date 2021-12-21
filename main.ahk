;This file functions as the entry point for all hotkeys
;- defines global variables
;- includes hotkey files
;- defines global functions

; !!!DEPRECATED!!!
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
; syntax hightlighting für notepad++: https://stackoverflow.com/questions/45466733/autohotkey-syntax-highlighting-in-notepad

;===========================================VARIABLES========================================================
HOTKEY_FILE = C:\Users\bernd\workspace\ahk\main.ahk
SLEEP_INTERVAL_MAXIMIZE = 500
SLEEP_INTERVAL_RELOAD = 100
SROLL_SPEED_VERTICAL = 12

;===========================================INCLUDES=========================================================
#include hotkeys.ahk
#include horizontal_scroll.ahk
#include hotstrings.ahk
#include text_manipulation.ahk

;===========================================SHUTDOWN=========================================================
^!Backspace:: Shutdown, 4

;===========================================INCLUDES=========================================================
^!l:: ;save+reload this file	
	Send ^s 
	MsgBox, success
	Run, %HOTKEY_FILE%
	Sleep, %SLEEP_INTERVAL_RELOAD% ;necessary for now, because popup needs a few ms
	Send, {Enter}
return 

