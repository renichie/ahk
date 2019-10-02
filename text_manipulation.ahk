; TODO haut so noch nicht hin. Ich muss erkennen was für ein wort ich da hab
	
!Numpad1:: ;wraps a line into parenthesis
	Send, ^{Left}(^{Right}{Left})
	return
^!Numpad1:: ;wraps a line into parenthesis
	Send, {HOME}({END})
	return

!Numpad2:: ;wraps word in quotation marks
	Send ^{Left}"^{Right}{Left}"
	return
^!Numpad2:: ;wraps word in quotation marks
	Send {HOME}"{END}"
	return
	