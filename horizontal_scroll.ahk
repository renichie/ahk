~LShift & WheelUp::  ; Scroll left.
ControlGetFocus, fcontrol, A
Loop %SROLL_SPEED_VERTICAL%  ; <-- Increase or decrease this value to scroll faster or slower.
	SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 0 after it is SB_LINERIGHT.
return

~LShift & WheelDown::  ; Scroll right.
ControlGetFocus, fcontrol, A
Loop %SROLL_SPEED_VERTICAL%  ; <-- Increase or decrease this value to scroll faster or slower.
	SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 1 after it is SB_LINELEFT.
return