
function ediInitScene()
	editor.scene = {}
	editor.scene.camera = {}

	-- create a default scene
	editor.scene.handle = CreateScene("Scene")
	SetScenePhysics(editor.scene.handle, false)
	SetSceneRunScripts(editor.scene.handle, false)
	SetScene(editor.scene.handle)

	-- init the camear for the default scene
	ediInitSceneCamera()

	SetActorRotation(editor.scene.camera.handle, 90.0, 0.0, 0.0)
	SetActorPosition(editor.scene.camera.handle, 0.0, -5.0, 0.0)
end

function ediInitSceneCamera()
	-- set the camera move speed
	editor.scene.camera.moveSpeed = 20.0
	editor.scene.camera.irot = {}
	editor.scene.camera.irot.x = 0
	editor.scene.camera.irot.y = 0

	-- remove any previous cameras that reserve the ditor camera name
	RemoveSceneCamera(editor.scene.handle, "_EditorELF_Camera")

	-- create a new camera
	editor.scene.camera.handle = CreateCamera("_EditorELF_Camera")

	-- set the camera position and rotation to the first camera found in the scene
	local cam = GetSceneCameraByIndex(editor.scene.handle, 0)
	if cam ~= nil then
		local pos = GetActorPosition(cam)
		local rot = GetActorRotation(cam)
		local fov = GetCameraFov(cam)
		local aspect = GetCameraAspect(cam)
		local clip = GetCameraClip(cam)
		if clip.x < 0.0001 then clip.x = 0.0001 end
		if clip.y < 100.0 then clip.y = 100.0 end
		SetActorPosition(editor.scene.camera.handle, pos.x, pos.y, pos.z)
		SetActorRotation(editor.scene.camera.handle, rot.x, rot.y, rot.z)
		SetCameraPerspective(editor.scene.camera.handle, fov, aspect, clip.x, clip.y)
	else
		SetCameraPerspective(editor.scene.camera.handle, 35.0, GetWindowWidth()/GetWindowHeight(), 1.0, 250.0)
	end

	-- add the camera to the scene and set it active
	AddSceneCamera(editor.scene.handle, editor.scene.camera.handle)
	SetSceneActiveCamera(editor.scene.handle, editor.scene.camera.handle)
end

function ediReloadSceneCamera()
	AddSceneCamera(editor.scene.handle, editor.scene.camera.handle)
	SetSceneActiveCamera(editor.scene.handle, editor.scene.camera.handle)
end

function ediRemoveSceneCamera()
	RemoveSceneCamera(editor.scene.handle, "_EditorELF_Camera")
end

function ediLoadScene(path)
	-- check if we can load the new scene
	newScene = CreateSceneFromFile(path)
	if newScene == nil then return false end

	-- deselect any previously selected objects
	editor.scene.selection = nil
	ediUpdateGuiSelection()

	-- set the new scene as the current scene
	editor.scene.handle = newScene
	SetScenePhysics(newScene, false)
	SetSceneRunScripts(newScene, false)
	SetScene(newScene)

	-- initialize the editor camera
	ediInitSceneCamera()

	local ambient = GetSceneAmbientColor(editor.scene.handle)
	SetTextFieldText(editor.gui.properties.menu.ambientRTxf, tostring(ambient.r))
	SetTextFieldText(editor.gui.properties.menu.ambientGTxf, tostring(ambient.g))
	SetTextFieldText(editor.gui.properties.menu.ambientBTxf, tostring(ambient.b))

	SetTextFieldCursorPosition(editor.gui.properties.menu.ambientRTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.menu.ambientGTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.menu.ambientBTxf, 0)

	return true
end

function ediSaveScene(path)
	ediRemoveSceneCamera()

	local result = SaveScene(editor.scene.handle, path)

	ediReloadSceneCamera()

	return result
end

function ediTraceSceneSelection()
	-- don't allow picking through GUI
	if GetGuiTrace(editor.gui.handle) ~= nil then return nil end

	-- get the ray starting position
	local raystart = GetActorPosition(editor.scene.camera.handle)

	-- next we calculate the end position of the ray
	local mousePos = GetMousePosition()
	local wwidth = GetWindowWidth()
	local wheight = GetWindowHeight()
	local clip = GetCameraClip(editor.scene.camera.handle)
	local fpsize = GetCameraFarPlaneSize(editor.scene.camera.handle)

	local rayend = CreateVec3f(0.0, 0.0, 0.0)
	rayend.x = mousePos.x/wwidth*fpsize.x-fpsize.x/2
	rayend.y = (wheight-mousePos.y)/wheight*fpsize.y-fpsize.y/2
	rayend.z = -clip.y

	-- now we have the end position of the ray, but we still have to positon and orient it according to the camera
	local orient = GetActorOrientation(editor.scene.camera.handle)
	rayend = MulQuaVec3f(orient, rayend)
	rayend = AddVec3fVec3f(raystart, rayend)

	-- perform raycast
	local col = GetDebugSceneRayCastResult(editor.scene.handle, raystart.x, raystart.y, raystart.z, rayend.x, rayend.y, rayend.z)
	if col ~= nil then
		return GetCollisionActor(col)
	end

	return nil
end

function ediSelectActor(act)
	-- get the object we clicked on
	if act == nil then act = ediTraceSceneSelection() end
	-- check if we got anything
	if act ~= nil then
		-- deselect previously selected
		if editor.scene.selection ~= nil then
			SetActorSelected(editor.scene.selection, false)
		end
		-- select object
		editor.scene.selection = act
		SetActorSelected(editor.scene.selection, true)

		ediUpdateGuiSelection()
	end
end

function ediUpdateScene()
	if editor.gui.currentMenu == EDI_PROPERTIES then
		local moveSpeed = editor.scene.camera.moveSpeed

		if GetKeyState(KEY_LSHIFT) ~= UP then
			moveSpeed = moveSpeed * 3
		end

		if GetGuiActiveTextField(editor.gui.handle) == nil then
			-- move the camera around with WSAD
			if GetKeyState(KEY_W) ~= UP then MoveActorLocal(editor.scene.camera.handle, 0.0, 0.0, -moveSpeed) end
			if GetKeyState(KEY_S) ~= UP then MoveActorLocal(editor.scene.camera.handle, 0.0, 0.0, moveSpeed) end
			if GetKeyState(KEY_A) ~= UP then MoveActorLocal(editor.scene.camera.handle, -moveSpeed, 0.0, 0.0) end
			if GetKeyState(KEY_D) ~= UP and GetKeyState(KEY_LCTRL) == UP then MoveActorLocal(editor.scene.camera.handle, moveSpeed, 0.0, 0.0) end
		end

		-- if right mouse button is down, rotate the camera
		if GetMouseButtonState(BUTTON_RIGHT) ~= UP then
			-- rotate the camera according to the mouse force
			local mf = GetMouseForce()

			if AboutZero(mf.x) ~= true then editor.scene.camera.irot.x = -mf.x*20.0 end
			if AboutZero(mf.y) ~= true then editor.scene.camera.irot.y = -mf.y*20.0 end

			RotateActor(editor.scene.camera.handle, 0.0, 0.0, editor.scene.camera.irot.x)
			RotateActorLocal(editor.scene.camera.handle, editor.scene.camera.irot.y, 0.0, 0.0)

			-- center the mouse to allow continuous panning
			SetMousePosition(GetWindowWidth()/2, GetWindowHeight()/2)
		end

		-- check if we have to select object or disable action
		if GetMouseButtonState(BUTTON_LEFT) == PRESSED then
			if GetGuiTrace(editor.gui.handle) == nil and
				editor.gui.action.move == false and
				editor.gui.action.rotate == false then
				ediSelectActor(nil)
			end

			if editor.gui.action.move == true then
				editor.gui.action.move = false
			elseif editor.gui.action.rotate == true then
				editor.gui.action.rotate = false
			end
		end

		-- check do we need to reset move/rotate
		if GetMouseButtonState(BUTTON_RIGHT) == PRESSED then
			if editor.gui.action.move == true then
				SetActorPosition(editor.scene.selection,
					editor.gui.action.moveOrigPos.x,
					editor.gui.action.moveOrigPos.y,
					editor.gui.action.moveOrigPos.z)
				ediUpdateEditSelection()
				editor.gui.action.move = false
			elseif editor.gui.action.rotate == true then
				SetActorRotation(editor.scene.selection,
					editor.gui.action.rotateOrigRot.x,
					editor.gui.action.rotateOrigRot.y,
					editor.gui.action.rotateOrigRot.z)
				ediUpdateEditSelection()
				editor.gui.action.rotate = false
			end
		end

		-- check if we can operate actions on objects
		if editor.scene.selection ~= nil then
			if GetGuiActiveTextField(editor.gui.handle) == nil then
				if GetKeyState(KEY_G) == PRESSED then
					editor.gui.action.moveOrigPos = GetActorPosition(editor.scene.selection)
					editor.gui.action.move = true
				elseif GetKeyState(KEY_R) == PRESSED then
					editor.gui.action.rotateOrigRot = GetActorRotation(editor.scene.selection)
					editor.gui.action.rotate = true
				end
			end

			if GetMouseButtonState(BUTTON_RIGHT) == UP then
				if editor.gui.action.move == true then
					local pos = GetActorPosition(editor.scene.selection)
					local camOrient = GetActorOrientation(editor.scene.camera.handle)
					local camPos = GetActorPosition(editor.scene.camera.handle)

					local speed = GetVec3fLength(SubVec3fVec3f(pos, camPos))*0.001

					local mf = GetMouseForce()
					local offset = CreateVec3f(mf.x*speed, -mf.y*speed, 0.0)

					offset = MulQuaVec3f(camOrient, offset)
					local newPos = AddVec3fVec3f(pos, offset)

					SetActorPosition(editor.scene.selection, newPos.x, newPos.y, newPos.z)
					ediUpdateEditSelection()
				elseif editor.gui.action.rotate == true then
					local orient = GetActorOrientation(editor.scene.selection)
					local invOrient = GetQuaInverted(orient)
					local camOrient = GetActorOrientation(editor.scene.camera.handle)

					local axis = CreateVec3f(0.0, 0.0, -1.0)
					local axis = MulQuaVec3f(camOrient, axis)
					local axis = MulQuaVec3f(invOrient, axis)
					local mf = GetMouseForce()

					local offset = CreateQuaFromAngleAxis(mf.y, axis.x, axis.y, axis.z)
					local newOrient = MulQuaQua(orient, offset)

					SetActorOrientation(editor.scene.selection, newOrient.x, newOrient.y, newOrient.z, newOrient.w)
					ediUpdateEditSelection()
				end
			end

			if GetKeyState(KEY_DEL) == PRESSED and GetGuiActiveTextField(editor.gui.handle) == nil then
				RemoveSceneActorByObject(editor.scene.handle, editor.scene.selection)
				editor.scene.selection = nil
				ediUpdateGuiSelection()	
			end

			if GetKeyState(KEY_LCTRL) == DOWN and GetKeyState(KEY_D) == PRESSED then
				local act = nil
				if GetObjectType(editor.scene.selection) == ENTITY then
					act = CreateEntity("Entity")

					local mdl = GetEntityModel(editor.scene.selection)
					if mdl ~= nil then
						SetEntityModel(act, mdl)
					end

					for i=0, GetEntityMaterialCount(editor.scene.selection)-1 do
						local mat = GetEntityMaterial(editor.scene.selection, i)
						SetEntityMaterial(act, i, mat)
					end

					local lengths = GetActorBoundingLengths(editor.scene.selection)
					local offset = GetActorBoundingOffset(editor.scene.selection)
					local anisFric = GetActorAnisotropicFriction(editor.scene.selection)
					local linFactor = GetActorLinearFactor(editor.scene.selection)
					local angFactor = GetActorAngularFactor(editor.scene.selection)

					SetActorBoundingLengths(act, lengths.x, lengths.y, lengths.z)
					SetActorBoundingOffset(act, offset.x, offset.y, offset.z)
					SetActorDamping(act, GetActorLinearDamping(editor.scene.selection),
						GetActorAngularDamping(editor.scene.selection))
					SetActorSleepThresholds(act, GetActorLinearSleepThreshold(editor.scene.selection),
						GetActorAngularSleepThreshold(editor.scene.selection))
					SetActorRestitution(act, GetActorRestitution(editor.scene.selection))
					SetActorAnisotropicFriction(act, anisFric.x, anisFric.y, anisFric.z)
					SetActorLinearFactor(act, angFactor.x, angFactor.y, angFactor.z)
					SetActorAngularFactor(act, angFactor.x, angFactor.y, angFactor.z)

					local physics = IsActorPhysics(editor.scene.selection)
					if GetActorShape(editor.scene.selection) > 0 then
						SetActorPhysics(act, GetActorShape(editor.scene.selection),
							GetActorMass(editor.scene.selection))
					end
					if physics == false then DisableActorPhysics(act) end

					AddSceneEntity(editor.scene.handle, act)
				end

				if act ~= nil then
					local pos = GetActorPosition(editor.scene.selection)
					local rot = GetActorRotation(editor.scene.selection)
					SetActorPosition(act, pos.x, pos.y, pos.z)
					SetActorRotation(act, rot.x, rot.y, rot.z)

					ediSelectActor(act)

					editor.gui.action.moveOrigPos = GetActorPosition(editor.scene.selection)
					editor.gui.action.move = true
				end
			end
		end
	end

	editor.scene.camera.irot.x = editor.scene.camera.irot.x*0.5
	editor.scene.camera.irot.y = editor.scene.camera.irot.y*0.5
end

