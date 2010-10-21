function ediInitWidEntity()
	editor.gui.properties.widEntity = {}
	local widEntity = editor.gui.properties.widEntity

	widEntity.object = CreateScreen(editor.gui.properties.object, "WidEntity", 0, 25, 248, 84)

	widEntity.modelLab = CreateLabel(widEntity.object, "ModelLab", 4, 26, "Model")
	widEntity.scaleLab = CreateLabel(widEntity.object, "ScaleLab", 4, 46, "Scale")
	widEntity.occluderLab = CreateLabel(widEntity.object, "OccluderLab", 4, 66, "Occluder")

	SetGuiObjectColor(widEntity.modelLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widEntity.scaleLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widEntity.occluderLab, 1.0, 1.0, 1.0, 0.6)

	widEntity.modelTxf = CreateTextField(widEntity.object, "ModelTxf", 80, 22, 164, "")
	widEntity.scaleXTxf = CreateTextField(widEntity.object, "ScaleXTxf", 80, 42, 53, "")
	widEntity.scaleYTxf = CreateTextField(widEntity.object, "ScaleYTxf", 135, 42, 53, "")
	widEntity.scaleZTxf = CreateTextField(widEntity.object, "ScaleZTxf", 190, 42, 54, "")
	widEntity.occluderCbx = CreateCheckBox(widEntity.object, "OccluderCbx", 80, 65, false)

	widEntity.minimize = CreateButton(widEntity.object, "Entity", 1, 1, 246, 14, "Entity")

	SetScreenSize(widEntity.object, 248, 16)
end

function ediUpdateWidEntitySelection()
	local widEntity = editor.gui.properties.widEntity
	local sel = ediGetSelection()

	local mdl = GetEntityModel(sel)
	if mdl ~= nil then
		SetTextFieldText(widEntity.modelTxf, GetModelName(mdl))
	else
		SetTextFieldText(widEntity.modelTxf, "")
	end

	local scale = GetEntityScale(sel)
	SetTextFieldText(widEntity.scaleXTxf, tostring(scale.x))
	SetTextFieldText(widEntity.scaleYTxf, tostring(scale.y))
	SetTextFieldText(widEntity.scaleZTxf, tostring(scale.z))

	SetCheckBoxState(widEntity.occluderCbx, IsEntityOccluder(sel))

	SetTextFieldCursorPosition(widEntity.modelTxf, 0)
	SetTextFieldCursorPosition(widEntity.scaleXTxf, 0)
	SetTextFieldCursorPosition(widEntity.scaleYTxf, 0)
	SetTextFieldCursorPosition(widEntity.scaleZTxf, 0)
end

function ediUpdateWidEntity()
	local widEntity = editor.gui.properties.widEntity
	local sel = ediGetSelection()

	if GetGuiObjectEvent(widEntity.minimize) == CLICKED then
		if GetGuiObjectSize(widEntity.object).y > 16 then
			SetScreenSize(widEntity.object, 248, 16)
		else
			SetScreenSize(widEntity.object, 248, 84)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end

	if GetGuiObjectEvent(widEntity.modelTxf) == LOSE_FOCUS then
		if GetEntityModel(sel) ~= nil then
			if string.len(GetTextFieldText(widEntity.modelTxf)) < 1 then
				ClearEntityModel(sel)
			else
				SetModelName(GetEntityModel(sel), GetTextFieldText(widEntity.modelTxf))
			end
		else
			local models = GetSceneModels(editor.scene.object)
			local mdl = BeginList(models)
			local found = false
			while mdl ~= nil do
				if GetModelName(mdl) == GetTextFieldText(widEntity.modelTxf) then
					SetEntityModel(sel, mdl)
					foudn = true
				end
				mdl = GetListNext(models)
			end
			if found == false then SetTextFieldText(widEntity.modelTxf, "") end
		end
	end

	if GetGuiObjectEvent(widEntity.scaleXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widEntity.scaleXTxf, 0, nil)
		SetEntityScale(sel, tonumber(GetTextFieldText(widEntity.scaleXTxf)),
			tonumber(GetTextFieldText(widEntity.scaleYTxf)),
			tonumber(GetTextFieldText(widEntity.scaleZTxf)))
	end

	if GetGuiObjectEvent(widEntity.scaleYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widEntity.scaleYTxf, 0, nil)
		SetEntityScale(sel, tonumber(GetTextFieldText(widEntity.scaleXTxf)),
			tonumber(GetTextFieldText(widEntity.scaleYTxf)),
			tonumber(GetTextFieldText(widEntity.scaleZTxf)))
	end

	if GetGuiObjectEvent(widEntity.scaleZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widEntity.scaleZTxf, 0, nil)
		SetEntityScale(sel, tonumber(GetTextFieldText(widEntity.scaleXTxf)),
			tonumber(GetTextFieldText(widEntity.scaleYTxf)),
			tonumber(GetTextFieldText(widEntity.scaleZTxf)))
	end

	if GetGuiObjectEvent(widEntity.occluderCbx) == STATE_CHANGED then
		SetEntityOccluder(sel, GetCheckBoxState(widEntity.occluderCbx))
	end
end

