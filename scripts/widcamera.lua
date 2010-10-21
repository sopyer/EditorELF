
function ediInitWidCamera()
	editor.gui.properties.widCamera = {}
	local widCamera = editor.gui.properties.widCamera

	widCamera.object = CreateScreen(editor.gui.properties.object, "WidCamera", 0, 25, 248, 86)

	widCamera.fovLab = CreateLabel(widCamera.object, "FovLab", 4, 26, "Fov")
	widCamera.clipLab = CreateLabel(widCamera.object, "ClipLab", 4, 46, "Clip")

	SetGuiObjectColor(widCamera.fovLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widCamera.clipLab, 1.0, 1.0, 1.0, 0.6)

	widCamera.fovTxf = CreateTextField(widCamera.object, "FovTxf", 80, 22, 164, "")
	widCamera.clipNearTxf = CreateTextField(widCamera.object, "ClipFarTxf", 80, 42, 81, "")
	widCamera.clipFarTxf = CreateTextField(widCamera.object, "ClipFarTxf", 163, 42, 81, "")

	widCamera.copyToViewBut = CreateButton(widCamera.object, "CopyToViewBut", 10, 64, 228, 18, "Copy To View")

	widCamera.minimize = CreateButton(widCamera.object, "Camera", 1, 1, 246, 16, "Camera")

	SetScreenSize(widCamera.object, 248, 16)
end

function ediUpdateWidCameraSelection()
	local widCamera = editor.gui.properties.widCamera
	local sel = ediGetSelection()

	local clip = GetCameraClip(sel)

	SetTextFieldText(widCamera.fovTxf, tostring(GetCameraFov(sel)))
	SetTextFieldText(widCamera.clipNearTxf, tostring(clip.x))
	SetTextFieldText(widCamera.clipFarTxf, tostring(clip.y))

	SetTextFieldCursorPosition(widCamera.fovTxf, 0)
	SetTextFieldCursorPosition(widCamera.clipNearTxf, 0)
	SetTextFieldCursorPosition(widCamera.clipFarTxf, 0)
end

function ediUpdateWidCamera()
	local widCamera = editor.gui.properties.widCamera
	local sel = ediGetSelection()

	if GetGuiObjectEvent(widCamera.minimize) == CLICKED then
		if GetGuiObjectSize(widCamera.object).y > 16 then
			SetScreenSize(widCamera.object, 248, 16)
		else
			SetScreenSize(widCamera.object, 248, 86)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end

	if GetGuiObjectEvent(widCamera.fovTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widCamera.fovTxf, 0, nil)
		local clip = GetCameraClip(sel)
		SetCameraPerspective(sel, tonumber(GetTextFieldText(widCamera.fovTxf)),
			GetCameraAspect(sel), clip.x, clip.y)
	end

	if GetGuiObjectEvent(widCamera.clipNearTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widCamera.clipNearTxf, 0, nil)
		local clip = GetCameraClip(sel)
		SetCameraPerspective(sel, GetCameraFov(sel), GetCameraAspect(sel), 
			tonumber(GetTextFieldText(widCamera.clipNearTxf)), clip.y)
	end

	if GetGuiObjectEvent(widCamera.clipFarTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widCamera.clipFarTxf, 0, nil)
		local clip = GetCameraClip(sel)
		clip.y = tonumber(GetTextFieldText(widCamera.clipFarTxf))
		if clip.y < clip.x then clip.y = clip.x end
		SetTextFieldText(widCamera.clipFarTxf, tostring(clip.y))
		SetTextFieldCursorPosition(widCamera.clipFarTxf, 0)
		SetCameraPerspective(sel, GetCameraFov(sel), GetCameraAspect(sel),  clip.x, clip.y)
	end

	if GetGuiObjectEvent(widCamera.copyToViewBut) == CLICKED then
		local clip = GetCameraClip(sel)
		local pos = GetActorPosition(sel)
		local rot = GetActorRotation(sel)
		SetActorPosition(editor.scene.camera.object, pos.x, pos.y, pos.z)
		SetActorRotation(editor.scene.camera.object, rot.x, rot.y, rot.z)
		SetCameraPerspective(editor.scene.camera.object, GetCameraFov(sel), GetCameraAspect(sel), clip.x, clip.y)
	end
end

