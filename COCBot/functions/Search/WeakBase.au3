;check if the found base is weak befor attacking by msh2050
Func isweakbase()

	if checkmaxwall() Then
		Return False
	ElseIf CheckmaxXbow() Then
		Return False
	Else
		Return True
	EndIf

EndFunc
Func checkmaxwall()
	if GUICtrlRead($chkoppwall) = $GUI_CHECKED Then
		
		for $i = 7 to ($imaxoppwall ) Step -1
			if checkWallattack($i) Then
				Return True
			EndIf
		Next

			SetLog("Wall level " & ($imaxoppwall + 4) & " or more is not detected", $COLOR_BLUE)

			Return False

	Else
		SetLog("Max wall detection is disabled", $COLOR_BLUE)
		Return False
	EndIf

EndFunc
func CheckmaxXbow()
	Local $xbowAnyPass = True
	if GUICtrlRead($chkxbowlvl) = $GUI_CHECKED and $THmorethannine Then

		for $lv = 4 to ( _GUICtrlComboBox_GetCurSel($xbowlvl) + 1 )step -1
			SetLog("check for X-BOW level " & String($lv) , $COLOR_BLUE)
			if checkXbow(String($lv)) Then
				$xbowAnyPass = False
				SetLog("Found X-BOW level " & String($lv) , $COLOR_RED)
			ExitLoop ;disable this to test all the levels
			Else
				SetLog("No X-BOW level " & String($lv) & " detected" , $COLOR_GREEN)
			EndIf

		Next

	Else
		if GUICtrlRead($chkxbowlvl) = $GUI_UNCHECKED Then
			SetLog("check for X-BOW is disabled " , $COLOR_BLUE)
		ElseIf Not $THmorethannine Then
			SetLog("check for X-BOW is Not needed for this TH" , $COLOR_BLUE)
		EndIf
		Return False
	EndIf

	if $xbowAnyPass Then
		SetLog("No X-BOW detected" , $COLOR_GREEN)
		Return False
	Else
		Return True
	EndIf

EndFunc
