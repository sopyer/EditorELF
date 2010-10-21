
function ediInitWidShaft()
	editor.gui.properties.widShaft = {}
	local widShaft = editor.gui.properties.widShaft

	widShaft.object = CreateScreen(editor.gui.properties.object, "WidShaft", 0, 25, 248, 109)

	widShaft.enabledLab = CreateLabel(widShaft.object, "EnabledLab", 4, 26, "Enabled")
	widShaft.sizeLab = CreateLabel(widShaft.object, "SizeLab", 4, 46, "Size")
	widShaft.intensityLab = CreateLabel(widShaft.object, "IntensityLab", 4, 66, "Intensity")
	widShaft.fadeOffLab = CreateLabel(widShaft.object, "FadeOffLab", 4, 86, "FadeOff")

	SetGuiObjectColor(widShaft.enabledLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widShaft.sizeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widShaft.intensityLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widShaft.fadeOffLab, 1.0, 1.0, 1.0, 0.6)

	widShaft.enabledCbx = CreateCheckBox(widShaft.object, "EnabledCbx", 80, 24, false)
	widShaft.sizeTxf = CreateTextField(widShaft.object, "SizeTxf", 80, 42, 164, "")
	widShaft.intensityTxf = CreateTextField(widShaft.object, "IntensityTxf", 80, 62, 164, "")
	widShaft.fadeOffTxf = CreateTextField(widShaft.object, "FaceOffTxf", 80, 82, 164, "")

	widShaft.minimize = CreateButton(widShaft.object, "Shaft", 1, 1, 246, 14, "Shaft")

	SetScreenSize(widShaft.object, 248, 16)
end

function ediUpdateWidShaftSelection()
	local widShaft = editor.gui.properties.widShaft
	local sel = ediGetSelection()

	SetCheckBoxState(widShaft.enabledCbx, IsLightShaft(sel))
	SetTextFieldText(widShaft.sizeTxf, tostring(GetLightShaftSize(sel)))
	SetTextFieldText(widShaft.intensityTxf, tostring(GetLightShaftIntensity(sel)))
	SetTextFieldText(widShaft.fadeOffTxf, tostring(GetLightShaftFadeOff(sel)))

	SetTextFieldCursorPosition(widShaft.sizeTxf, 0)
	SetTextFieldCursorPosition(widShaft.intensityTxf, 0)
	SetTextFieldCursorPosition(widShaft.fadeOffTxf, 0)
end

function ediUpdateWidShaft()
	local widShaft = editor.gui.properties.widShaft
	local sel = ediGetSelection()

	if GetGuiObjectEvent(widShaft.minimize) == CLICKED then
		if GetGuiObjectSize(widShaft.object).y > 16 then
			SetScreenSize(widShaft.object, 248, 16)
		else
			SetScreenSize(widShaft.object, 248, 109)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end

	if GetGuiObjectEvent(widShaft.enabledCbx) == STATE_CHANGED then
		if GetCheckBoxState(widShaft.enabledCbx) then
			SetLightShaft(sel, GetLightShaftSize(sel), GetLightShaftIntensity(sel), GetLightShaftFadeOff(sel))
		else
			DisableLightShaft(sel)
		end
	end

	if GetGuiObjectEvent(widShaft.sizeTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widShaft.sizeTxf, 0, nil)
		SetLightShaft(sel, tonumber(GetTextFieldText(widShaft.sizeTxf)), GetLightShaftIntensity(sel),
			GetLightShaftFadeOff(sel))
		if GetCheckBoxState(widShaft.enabledCbx) == false then DisableLightShaft(sel) end	
	end

	if GetGuiObjectEvent(widShaft.intensityTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widShaft.intensityTxf, 0, nil)
		SetLightShaft(sel, GetLightShaftSize(sel), tonumber(GetTextFieldText(widShaft.intensityTxf)),
			GetLightShaftFadeOff(sel))
		if GetCheckBoxState(widShaft.enabledCbx) == false then DisableLightShaft(sel) end	
	end

	if GetGuiObjectEvent(widShaft.fadeOffTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widShaft.fadeOffTxf, 0, nil)
		SetLightShaft(sel, GetLightShaftSize(sel), GetLightShaftIntensity(sel),
			tonumber(GetTextFieldText(widShaft.fadeOffTxf)))
		if GetCheckBoxState(widShaft.enabledCbx) == false then DisableLightShaft(sel) end	
	end
end

