
function ediInitWidLight()
	editor.gui.properties.widLight = {}
	local widLight = editor.gui.properties.widLight

	widLight.object = CreateScreen(editor.gui.properties.object, "WidLight", 0, 25, 248, 141)

	widLight.typeLab = CreateLabel(widLight.object, "TypeLab", 4, 26, "Type")
	widLight.colorLab = CreateLabel(widLight.object, "ColorLab", 4, 46, "Color")
	widLight.distanceLab = CreateLabel(widLight.object, "DistanceLab", 4, 66, "Distance")
	widLight.fadeSpeedLab = CreateLabel(widLight.object, "FadeSpeedLab", 4, 86, "Fade Sped")
	widLight.spotConeLab = CreateLabel(widLight.object, "SpotConeLab", 4, 106, "Spot Cone")
	widLight.shadowsLab = CreateLabel(widLight.object, "SpotConeLab", 4, 126, "Shadows")

	SetGuiObjectColor(widLight.typeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widLight.colorLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widLight.distanceLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widLight.fadeSpeedLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widLight.spotConeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widLight.shadowsLab, 1.0, 1.0, 1.0, 0.6)

	widLight.typePoint = CreateButton(widLight.object, "TypePoint", 80, 22, 54, 18, "Point")
	widLight.typeSun = CreateButton(widLight.object, "TypeSun", 134, 22, 55, 18, "Sun")
	widLight.typeSpot = CreateButton(widLight.object, "TypeSpot", 189, 22, 55, 18, "Spot")

	widLight.colorRTxf = CreateTextField(widLight.object, "ColorRTxf", 80, 42, 53, "")
	widLight.colorGTxf = CreateTextField(widLight.object, "ColorGTxf", 135, 42, 53, "")
	widLight.colorBTxf = CreateTextField(widLight.object, "ColorBTxf", 190, 42, 54, "")

	widLight.distanceTxf = CreateTextField(widLight.object, "DistanceTxf", 80, 62, 164, "")
	widLight.fadeSpeedTxf = CreateTextField(widLight.object, "FadeSpeedTxf", 80, 82, 164, "")
	widLight.innerConeTxf = CreateTextField(widLight.object, "InnerConeTxf", 80, 102, 81, "")
	widLight.outerConeTxf = CreateTextField(widLight.object, "OuterConeTxf", 163, 102, 81, "")
	widLight.shadowsCbx = CreateCheckBox(widLight.object, "ShadowsCbx", 80, 124, false)

	widLight.minimize = CreateButton(widLight.object, "Light", 1, 1, 246, 14, "Light")

	SetScreenSize(widLight.object, 248, 16)
end

function ediUpdateWidLightSelection()
	local widLight = editor.gui.properties.widLight
	local sel = ediGetSelection()
	local col = GetLightColor(sel)
	local cone = GetLightCone(sel)

	SetTextFieldText(widLight.colorRTxf, tostring(col.r))
	SetTextFieldText(widLight.colorGTxf, tostring(col.g))
	SetTextFieldText(widLight.colorBTxf, tostring(col.b))

	SetTextFieldText(widLight.distanceTxf, tostring(GetLightDistance(sel)))
	SetTextFieldText(widLight.fadeSpeedTxf, tostring(GetLightFadeSpeed(sel)))
	SetTextFieldText(widLight.innerConeTxf, tostring(cone.x))
	SetTextFieldText(widLight.outerConeTxf, tostring(cone.y))
	SetCheckBoxState(widLight.shadowsCbx, GetLightShadows(sel))

	SetTextFieldCursorPosition(widLight.colorRTxf, 0)
	SetTextFieldCursorPosition(widLight.colorGTxf, 0)
	SetTextFieldCursorPosition(widLight.colorBTxf, 0)
	SetTextFieldCursorPosition(widLight.distanceTxf, 0)
	SetTextFieldCursorPosition(widLight.fadeSpeedTxf, 0)
	SetTextFieldCursorPosition(widLight.innerConeTxf, 0)
	SetTextFieldCursorPosition(widLight.outerConeTxf, 0)
end

function ediUpdateWidLight()
	local widLight = editor.gui.properties.widLight
	local sel = ediGetSelection()

	if GetGuiObjectEvent(widLight.minimize) == CLICKED then
		if GetGuiObjectSize(widLight.object).y > 16 then
			SetScreenSize(widLight.object, 248, 16)
		else
			SetScreenSize(widLight.object, 248, 141)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end

	if GetGuiObjectEvent(widLight.typePoint) == CLICKED then SetLightType(sel, POINT_LIGHT) end
	if GetGuiObjectEvent(widLight.typeSun) == CLICKED then SetLightType(sel, SUN_LIGHT) end
	if GetGuiObjectEvent(widLight.typeSpot) == CLICKED then SetLightType(sel, SPOT_LIGHT) end

	if GetGuiObjectEvent(widLight.colorRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widLight.colorRTxf, 0, nil)
		SetLightColor(sel, tonumber(GetTextFieldText(widLight.colorRTxf)),
			tonumber(GetTextFieldText(widLight.colorGTxf)),
			tonumber(GetTextFieldText(widLight.colorBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widLight.colorGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widLight.colorGTxf, 0, nil)
		SetLightColor(sel, tonumber(GetTextFieldText(widLight.colorRTxf)),
			tonumber(GetTextFieldText(widLight.colorGTxf)),
			tonumber(GetTextFieldText(widLight.colorBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widLight.colorBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widLight.colorBTxf, 0, nil)
		SetLightColor(sel, tonumber(GetTextFieldText(widLight.colorRTxf)),
			tonumber(GetTextFieldText(widLight.colorGTxf)),
			tonumber(GetTextFieldText(widLight.colorBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widLight.distanceTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widLight.distanceTxf, 0, nil)
		SetLightDistance(sel, tonumber(GetTextFieldText(widLight.distanceTxf)))
	end

	if GetGuiObjectEvent(widLight.fadeSpeedTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widLight.fadeSpeedTxf, 0, nil)
		SetLightFadeSpeed(sel, tonumber(GetTextFieldText(widLight.fadeSpeedTxf)))
	end

	if GetGuiObjectEvent(widLight.innerConeTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widLight.innerConeTxf, 0, nil)
		SetLightCone(sel, tonumber(GetTextFieldText(widLight.innerConeTxf)),
			tonumber(GetTextFieldText(widLight.outerConeTxf)))
	end

	if GetGuiObjectEvent(widLight.outerConeTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widLight.outerConeTxf, 0, nil)
		SetLightCone(sel, tonumber(GetTextFieldText(widLight.innerConeTxf)),
			tonumber(GetTextFieldText(widLight.outerConeTxf)))
	end

	if GetGuiObjectEvent(widLight.shadowsCbx) == STATE_CHANGED then
		SetLightShadows(sel, GetCheckBoxState(widLight.shadowsCbx))
	end
end

