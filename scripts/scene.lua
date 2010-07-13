
function edi_init_scene()
	editor.scene = {}
	editor.scene.camera = {}

	-- create a default scene
	editor.scene.handle = elf.CreateScene("Scene")
	elf.SetScenePhysics(editor.scene.handle, false)
	elf.SetSceneRunScripts(editor.scene.handle, false)
	elf.SetScene(editor.scene.handle)

	-- init the camear for the default scene
	edi_init_scene_camera()

	elf.SetActorRotation(editor.scene.camera.handle, 90.0, 0.0, 0.0)
	elf.SetActorPosition(editor.scene.camera.handle, 0.0, -5.0, 0.0)
end

function edi_init_scene_camera()
	-- set the camera move speed
	editor.scene.camera.move_speed = 20.0
	editor.scene.camera.irot = {}
	editor.scene.camera.irot.x = 0
	editor.scene.camera.irot.y = 0

	-- remove any previous cameras that reserve the ditor camera name
	elf.RemoveCameraByName(editor.scene.handle, "__EditorELF_Camera")

	-- create a new camera
	editor.scene.camera.handle = elf.CreateCamera("__EditorELF_Camera")

	-- set the camera position and rotation to the first camera found in the scene
	local cam = elf.GetCameraByIndex(editor.scene.handle, 0)
	if elf.IsObject(cam) == true then
		local pos = elf.GetActorPosition(cam)
		local rot = elf.GetActorRotation(cam)
		local fov = elf.GetCameraFov(cam)
		local aspect = elf.GetCameraAspect(cam)
		local clip = elf.GetCameraClip(cam)
		if clip.x < 0.0001 then clip.x = 0.0001 end
		if clip.y < 100.0 then clip.y = 100.0 end
		elf.SetActorPosition(editor.scene.camera.handle, pos.x, pos.y, pos.z)
		elf.SetActorRotation(editor.scene.camera.handle, rot.x, rot.y, rot.z)
		elf.SetCameraPerspective(editor.scene.camera.handle, fov, aspect, clip.x, clip.y)
	end

	-- add the camera to the scene and set it active
	elf.AddCameraToScene(editor.scene.handle, editor.scene.camera.handle)
	elf.SetSceneActiveCamera(editor.scene.handle, editor.scene.camera.handle)
end

function edi_reload_scene_camera()
	elf.AddCameraToScene(editor.scene.handle, editor.scene.camera.handle)
	elf.SetSceneActiveCamera(editor.scene.handle, editor.scene.camera.handle)
end

function edi_remove_scene_camera()
	elf.RemoveCameraByName(editor.scene.handle, "__EditorELF_Camera")
end

function edi_load_scene(path)
	-- check if we can load the new scene
	new_scene = elf.CreateSceneFromFile(path)
	if elf.IsObject(new_scene) ~= true then return false end

	-- deselect any previously selected objects
	editor.scene.selection = nil
	edi_update_gui_selection()

	-- set the new scene as the current scene
	editor.scene.handle = new_scene
	elf.SetScenePhysics(new_scene, false)
	elf.SetSceneRunScripts(new_scene, false)
	elf.SetScene(new_scene)

	-- initialize the editor camera
	edi_init_scene_camera()

	local ambient = elf.GetSceneAmbientColor(editor.scene.handle)
	elf.SetTextFieldText(editor.gui.properties.menu.ambient_r_txf, tostring(ambient.r))
	elf.SetTextFieldText(editor.gui.properties.menu.ambient_g_txf, tostring(ambient.g))
	elf.SetTextFieldText(editor.gui.properties.menu.ambient_b_txf, tostring(ambient.b))

	elf.SetTextFieldCursorPosition(editor.gui.properties.menu.ambient_r_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.menu.ambient_g_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.menu.ambient_b_txf, 0)

	return true
end

function edi_save_scene(path)
	edi_remove_scene_camera()

	local result = elf.SaveScene(editor.scene.handle, path)

	edi_reload_scene_camera()

	return result
end

function edi_trace_scene_selection()
	-- don't allow picking through GUI
	if elf.IsObject(elf.GetGuiTrace(editor.gui.handle)) == true then return nil end

	-- get the ray starting position
	local raystart = elf.GetActorPosition(editor.scene.camera.handle)

	-- next we calculate the end position of the ray
	local mouse_pos = elf.GetMousePosition()
	local wwidth = elf.GetWindowWidth()
	local wheight = elf.GetWindowHeight()
	local clip = elf.GetCameraClip(editor.scene.camera.handle)
	local fpsize = elf.GetCameraFarPlaneSize(editor.scene.camera.handle)

	local rayend = elf.CreateVec3f()
	rayend.x = mouse_pos.x/wwidth*fpsize.x-fpsize.x/2
	rayend.y = (wheight-mouse_pos.y)/wheight*fpsize.y-fpsize.y/2
	rayend.z = -clip.y

	-- now we have the end position of the ray, but we still have to positon and orient it according to the camera
	local orient = elf.GetActorOrientation(editor.scene.camera.handle)
	rayend = elf.MulQuaVec3f(orient, rayend)
	rayend = elf.AddVec3fVec3f(raystart, rayend)

	-- perform raycast
	local col = elf.GetDebugSceneRayCastResult(editor.scene.handle, raystart.x, raystart.y, raystart.z, rayend.x, rayend.y, rayend.z)
	if elf.IsObject(col) == true then
		return elf.GetCollisionActor(col)
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
			elf.SetActorSelected(editor.scene.selection, false)
		end
		-- select object
		editor.scene.selection = act
		elf.SetActorSelected(editor.scene.selection, true)

		edi_update_gui_selection()
	end
end

function edi_update_scene()
	if editor.gui.current_menu == EDI_PROPERTIES then
		local move_speed = editor.scene.camera.move_speed

		if elf.GetKeyState(elf.KEY_LSHIFT) ~= elf.UP then
			move_speed = move_speed * 3
		end

		if elf.IsObject(elf.GetGuiActiveTextField(editor.gui.handle)) == false then
			-- move the camera around with WSAD
			if elf.GetKeyState(elf.KEY_W) ~= elf.UP then elf.MoveActorLocal(editor.scene.camera.handle, 0.0, 0.0, -move_speed) end
			if elf.GetKeyState(elf.KEY_S) ~= elf.UP then elf.MoveActorLocal(editor.scene.camera.handle, 0.0, 0.0, move_speed) end
			if elf.GetKeyState(elf.KEY_A) ~= elf.UP then elf.MoveActorLocal(editor.scene.camera.handle, -move_speed, 0.0, 0.0) end
			if elf.GetKeyState(elf.KEY_D) ~= elf.UP and elf.GetKeyState(elf.KEY_LCTRL) == elf.UP then elf.MoveActorLocal(editor.scene.camera.handle, move_speed, 0.0, 0.0) end
		end

		-- if right mouse button is down, rotate the camera
		if elf.GetMouseButtonState(elf.BUTTON_RIGHT) ~= elf.UP then
			-- rotate the camera according to the mouse force
			local mf = elf.GetMouseForce()

			if elf.AboutZero(mf.x) ~= true then editor.scene.camera.irot.x = -mf.x*20.0 end
			if elf.AboutZero(mf.y) ~= true then editor.scene.camera.irot.y = -mf.y*20.0 end

			elf.RotateActor(editor.scene.camera.handle, 0.0, 0.0, editor.scene.camera.irot.x)
			elf.RotateActorLocal(editor.scene.camera.handle, editor.scene.camera.irot.y, 0.0, 0.0)

			-- center the mouse to allow continuous panning
			elf.SetMousePosition(elf.GetWindowWidth()/2, elf.GetWindowHeight()/2)
		end

		-- check if we have to select object or disable action
		if elf.GetMouseButtonState(elf.BUTTON_LEFT) == elf.PRESSED then
			if elf.IsObject(elf.GetGuiTrace(editor.gui.handle)) == false and
				editor.gui.action.move == false and
				editor.gui.action.rotate == false then
				edi_select_actor(nil)
			end

			if editor.gui.action.move == true then
				editor.gui.action.move = false
				elf.SetCheckBoxState(editor.gui.properties.menu.move, false)
			elseif editor.gui.action.rotate == true then
				editor.gui.action.rotate = false
				elf.SetCheckBoxState(editor.gui.properties.menu.rotate, false)
			end
		end

		-- check do we need to reset move/rotate
		if elf.GetMouseButtonState(elf.BUTTON_RIGHT) == elf.PRESSED then
			if editor.gui.action.move == true then
				elf.SetActorPosition(editor.scene.selection,
					editor.gui.action.move_orig_pos.x,
					editor.gui.action.move_orig_pos.y,
					editor.gui.action.move_orig_pos.z)
				edi_update_edit_selection()
				editor.gui.action.move = false
				elf.SetCheckBoxState(editor.gui.properties.menu.move, false)
			elseif editor.gui.action.rotate == true then
				elf.SetActorRotation(editor.scene.selection,
					editor.gui.action.rotate_orig_rot.x,
					editor.gui.action.rotate_orig_rot.y,
					editor.gui.action.rotate_orig_rot.z)
				edi_update_edit_selection()
				editor.gui.action.rotate = false
				elf.SetCheckBoxState(editor.gui.properties.menu.rotate, false)
			end
		end

		-- check if we can operate actions on objects
		if editor.scene.selection ~= nil then
			if elf.IsObject(elf.GetGuiActiveTextField(editor.gui.handle)) == false then
				if elf.GetKeyState(elf.KEY_G) == elf.PRESSED then
					editor.gui.action.move_orig_pos = elf.GetActorPosition(editor.scene.selection)
					editor.gui.action.move = true
					elf.SetCheckBoxState(editor.gui.properties.menu.move, true)
				elseif elf.GetKeyState(elf.KEY_R) == elf.PRESSED then
					editor.gui.action.rotate_orig_rot = elf.GetActorRotation(editor.scene.selection)
					editor.gui.action.rotate = true
					elf.SetCheckBoxState(editor.gui.properties.menu.rotate, true)
				end
			end

			if elf.GetMouseButtonState(elf.BUTTON_RIGHT) == elf.UP then
				if editor.gui.action.move == true then
					local pos = elf.GetActorPosition(editor.scene.selection)
					local cam_orient = elf.GetActorOrientation(editor.scene.camera.handle)
					local cam_pos = elf.GetActorPosition(editor.scene.camera.handle)

					local speed = elf.GetVec3fLength(elf.SubVec3fVec3f(pos, cam_pos))*0.001

					local mf = elf.GetMouseForce()
					local offset = elf.CreateVec3fFromValues(mf.x*speed, -mf.y*speed, 0.0)

					offset = elf.MulQuaVec3f(cam_orient, offset)
					local new_pos = elf.AddVec3fVec3f(pos, offset)

					elf.SetActorPosition(editor.scene.selection, new_pos.x, new_pos.y, new_pos.z)
					edi_update_edit_selection()
				elseif editor.gui.action.rotate == true then
					local orient = elf.GetActorOrientation(editor.scene.selection)
					local inv_orient = elf.GetQuaInverted(orient)
					local cam_orient = elf.GetActorOrientation(editor.scene.camera.handle)

					local axis = elf.CreateVec3fFromValues(0.0, 0.0, -1.0)
					local axis = elf.MulQuaVec3f(cam_orient, axis)
					local axis = elf.MulQuaVec3f(inv_orient, axis)
					local mf = elf.GetMouseForce()

					local offset = elf.CreateQuaFromAngleAxis(mf.y, axis.x, axis.y, axis.z)
					local new_orient = elf.MulQuaQua(orient, offset)

					elf.SetActorOrientation(editor.scene.selection, new_orient.x, new_orient.y, new_orient.z, new_orient.w)
					edi_update_edit_selection()
				end
			end

			if elf.GetKeyState(elf.KEY_DEL) == elf.PRESSED and elf.IsObject(elf.GetGuiActiveTextField(editor.gui.handle)) == false then
				elf.RemoveActorByObject(editor.scene.handle, editor.scene.selection)
				editor.scene.selection = nil
				edi_update_gui_selection()	
			end

			if elf.GetKeyState(elf.KEY_LCTRL) == elf.DOWN and elf.GetKeyState(elf.KEY_D) == elf.PRESSED then
				local act = nil
				if elf.GetObjectType(editor.scene.selection) == elf.ENTITY then
					act = elf.CreateEntity("Entity")

					local mdl = elf.GetEntityModel(editor.scene.selection)
					if elf.IsObject(mdl) == true then
						elf.SetEntityModel(act, mdl)
					end

					for i=0, elf.GetEntityMaterialCount(editor.scene.selection)-1 do
						local mat = elf.GetEntityMaterial(editor.scene.selection, i)
						elf.SetEntityMaterial(act, i, mat)
					end

					local lengths = elf.GetActorBoundingLengths(editor.scene.selection)
					local offset = elf.GetActorBoundingOffset(editor.scene.selection)
					local anis_fric = elf.GetActorAnisotropicFriction(editor.scene.selection)
					local lin_factor = elf.GetActorLinearFactor(editor.scene.selection)
					local ang_factor = elf.GetActorAngularFactor(editor.scene.selection)

					elf.SetActorBoundingLengths(act, lengths.x, lengths.y, lengths.z)
					elf.SetActorBoundingOffset(act, offset.x, offset.y, offset.z)
					elf.SetActorDamping(act, elf.GetActorLinearDamping(editor.scene.selection),
						elf.GetActorAngularDamping(editor.scene.selection))
					elf.SetActorSleepThresholds(act, elf.GetActorLinearSleepThreshold(editor.scene.selection),
						elf.GetActorAngularSleepThreshold(editor.scene.selection))
					elf.SetActorRestitution(act, elf.GetActorRestitution(editor.scene.selection))
					elf.SetActorAnisotropicFriction(act, anis_fric.x, anis_fric.y, anis_fric.z)
					elf.SetActorLinearFactor(act, ang_factor.x, ang_factor.y, ang_factor.z)
					elf.SetActorAngularFactor(act, ang_factor.x, ang_factor.y, ang_factor.z)

					local physics = elf.IsActorPhysics(editor.scene.selection)
					if elf.GetActorShape(editor.scene.selection) > 0 then
						elf.SetActorPhysics(act, elf.GetActorShape(editor.scene.selection),
							elf.GetActorMass(editor.scene.selection))
					end
					if physics == false then elf.DisableActorPhysics(act) end

					elf.AddEntityToScene(editor.scene.handle, act)
				end

				if act ~= nil then
					local pos = elf.GetActorPosition(editor.scene.selection)
					local rot = elf.GetActorRotation(editor.scene.selection)
					elf.SetActorPosition(act, pos.x, pos.y, pos.z)
					elf.SetActorRotation(act, rot.x, rot.y, rot.z)

					edi_select_actor(act)

					editor.gui.action.move_orig_pos = elf.GetActorPosition(editor.scene.selection)
					editor.gui.action.move = true
					elf.SetCheckBoxState(editor.gui.properties.menu.move, true)
				end
			end
		end
	end

	editor.scene.camera.irot.x = editor.scene.camera.irot.x*0.5
	editor.scene.camera.irot.y = editor.scene.camera.irot.y*0.5
end

