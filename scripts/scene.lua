
function edi_init_scene()
	editor.scene = {}
	editor.scene.camera = {}

	-- create a default scene
	editor.scene.handle = CreateScene("Scene")
	SetScenePhysics(editor.scene.handle, false)
	SetSceneRunScripts(editor.scene.handle, false)
	SetScene(editor.scene.handle)

	-- init the camear for the default scene
	edi_init_scene_camera()

	SetActorRotation(editor.scene.camera.handle, 90.0, 0.0, 0.0)
	SetActorPosition(editor.scene.camera.handle, 0.0, -5.0, 0.0)
end

function edi_init_scene_camera()
	-- set the camera move speed
	editor.scene.camera.move_speed = 20.0
	editor.scene.camera.irot = {}
	editor.scene.camera.irot.x = 0
	editor.scene.camera.irot.y = 0

	-- remove any previous cameras that reserve the ditor camera name
	RemoveCameraByName(editor.scene.handle, "__EditorELF_Camera")

	-- create a new camera
	editor.scene.camera.handle = CreateCamera("__EditorELF_Camera")

	-- set the camera position and rotation to the first camera found in the scene
	local cam = GetCameraByIndex(editor.scene.handle, 0)
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
	end

	-- add the camera to the scene and set it active
	AddCameraToScene(editor.scene.handle, editor.scene.camera.handle)
	SetSceneActiveCamera(editor.scene.handle, editor.scene.camera.handle)
end

function edi_reload_scene_camera()
	AddCameraToScene(editor.scene.handle, editor.scene.camera.handle)
	SetSceneActiveCamera(editor.scene.handle, editor.scene.camera.handle)
end

function edi_remove_scene_camera()
	RemoveCameraByName(editor.scene.handle, "__EditorELF_Camera")
end

function edi_load_scene(path)
	-- check if we can load the new scene
	new_scene = CreateSceneFromFile(path)
	if new_scene == nil then return false end

	-- deselect any previously selected objects
	editor.scene.selection = nil
	edi_update_gui_selection()

	-- set the new scene as the current scene
	editor.scene.handle = new_scene
	SetScenePhysics(new_scene, false)
	SetSceneRunScripts(new_scene, false)
	SetScene(new_scene)

	-- initialize the editor camera
	edi_init_scene_camera()

	local ambient = GetSceneAmbientColor(editor.scene.handle)
	SetTextFieldText(editor.gui.properties.menu.ambient_r_txf, tostring(ambient.r))
	SetTextFieldText(editor.gui.properties.menu.ambient_g_txf, tostring(ambient.g))
	SetTextFieldText(editor.gui.properties.menu.ambient_b_txf, tostring(ambient.b))

	SetTextFieldCursorPosition(editor.gui.properties.menu.ambient_r_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.menu.ambient_g_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.menu.ambient_b_txf, 0)

	return true
end

function edi_save_scene(path)
	edi_remove_scene_camera()

	local result = SaveScene(editor.scene.handle, path)

	edi_reload_scene_camera()

	return result
end

function edi_trace_scene_selection()
	-- don't allow picking through GUI
	if GetGuiTrace(editor.gui.handle) ~= nil then return nil end

	-- get the ray starting position
	local raystart = GetActorPosition(editor.scene.camera.handle)

	-- next we calculate the end position of the ray
	local mouse_pos = GetMousePosition()
	local wwidth = GetWindowWidth()
	local wheight = GetWindowHeight()
	local clip = GetCameraClip(editor.scene.camera.handle)
	local fpsize = GetCameraFarPlaneSize(editor.scene.camera.handle)

	local rayend = CreateVec3f(0.0, 0.0, 0.0)
	rayend.x = mouse_pos.x/wwidth*fpsize.x-fpsize.x/2
	rayend.y = (wheight-mouse_pos.y)/wheight*fpsize.y-fpsize.y/2
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

function edi_select_actor(act)
	-- get the object we clicked on
	if act == nil then act = edi_trace_scene_selection() end
	-- check if we got anything
	if act ~= nil then
		-- deselect previously selected
		if editor.scene.selection ~= nil then
			SetActorSelected(editor.scene.selection, false)
		end
		-- select object
		editor.scene.selection = act
		SetActorSelected(editor.scene.selection, true)

		edi_update_gui_selection()
	end
end

function edi_update_scene()
	if editor.gui.current_menu == EDI_PROPERTIES then
		local move_speed = editor.scene.camera.move_speed

		if GetKeyState(KEY_LSHIFT) ~= UP then
			move_speed = move_speed * 3
		end

		if GetGuiActiveTextField(editor.gui.handle) == nil then
			-- move the camera around with WSAD
			if GetKeyState(KEY_W) ~= UP then MoveActorLocal(editor.scene.camera.handle, 0.0, 0.0, -move_speed) end
			if GetKeyState(KEY_S) ~= UP then MoveActorLocal(editor.scene.camera.handle, 0.0, 0.0, move_speed) end
			if GetKeyState(KEY_A) ~= UP then MoveActorLocal(editor.scene.camera.handle, -move_speed, 0.0, 0.0) end
			if GetKeyState(KEY_D) ~= UP and GetKeyState(KEY_LCTRL) == UP then MoveActorLocal(editor.scene.camera.handle, move_speed, 0.0, 0.0) end
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
				edi_select_actor(nil)
			end

			if editor.gui.action.move == true then
				editor.gui.action.move = false
				SetCheckBoxState(editor.gui.properties.menu.move, false)
			elseif editor.gui.action.rotate == true then
				editor.gui.action.rotate = false
				SetCheckBoxState(editor.gui.properties.menu.rotate, false)
			end
		end

		-- check do we need to reset move/rotate
		if GetMouseButtonState(BUTTON_RIGHT) == PRESSED then
			if editor.gui.action.move == true then
				SetActorPosition(editor.scene.selection,
					editor.gui.action.move_orig_pos.x,
					editor.gui.action.move_orig_pos.y,
					editor.gui.action.move_orig_pos.z)
				edi_update_edit_selection()
				editor.gui.action.move = false
				SetCheckBoxState(editor.gui.properties.menu.move, false)
			elseif editor.gui.action.rotate == true then
				SetActorRotation(editor.scene.selection,
					editor.gui.action.rotate_orig_rot.x,
					editor.gui.action.rotate_orig_rot.y,
					editor.gui.action.rotate_orig_rot.z)
				edi_update_edit_selection()
				editor.gui.action.rotate = false
				SetCheckBoxState(editor.gui.properties.menu.rotate, false)
			end
		end

		-- check if we can operate actions on objects
		if editor.scene.selection ~= nil then
			if GetGuiActiveTextField(editor.gui.handle) == nil then
				if GetKeyState(KEY_G) == PRESSED then
					editor.gui.action.move_orig_pos = GetActorPosition(editor.scene.selection)
					editor.gui.action.move = true
					SetCheckBoxState(editor.gui.properties.menu.move, true)
				elseif GetKeyState(KEY_R) == PRESSED then
					editor.gui.action.rotate_orig_rot = GetActorRotation(editor.scene.selection)
					editor.gui.action.rotate = true
					SetCheckBoxState(editor.gui.properties.menu.rotate, true)
				end
			end

			if GetMouseButtonState(BUTTON_RIGHT) == UP then
				if editor.gui.action.move == true then
					local pos = GetActorPosition(editor.scene.selection)
					local cam_orient = GetActorOrientation(editor.scene.camera.handle)
					local cam_pos = GetActorPosition(editor.scene.camera.handle)

					local speed = GetVec3fLength(SubVec3fVec3f(pos, cam_pos))*0.001

					local mf = GetMouseForce()
					local offset = CreateVec3f(mf.x*speed, -mf.y*speed, 0.0)

					offset = MulQuaVec3f(cam_orient, offset)
					local new_pos = AddVec3fVec3f(pos, offset)

					SetActorPosition(editor.scene.selection, new_pos.x, new_pos.y, new_pos.z)
					edi_update_edit_selection()
				elseif editor.gui.action.rotate == true then
					local orient = GetActorOrientation(editor.scene.selection)
					local inv_orient = GetQuaInverted(orient)
					local cam_orient = GetActorOrientation(editor.scene.camera.handle)

					local axis = CreateVec3f(0.0, 0.0, -1.0)
					local axis = MulQuaVec3f(cam_orient, axis)
					local axis = MulQuaVec3f(inv_orient, axis)
					local mf = GetMouseForce()

					local offset = CreateQuaFromAngleAxis(mf.y, axis.x, axis.y, axis.z)
					local new_orient = MulQuaQua(orient, offset)

					SetActorOrientation(editor.scene.selection, new_orient.x, new_orient.y, new_orient.z, new_orient.w)
					edi_update_edit_selection()
				end
			end

			if GetKeyState(KEY_DEL) == PRESSED and GetGuiActiveTextField(editor.gui.handle) == nil then
				RemoveActorByObject(editor.scene.handle, editor.scene.selection)
				editor.scene.selection = nil
				edi_update_gui_selection()	
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
					local anis_fric = GetActorAnisotropicFriction(editor.scene.selection)
					local lin_factor = GetActorLinearFactor(editor.scene.selection)
					local ang_factor = GetActorAngularFactor(editor.scene.selection)

					SetActorBoundingLengths(act, lengths.x, lengths.y, lengths.z)
					SetActorBoundingOffset(act, offset.x, offset.y, offset.z)
					SetActorDamping(act, GetActorLinearDamping(editor.scene.selection),
						GetActorAngularDamping(editor.scene.selection))
					SetActorSleepThresholds(act, GetActorLinearSleepThreshold(editor.scene.selection),
						GetActorAngularSleepThreshold(editor.scene.selection))
					SetActorRestitution(act, GetActorRestitution(editor.scene.selection))
					SetActorAnisotropicFriction(act, anis_fric.x, anis_fric.y, anis_fric.z)
					SetActorLinearFactor(act, ang_factor.x, ang_factor.y, ang_factor.z)
					SetActorAngularFactor(act, ang_factor.x, ang_factor.y, ang_factor.z)

					local physics = IsActorPhysics(editor.scene.selection)
					if GetActorShape(editor.scene.selection) > 0 then
						SetActorPhysics(act, GetActorShape(editor.scene.selection),
							GetActorMass(editor.scene.selection))
					end
					if physics == false then DisableActorPhysics(act) end

					AddEntityToScene(editor.scene.handle, act)
				end

				if act ~= nil then
					local pos = GetActorPosition(editor.scene.selection)
					local rot = GetActorRotation(editor.scene.selection)
					SetActorPosition(act, pos.x, pos.y, pos.z)
					SetActorRotation(act, rot.x, rot.y, rot.z)

					edi_select_actor(act)

					editor.gui.action.move_orig_pos = GetActorPosition(editor.scene.selection)
					editor.gui.action.move = true
					SetCheckBoxState(editor.gui.properties.menu.move, true)
				end
			end
		end
	end

	editor.scene.camera.irot.x = editor.scene.camera.irot.x*0.5
	editor.scene.camera.irot.y = editor.scene.camera.irot.y*0.5
end

