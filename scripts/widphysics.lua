
function ediInitWidPhysics()
	editor.gui.properties.widPhysics = {}
	local widPhysics = editor.gui.properties.widPhysics

	widPhysics.prevMouseWheel = 0

	widPhysics.object = CreateScreen(editor.gui.properties.object, "WidPhysics", 0, 25, 248, 311)

	widPhysics.enabledLab = CreateLabel(widPhysics.object, "EnabledLab", 4, 26, "Enabled")
	widPhysics.lengthsLab = CreateLabel(widPhysics.object, "LengthsLab", 4, 46, "Lengths")
	widPhysics.offsetLab = CreateLabel(widPhysics.object, "OffsetLab", 4, 66, "Offset")
	widPhysics.massLab = CreateLabel(widPhysics.object, "MassLab", 4, 86, "Mass")
	widPhysics.linDampLab = CreateLabel(widPhysics.object, "LinDampLab", 4, 106, "LinDamp")
	widPhysics.angDampLab = CreateLabel(widPhysics.object, "AngDampLab", 4, 126, "AngDamp")
	widPhysics.linSleepLab = CreateLabel(widPhysics.object, "LinSleepLab", 4, 146, "LinSleep")
	widPhysics.angSleepLab = CreateLabel(widPhysics.object, "AngSleepLab", 4, 166, "AngSleep")
	widPhysics.restituLab = CreateLabel(widPhysics.object, "RestitutionLab", 4, 186, "Restitu.")
	widPhysics.anisFricLab = CreateLabel(widPhysics.object, "AnisFricLab", 4, 206, "AnisFric")
	widPhysics.linFactorLab = CreateLabel(widPhysics.object, "LinFactorLab", 4, 226, "LinFactor")
	widPhysics.angFactorLab = CreateLabel(widPhysics.object, "AngFactorLab", 4, 246, "AngFactor")
	widPhysics.shapeLab = CreateLabel(widPhysics.object, "ShapeLab", 4, 266, "Shape")

	SetGuiObjectColor(widPhysics.enabledLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.lengthsLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.offsetLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.massLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.linDampLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.angDampLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.linSleepLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.angSleepLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.restituLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.anisFricLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.linFactorLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.angFactorLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widPhysics.shapeLab, 1.0, 1.0, 1.0, 0.6)

	widPhysics.enabledCbx = CreateCheckBox(widPhysics.object, "EnabledCbx", 80, 24, false)
	widPhysics.lengthsX = CreateTextField(widPhysics.object, "LengthsX", 80, 42, 53, "")
	widPhysics.lengthsY = CreateTextField(widPhysics.object, "LengthsY", 135, 42, 53, "")
	widPhysics.lengthsZ = CreateTextField(widPhysics.object, "LengthsZ", 190, 42, 54, "")
	widPhysics.offsetX = CreateTextField(widPhysics.object, "OffsetX", 80, 62, 53, "")
	widPhysics.offsetY = CreateTextField(widPhysics.object, "OffsetY", 135, 62, 53, "")
	widPhysics.offsetZ = CreateTextField(widPhysics.object, "OffsetZ", 190, 62, 54, "")

	widPhysics.massTxf = CreateTextField(widPhysics.object, "MassTxf", 80, 82, 164, "")
	widPhysics.linDampTxf = CreateTextField(widPhysics.object, "LinDampTxf", 80, 102, 164, "")
	widPhysics.angDampTxf = CreateTextField(widPhysics.object, "AngDampTxf", 80, 122, 164, "")
	widPhysics.linSleepTxf = CreateTextField(widPhysics.object, "LinSleepTxf", 80, 142, 164, "")
	widPhysics.angSleepTxf = CreateTextField(widPhysics.object, "AngSleepTxf", 80, 162, 164, "")
	widPhysics.restituTxf = CreateTextField(widPhysics.object, "RestituTxf", 80, 182, 164, "")

	widPhysics.anisFricX = CreateTextField(widPhysics.object, "AnisFricX", 80, 202, 53, "")
	widPhysics.anisFricY = CreateTextField(widPhysics.object, "AnisFricY", 135, 202, 53, "")
	widPhysics.anisFricZ = CreateTextField(widPhysics.object, "AnisFricZ", 190, 202, 54, "")
	widPhysics.linFactorX = CreateTextField(widPhysics.object, "LinFactorX", 80, 222, 53, "")
	widPhysics.linFactorY = CreateTextField(widPhysics.object, "LinFactorY", 135, 222, 53, "")
	widPhysics.linFactorZ = CreateTextField(widPhysics.object, "LinFactorZ", 190, 222, 54, "")
	widPhysics.angFactorX = CreateTextField(widPhysics.object, "AngFactorX", 80, 242, 53, "")
	widPhysics.angFactorY = CreateTextField(widPhysics.object, "AngFactorY", 135, 242, 53, "")
	widPhysics.angFactorZ = CreateTextField(widPhysics.object, "AngFactorZ", 190, 242, 54, "")

	widPhysics.shapeTxl = CreateTextList(widPhysics.object, "Shape", 80, 262, 3, 154)
	AddTextListItem(widPhysics.shapeTxl, " Box")
	AddTextListItem(widPhysics.shapeTxl, " Sphere")
	AddTextListItem(widPhysics.shapeTxl, " Mesh")
	AddTextListItem(widPhysics.shapeTxl, " CapsuleX")
	AddTextListItem(widPhysics.shapeTxl, " CapsuleY")
	AddTextListItem(widPhysics.shapeTxl, " CapsuleZ")
	AddTextListItem(widPhysics.shapeTxl, " ConeX")
	AddTextListItem(widPhysics.shapeTxl, " ConeY")
	AddTextListItem(widPhysics.shapeTxl, " ConeZ")

	widPhysics.shapeScrollBar = CreateSlider(widPhysics.object, "ShapeScrollBar", 238, 266, 0, 37, 1.0)

	widPhysics.minimize = CreateButton(widPhysics.object, "Physics", 1, 1, 246, 14, "Physics")

	SetScreenSize(widPhysics.object, 248, 16)
end

function ediUpdateWidPhysicsSelection()
	local widPhysics = editor.gui.properties.widPhysics

	local sel = ediGetSelection()
	local lengths = GetActorBoundingLengths(sel)
	local offset = GetActorBoundingOffset(sel)
	local anisFric = GetActorAnisotropicFriction(sel)
	local linFactor = GetActorLinearFactor(sel)
	local angFactor = GetActorAngularFactor(sel)

	SetCheckBoxState(widPhysics.enabledCbx, IsActorPhysics(sel))

	SetTextFieldText(widPhysics.lengthsX, tostring(lengths.x))
	SetTextFieldText(widPhysics.lengthsY, tostring(lengths.y))
	SetTextFieldText(widPhysics.lengthsZ, tostring(lengths.z))
	SetTextFieldText(widPhysics.offsetX, tostring(offset.x))
	SetTextFieldText(widPhysics.offsetY, tostring(offset.y))
	SetTextFieldText(widPhysics.offsetZ, tostring(offset.z))

	SetTextFieldText(widPhysics.massTxf, tostring(GetActorMass(sel)))
	SetTextFieldText(widPhysics.linDampTxf, tostring(GetActorLinearDamping(sel)))
	SetTextFieldText(widPhysics.angDampTxf, tostring(GetActorAngularDamping(sel)))
	SetTextFieldText(widPhysics.linSleepTxf, tostring(GetActorLinearSleepThreshold(sel)))
	SetTextFieldText(widPhysics.angSleepTxf, tostring(GetActorAngularSleepThreshold(sel)))
	SetTextFieldText(widPhysics.restituTxf, tostring(GetActorRestitution(sel)))

	SetTextFieldText(widPhysics.anisFricX, tostring(anisFric.x))
	SetTextFieldText(widPhysics.anisFricY, tostring(anisFric.y))
	SetTextFieldText(widPhysics.anisFricZ, tostring(anisFric.z))
	SetTextFieldText(widPhysics.linFactorX, tostring(linFactor.x))
	SetTextFieldText(widPhysics.linFactorY, tostring(linFactor.y))
	SetTextFieldText(widPhysics.linFactorZ, tostring(linFactor.z))
	SetTextFieldText(widPhysics.angFactorX, tostring(angFactor.x))
	SetTextFieldText(widPhysics.angFactorY, tostring(angFactor.y))
	SetTextFieldText(widPhysics.angFactorZ, tostring(angFactor.z))

	SetTextFieldCursorPosition(widPhysics.lengthsX, 0)
	SetTextFieldCursorPosition(widPhysics.lengthsY, 0)
	SetTextFieldCursorPosition(widPhysics.lengthsZ, 0)
	SetTextFieldCursorPosition(widPhysics.offsetX, 0)
	SetTextFieldCursorPosition(widPhysics.offsetY, 0)
	SetTextFieldCursorPosition(widPhysics.offsetZ, 0)

	SetTextFieldCursorPosition(widPhysics.massTxf, 0)
	SetTextFieldCursorPosition(widPhysics.linDampTxf, 0)
	SetTextFieldCursorPosition(widPhysics.angDampTxf, 0)
	SetTextFieldCursorPosition(widPhysics.linSleepTxf, 0)
	SetTextFieldCursorPosition(widPhysics.angSleepTxf, 0)

	SetTextFieldCursorPosition(widPhysics.anisFricX, 0)
	SetTextFieldCursorPosition(widPhysics.anisFricY, 0)
	SetTextFieldCursorPosition(widPhysics.anisFricZ, 0)
	SetTextFieldCursorPosition(widPhysics.linFactorX, 0)
	SetTextFieldCursorPosition(widPhysics.linFactorY, 0)
	SetTextFieldCursorPosition(widPhysics.linFactorZ, 0)
	SetTextFieldCursorPosition(widPhysics.angFactorX, 0)
	SetTextFieldCursorPosition(widPhysics.angFactorY, 0)
	SetTextFieldCursorPosition(widPhysics.angFactorZ, 0)

	SetTextListSelection(widPhysics.shapeTxl, GetActorShape(sel)-1)
end

function ediUpdateWidPhysics()
	local widPhysics = editor.gui.properties.widPhysics
	local sel = ediGetSelection()

	if GetGuiObjectEvent(widPhysics.minimize) == CLICKED then
		if GetGuiObjectSize(widPhysics.object).y > 16 then
			SetScreenSize(widPhysics.object, 248, 16)
		else
			SetScreenSize(widPhysics.object, 248, 311)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end

	if GetGuiObjectEvent(widPhysics.enabledCbx) == STATE_CHANGED then
		if GetCheckBoxState(widPhysics.enabledCbx) then
			local shape = GetActorShape(sel)
			if shape == NONE then
				shape = BOX
				SetTextListSelection(widPhysics.shapeTxl, 0)
			end

			SetActorPhysics(sel, shape, GetActorMass(sel))
		else
			DisableActorPhysics(sel)
		end
	end

	if GetGuiObjectEvent(widPhysics.lengthsX) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.lengthsX, 0, nil)
		SetActorBoundingLengths(sel, tostring(GetTextFieldText(widPhysics.lengthsX)),
			tostring(GetTextFieldText(widPhysics.lengthsY)),
			tostring(GetTextFieldText(widPhysics.lengthsZ)))
	end

	if GetGuiObjectEvent(widPhysics.lengthsY) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.lengthsY, 0, nil)
		SetActorBoundingLengths(sel, tostring(GetTextFieldText(widPhysics.lengthsX)),
			tostring(GetTextFieldText(widPhysics.lengthsY)),
			tostring(GetTextFieldText(widPhysics.lengthsZ)))
	end

	if GetGuiObjectEvent(widPhysics.lengthsZ) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.lengthsZ, 0, nil)
		SetActorBoundingLengths(sel, tostring(GetTextFieldText(widPhysics.lengthsX)),
			tostring(GetTextFieldText(widPhysics.lengthsY)),
			tostring(GetTextFieldText(widPhysics.lengthsZ)))
	end

	if GetGuiObjectEvent(widPhysics.offsetX) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.offsetX, nil, nil)
		SetActorBoundingOffset(sel, tostring(GetTextFieldText(widPhysics.offsetX)),
			tostring(GetTextFieldText(widPhysics.offsetY)),
			tostring(GetTextFieldText(widPhysics.offsetZ)))
	end

	if GetGuiObjectEvent(widPhysics.offsetY) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.offsetY, nil, nil)
		SetActorBoundingOffset(sel, tostring(GetTextFieldText(widPhysics.offsetX)),
			tostring(GetTextFieldText(widPhysics.offsetY)),
			tostring(GetTextFieldText(widPhysics.offsetZ)))
	end

	if GetGuiObjectEvent(widPhysics.offsetZ) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.offsetZ, nil, nil)
		SetActorBoundingOffset(sel, tostring(GetTextFieldText(widPhysics.offsetX)),
			tostring(GetTextFieldText(widPhysics.offsetY)),
			tostring(GetTextFieldText(widPhysics.offsetZ)))
	end

	if GetGuiObjectEvent(widPhysics.massTxf) == LOSE_FOCUS then

	if GetGuiObjectEvent(widPhysics.enabledCbx) == STATE_CHANGED then
		local shape = GetActorShape(sel)
		if shape == NONE then
			shape = BOX
			SetTextListSelection(widPhysics.shapeTxl, 0)
		end

		SetActorPhysics(sel, shape, GetActorMass(sel))
	end
		ediCheckTextFieldFloat(widPhysics.massTxf, 0, nil)
		SetActorPhysics(sel, GetActorShape(sel), tostring(GetTextFieldText(widPhysics.massTxf)))
		if GetCheckBoxState(widPhysics.enabledCbx) == false then DisableActorPhysics(sel) end
	end

	if GetGuiObjectEvent(widPhysics.linDampTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.linDampTxf, 0, nil)
		SetActorDamping(sel, tostring(GetTextFieldText(widPhysics.linDampTxf)),
			GetActorAngularDamping(sel))
	end

	if GetGuiObjectEvent(widPhysics.angDampTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.angDampTxf, 0, nil)
		SetActorDamping(sel, GetActorLinearDamping(sel),
			tostring(GetTextFieldText(widPhysics.angDampTxf)))
	end

	if GetGuiObjectEvent(widPhysics.linSleepTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.linSleepTxf, 0, nil)
		SetActorSleepThresholds(sel, tostring(GetTextFieldText(widPhysics.linSleepTxf)),
			GetActorAngularSleepThreshold(sel))
	end

	if GetGuiObjectEvent(widPhysics.angSleepTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.angSleepTxf, 0, nil)
		SetActorSleepThresholds(sel, GetActorLinearSleepThreshold(sel),
			tostring(GetTextFieldText(widPhysics.angSleepTxf)))
	end

	if GetGuiObjectEvent(widPhysics.restituTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.restituTxf, 0, nil)
		SetActorRestitution(sel, tostring(GetTextFieldText(widPhysics.restituTxf)))
	end

	if GetGuiObjectEvent(widPhysics.anisFricX) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.anisFricX, 0, nil)
		SetActorAnisotropicFriction(sel, tostring(GetTextFieldText(widPhysics.anisFricX)),
			tostring(GetTextFieldText(widPhysics.anisFricY)),
			tostring(GetTextFieldText(widPhysics.anisFricZ)))
	end

	if GetGuiObjectEvent(widPhysics.anisFricY) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.anisFricY, 0, nil)
		SetActorAnisotropicFriction(sel, tostring(GetTextFieldText(widPhysics.anisFricX)),
			tostring(GetTextFieldText(widPhysics.anisFricY)),
			tostring(GetTextFieldText(widPhysics.anisFricZ)))
	end

	if GetGuiObjectEvent(widPhysics.anisFricZ) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.anisFricZ, 0, nil)
		SetActorAnisotropicFriction(sel, tostring(GetTextFieldText(widPhysics.anisFricX)),
			tostring(GetTextFieldText(widPhysics.anisFricY)),
			tostring(GetTextFieldText(widPhysics.anisFricZ)))
	end

	if GetGuiObjectEvent(widPhysics.linFactorX) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.linFactorX, 0, nil)
		SetActorLinearFactor(sel, tostring(GetTextFieldText(widPhysics.linFactorX)),
			tostring(GetTextFieldText(widPhysics.linFactorY)),
			tostring(GetTextFieldText(widPhysics.linFactorZ)))
	end

	if GetGuiObjectEvent(widPhysics.linFactorY) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.linFactorZ, 0, nil)
		SetActorLinearFactor(sel, tostring(GetTextFieldText(widPhysics.linFactorX)),
			tostring(GetTextFieldText(widPhysics.linFactorY)),
			tostring(GetTextFieldText(widPhysics.linFactorZ)))
	end

	if GetGuiObjectEvent(widPhysics.linFactorZ) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.linFactorZ, 0, nil)
		SetActorLinearFactor(sel, tostring(GetTextFieldText(widPhysics.linFactorX)),
			tostring(GetTextFieldText(widPhysics.linFactorY)),
			tostring(GetTextFieldText(widPhysics.linFactorZ)))
	end

	if GetGuiObjectEvent(widPhysics.angFactorX) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.angFactorX, 0, nil)
		SetActorAngularFactor(sel, tostring(GetTextFieldText(widPhysics.angFactorX)),
			tostring(GetTextFieldText(widPhysics.angFactorY)),
			tostring(GetTextFieldText(widPhysics.angFactorZ)))
	end

	if GetGuiObjectEvent(widPhysics.angFactorY) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.angFactorY, 0, nil)
		SetActorAngularFactor(sel, tostring(GetTextFieldText(widPhysics.angFactorX)),
			tostring(GetTextFieldText(widPhysics.angFactorY)),
			tostring(GetTextFieldText(widPhysics.angFactorZ)))
	end

	if GetGuiObjectEvent(widPhysics.angFactorZ) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widPhysics.angFactorZ, 0, nil)
		SetActorAngularFactor(sel, tostring(GetTextFieldText(widPhysics.angFactorX)),
			tostring(GetTextFieldText(widPhysics.angFactorY)),
			tostring(GetTextFieldText(widPhysics.angFactorZ)))
	end

	if GetGuiObjectEvent(widPhysics.shapeTxl) == SELECTION_CHANGED then
		SetActorPhysics(sel, GetTextListSelectionIndex(widPhysics.shapeTxl)+1, GetActorMass(sel))
		if GetCheckBoxState(widPhysics.enabledCbx) == false then DisableActorPhysics(sel) end
	end

	local diff = GetTextListItemCount(widPhysics.shapeTxl)- GetTextListRowCount(widPhysics.shapeTxl)
	if diff > 0 then
		if GetGuiObjectEvent(widPhysics.shapeScrollBar) == VALUE_CHANGED then
			SetTextListOffset(widPhysics.shapeTxl, diff*(1.0-GetSliderValue(widPhysics.shapeScrollBar)))
		end

		if GetGuiTrace(editor.gui.object) ~= nil and
			GetGuiObjectName(GetGuiTrace(editor.gui.object)) ==
			GetGuiObjectName(widPhysics.shapeTxl) then

			local wheelDiff = -(GetMouseWheel() - widPhysics.prevMouseWheel)
			if wheelDiff ~= 0 then
				offset = GetTextListOffset(widPhysics.shapeTxl)+wheelDiff
				if offset < 0 then offset = 0 end
				if offset > diff then offset = diff end

				SetTextListOffset(widPhysics.shapeTxl, offset)
				SetSliderValue(widPhysics.shapeScrollBar, 1.0-(offset/diff))
			end
		end
	else
		SetSliderValue(widFiles.scrollBar, 1.0)
	end

	widPhysics.prevMouseWheel = GetMouseWheel()
end

