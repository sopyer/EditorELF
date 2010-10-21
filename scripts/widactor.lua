
function ediInitWidActor()
	editor.gui.properties.widActor = {}
	local widActor = editor.gui.properties.widActor

	widActor.object = CreateScreen(editor.gui.properties.object, "WidActor", 0, 25, 248, 105)

	widActor.nameLab = CreateLabel(widActor.object, "nameLab", 4, 26, "Name")
	widActor.positionLab = CreateLabel(widActor.object, "positionLab", 4, 46, "Position")
	widActor.rotationLab = CreateLabel(widActor.object, "rotationLab", 4, 66, "Rotation")
	widActor.scriptLab = CreateLabel(widActor.object, "scriptLab", 4, 86, "Script")

	SetGuiObjectColor(widActor.nameLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widActor.positionLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widActor.rotationLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widActor.scriptLab, 1.0, 1.0, 1.0, 0.6)

	widActor.nameTxf = CreateTextField(widActor.object, "NameTxf", 80, 22, 164, "")
	widActor.positionX = CreateTextField(widActor.object, "PositionX", 80, 42, 53, "")
	widActor.positionY = CreateTextField(widActor.object, "PositionY", 135, 42, 53, "")
	widActor.positionZ = CreateTextField(widActor.object, "PositionZ", 190, 42, 54, "")
	widActor.rotationX = CreateTextField(widActor.object, "RotationX", 80, 62, 53, "")
	widActor.rotationY = CreateTextField(widActor.object, "RotationY", 135, 62, 53, "")
	widActor.rotationZ = CreateTextField(widActor.object, "RotationZ", 190, 62, 54, "")
	widActor.scriptTxf = CreateTextField(widActor.object, "ScriptTxf", 80, 82, 144, "")
	widActor.openScript = CreateButton(widActor.object, "Script", 226, 82, 18, 18, "..")

	widActor.minimize = CreateButton(widActor.object, "Actor", 1, 1, 246, 14, "Actor")	
end

function ediUpdateWidActorSelection()
	local widActor = editor.gui.properties.widActor

	local sel = ediGetSelection()
	local pos = GetActorPosition(sel)
	local rot = GetActorRotation(sel)
	local script = GetActorScript(sel)

	SetTextFieldText(widActor.nameTxf, GetActorName(sel))
	SetTextFieldText(widActor.positionX, tostring(pos.x))
	SetTextFieldText(widActor.positionY, tostring(pos.y))
	SetTextFieldText(widActor.positionZ, tostring(pos.z))
	SetTextFieldText(widActor.rotationX, tostring(rot.x))
	SetTextFieldText(widActor.rotationY, tostring(rot.y))
	SetTextFieldText(widActor.rotationZ, tostring(rot.z))
	if script ~= nil then SetTextFieldText(widActor.scriptTxf, GetScriptName(script))
	else SetTextFieldText(widActor.scriptTxf, "") end

	SetTextFieldCursorPosition(widActor.nameTxf, 0)
	SetTextFieldCursorPosition(widActor.positionX, 0)
	SetTextFieldCursorPosition(widActor.positionY, 0)
	SetTextFieldCursorPosition(widActor.positionZ, 0)
	SetTextFieldCursorPosition(widActor.rotationX, 0)
	SetTextFieldCursorPosition(widActor.rotationY, 0)
	SetTextFieldCursorPosition(widActor.rotationZ, 0)
	SetTextFieldCursorPosition(widActor.scriptTxf, 0)
end

function ediWidActorOpenScript(path)
	if path == "" then return true end

	scr = CreateScriptFromFile(path)

	if scr ~= nil then
		SetActorScript(ediGetSelection(), scr)
		ediUpdateWidActorSelection()
		return true
	end

	return false
end

function ediUpdateWidActor()
	local widActor = editor.gui.properties.widActor
	local sel = ediGetSelection()

	if GetGuiObjectEvent(widActor.minimize) == CLICKED then
		if GetGuiObjectSize(widActor.object).y > 16 then
			SetScreenSize(widActor.object, 248, 16)
		else
			SetScreenSize(widActor.object, 248, 105)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end

	if GetGuiObjectEvent(widActor.nameTxf) == LOSE_FOCUS then
		if string.len(GetTextFieldText(widActor.nameTxf)) < 1 then
			SetTextFieldText(widActor.nameTxf, GetActorName(ediGetSelection()))
		else
			SetActorName(ediGetSelection(), GetTextFieldText(widActor.nameTxf))
		end
	end

	if GetGuiObjectEvent(widActor.positionX) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widActor.positionX, nil, nil)
		SetActorPosition(sel, tonumber(GetTextFieldText(widActor.positionX)),
			tonumber(GetTextFieldText(widActor.positionY)),
			tonumber(GetTextFieldText(widActor.positionZ)))
	end

	if GetGuiObjectEvent(widActor.positionY) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widActor.positionY, nil, nil)
		SetActorPosition(sel, tonumber(GetTextFieldText(widActor.positionX)),
			tonumber(GetTextFieldText(widActor.positionY)),
			tonumber(GetTextFieldText(widActor.positionZ)))
	end

	if GetGuiObjectEvent(widActor.positionZ) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widActor.positionY, nil, nil)
		SetActorPosition(sel, tonumber(GetTextFieldText(widActor.positionX)),
			tonumber(GetTextFieldText(widActor.positionY)),
			tonumber(GetTextFieldText(widActor.positionZ)))
	end

	if GetGuiObjectEvent(widActor.rotationX) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widActor.rotationX, nil, nil)
		SetActorRotation(sel, tonumber(GetTextFieldText(widActor.rotationX)),
			tonumber(GetTextFieldText(widActor.rotationY)),
			tonumber(GetTextFieldText(widActor.rotationZ)))
	end

	if GetGuiObjectEvent(widActor.rotationY) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widActor.rotationY, nil, nil)
		SetActorRotation(sel, tonumber(GetTextFieldText(widActor.rotationX)),
			tonumber(GetTextFieldText(widActor.rotationY)),
			tonumber(GetTextFieldText(widActor.rotationZ)))
	end

	if GetGuiObjectEvent(widActor.rotationZ) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widActor.rotationY, nil, nil)
		SetActorRotation(sel, tonumber(GetTextFieldText(widActor.rotationX)),
			tonumber(GetTextFieldText(widActor.rotationY)),
			tonumber(GetTextFieldText(widActor.rotationZ)))
	end

	if GetGuiObjectEvent(widActor.scriptTxf) == LOSE_FOCUS then
		if GetActorScript(sel) ~= nil then
			if string.len(GetTextFieldText(widActor.scriptTxf)) < 1 then
				ClearActorScript(sel)
			else
				SetScriptName(GetActorScript(sel), GetTextFieldText(widActor.scriptTxf))
			end
		else
			local scripts = GetSceneScripts(editor.scene.object)
			local scr = BeginList(scripts)
			local found = false
			while scr ~= nil do
				if GetScriptName(scr) == GetTextFieldText(widActor.scriptTxf) then
					SetActorScript(sel, scr)
					found = true
					break
				end
				scr = GetListNext()
			end
			if found == false then SetTextFieldText(widActor.scriptTxf, "") end
		end
	elseif GetGuiObjectEvent(widActor.scriptTxf) == DROP then
		if GetGuiObjectName(editor.gui.toolbox.widFiles.fileList) == GetGuiObjectName(GetGuiDragObject(editor.gui.object)) then
			local scr = CreateScriptFromFile(ediGetWidFilesDirectory() .. string.sub(GetGuiDragContent(editor.gui.object), 2))
			if scr ~= nil then
				SetActorScript(sel, scr)
				SetTextFieldText(widActor.scriptTxf, GetScriptName(scr))
			end
		end
	end

	if GetGuiObjectEvent(widActor.openScript) == CLICKED then
		ediOpenFileDialog(nil, EDI_OPEN, ediWidActorOpenScript)
	end
end

