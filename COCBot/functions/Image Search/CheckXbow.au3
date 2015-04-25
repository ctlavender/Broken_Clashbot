;CheckXbow.au3
Func checkXbow($xblvl)
	$bumpTolerance = 80
	Local $xbx , $xby
	If _Sleep(500) Then Return
	
	_CaptureRegion()
	For $i = 1 To 50
		If FileExists(@ScriptDir & "\images\xbow\xb" & $xblvl & "-" & String($i) & ".png") Then
				$xbLocation = _ImageSearch(@ScriptDir & "\images\xbow\xb" & $xblvl & "-" & String($i) & ".png", 1, $xbx, $xby, $bumpTolerance) ;check if x-bow exist
				
				If $xbLocation = 1 Then 
					;SetLog("xb" & $xblvl & "-" & String($i) & ".png", $COLOR_BLUE)
					Return True
				EndIf
		EndIf	
	Next
	Return False
EndFunc  
