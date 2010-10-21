
function ediInitWidMaterials()
	editor.gui.properties.widMaterials = {}
	local widMaterials = editor.gui.properties.widMaterials

	widMaterials.prevMouseWheel = 0

	widMaterials.object = CreateScreen(editor.gui.properties.object, "WidMaterials", 0, 25, 248, 411)

	widMaterials.addMaterialBut = CreateButton(widMaterials.object, "AddMaterialBut", 10, 22, 228, 18, "Add Material")
	widMaterials.removeMaterialBut = CreateButton(widMaterials.object, "RemoveMaterialBut", 10, 42, 228, 18, "Remove Material")

	widMaterials.materialsTxl = CreateTextList(widMaterials.object, "MaterialsTxl", 10, 64, 4, 218)
	widMaterials.materialsScrollBar = CreateSlider(widMaterials.object, "ScrollBar", 232, 68, 0, 52, 1.0)

	widMaterials.nameLab = CreateLabel(widMaterials.object, "NameLab", 4, 132, "Name")
	widMaterials.diffuseLab = CreateLabel(widMaterials.object, "DiffuseLab", 4, 152, "Diffuse")
	widMaterials.specularLab = CreateLabel(widMaterials.object, "SpecularLab", 4, 172, "Specular")
	widMaterials.ambientLab = CreateLabel(widMaterials.object, "AmbientLab", 4, 192, "Ambient")
	widMaterials.specPowerLab = CreateLabel(widMaterials.object, "specPowerLab", 4, 212, "Spec Power")
	widMaterials.lightingLab = CreateLabel(widMaterials.object, "LightingLab", 4, 232, "Lighting")
	widMaterials.alphaTestLab = CreateLabel(widMaterials.object, "AlphaTestLab", 4, 252, "Alpha test")
	widMaterials.alphaThrsLab = CreateLabel(widMaterials.object, "AlphaThrsLab", 4, 272, "Alpha thrs.")
	widMaterials.diffuseMapLab = CreateLabel(widMaterials.object, "DiffuseMapLab", 4, 292, "Diff Map")
	widMaterials.normalMapLab = CreateLabel(widMaterials.object, "NormalMapLab", 4, 312, "Norm Map")
	widMaterials.heightMapLab = CreateLabel(widMaterials.object, "HeightMapLab", 4, 332, "Heig Map")
	widMaterials.prlxScaleLab = CreateLabel(widMaterials.object, "PrlxScaleLab", 4, 352, "Prlx Scale")
	widMaterials.specularMapLab = CreateLabel(widMaterials.object, "SpecularMapLab", 4, 372, "Spec Map")
	widMaterials.lightMapLab = CreateLabel(widMaterials.object, "LightMapLab", 4, 392, "LightMap")

	SetGuiObjectColor(widMaterials.nameLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.diffuseLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.specularLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.ambientLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.specPowerLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.lightingLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.alphaTestLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.alphaThrsLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.diffuseMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.normalMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.heightMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.prlxScaleLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.specularMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.lightMapLab, 1.0, 1.0, 1.0, 0.6)

	widMaterials.nameTxf = CreateTextField(widMaterials.object, "NameTxf", 80, 128, 164, "")

	widMaterials.diffuseRTxf = CreateTextField(widMaterials.object, "DiffuseRTxf", 80, 148, 40, "")
	widMaterials.diffuseGTxf = CreateTextField(widMaterials.object, "DiffuseGTxf", 122, 148, 40, "")
	widMaterials.diffuseBTxf = CreateTextField(widMaterials.object, "DiffuseBTxf", 164, 148, 40, "")
	widMaterials.diffuseATxf = CreateTextField(widMaterials.object, "DiffuseATxf", 206, 148, 38, "")

	widMaterials.specularRTxf = CreateTextField(widMaterials.object, "SpecularRTxf", 80, 168, 53, "")
	widMaterials.specularGTxf = CreateTextField(widMaterials.object, "SpecularRTxf", 135, 168, 53, "")
	widMaterials.specularBTxf = CreateTextField(widMaterials.object, "SpecularRTxf", 190, 168, 54, "")

	widMaterials.ambientRTxf = CreateTextField(widMaterials.object, "AmbientRTxf", 80, 188, 53, "")
	widMaterials.ambientGTxf = CreateTextField(widMaterials.object, "AmbientRTxf", 135, 188, 53, "")
	widMaterials.ambientBTxf = CreateTextField(widMaterials.object, "AmbientRTxf", 190, 188, 54, "")

	widMaterials.specPowerTxf = CreateTextField(widMaterials.object, "specPowerTxf", 80, 208, 164, "")

	widMaterials.lightingCbx = CreateCheckBox(widMaterials.object, "LightingCbx", 80, 231, false)

	widMaterials.alphaTestCbx = CreateCheckBox(widMaterials.object, "AlphaTestCbx", 80, 251, false)
	widMaterials.alphaThrsTxf = CreateTextField(widMaterials.object, "AlphaThrsTxf", 80, 268, 164, "")

	widMaterials.diffuseMapTxf = CreateTextField(widMaterials.object, "DiffuseMapTxf", 80, 288, 144, "")
	widMaterials.normalMapTxf = CreateTextField(widMaterials.object, "NormalMapTxf", 80, 308, 144, "")
	widMaterials.heightMapTxf = CreateTextField(widMaterials.object, "HeightMapTxf", 80, 328, 144, "")
	widMaterials.prlxScaleTxf = CreateTextField(widMaterials.object, "PrlxScaleTxf", 80, 348, 164, "")
	widMaterials.specularMapTxf = CreateTextField(widMaterials.object, "SpecularMapTxf", 80, 368, 144, "")
	widMaterials.lightMapTxf = CreateTextField(widMaterials.object, "LightMapTxf", 80, 388, 144, "")

	widMaterials.openDiffuseMap = CreateButton(widMaterials.object, "OpenDiffuseMap", 226, 288, 18, 18, "..")
	widMaterials.openNormalMap = CreateButton(widMaterials.object, "OpenNormalMap", 226, 308, 18, 18, "..")
	widMaterials.openHeightMap = CreateButton(widMaterials.object, "OpenHeightMap", 226, 328, 18, 18, "..")
	widMaterials.openSpecularMap = CreateButton(widMaterials.object, "OpenSpecularMap", 226, 368, 18, 18, "..")
	widMaterials.openLightMap = CreateButton(widMaterials.object, "OpenLightMap", 226, 388, 18, 18, "..")

	widMaterials.minimize = CreateButton(widMaterials.object, "Materials", 1, 1, 246, 14, "Materials")

	SetScreenSize(widMaterials.object, 248, 16)
end

function ediClearWidMaterialsSpecs()
	local widMaterials = editor.gui.properties.widMaterials

	SetTextFieldText(widMaterials.nameTxf, "")
	SetTextFieldText(widMaterials.diffuseRTxf, "")
	SetTextFieldText(widMaterials.diffuseGTxf, "")
	SetTextFieldText(widMaterials.diffuseBTxf, "")
	SetTextFieldText(widMaterials.diffuseATxf, "")
	SetTextFieldText(widMaterials.specularRTxf, "")
	SetTextFieldText(widMaterials.specularGTxf, "")
	SetTextFieldText(widMaterials.specularBTxf, "")
	SetTextFieldText(widMaterials.ambientRTxf, "")
	SetTextFieldText(widMaterials.ambientGTxf, "")
	SetTextFieldText(widMaterials.ambientBTxf, "")
	SetTextFieldText(widMaterials.specPowerTxf, "")
	SetCheckBoxState(widMaterials.lightingCbx, false)
	SetCheckBoxState(widMaterials.alphaTestCbx, false)
	SetTextFieldText(widMaterials.alphaThrsTxf, "")
	SetTextFieldText(widMaterials.diffuseMapTxf, "")
	SetTextFieldText(widMaterials.normalMapTxf, "")
	SetTextFieldText(widMaterials.heightMapTxf, "")
	SetTextFieldText(widMaterials.prlxScaleTxf, "")
	SetTextFieldText(widMaterials.specularMapTxf, "")
	SetTextFieldText(widMaterials.lightMapTxf, "")

	widMaterials.material = nil
end

function ediSetWidMaterialsMaterial(idx)
	local widMaterials = editor.gui.properties.widMaterials
	local sel = ediGetSelection()

	widMaterials.material = idx
	if idx > GetEntityMaterialCount(sel)-1 then
		widMaterials.material = nil
		return
	end

	local mat = GetEntityMaterial(sel, idx)

	local diffuse = GetMaterialDiffuseColor(mat)
	local specular = GetMaterialSpecularColor(mat)
	local ambient = GetMaterialAmbientColor(mat)

	SetTextFieldText(widMaterials.nameTxf, GetMaterialName(mat))
	SetTextFieldText(widMaterials.diffuseRTxf, diffuse.r)
	SetTextFieldText(widMaterials.diffuseGTxf, diffuse.g)
	SetTextFieldText(widMaterials.diffuseBTxf, diffuse.b)
	SetTextFieldText(widMaterials.diffuseATxf, diffuse.a)
	SetTextFieldText(widMaterials.specularRTxf, specular.r)
	SetTextFieldText(widMaterials.specularGTxf, specular.g)
	SetTextFieldText(widMaterials.specularBTxf, specular.b)
	SetTextFieldText(widMaterials.ambientRTxf, ambient.r)
	SetTextFieldText(widMaterials.ambientGTxf, ambient.g)
	SetTextFieldText(widMaterials.ambientBTxf, ambient.b)
	SetTextFieldText(widMaterials.specPowerTxf, GetMaterialSpecularPower(mat))
	SetCheckBoxState(widMaterials.lightingCbx, GetMaterialLighting(mat))
	SetCheckBoxState(widMaterials.alphaTestCbx, GetMaterialAlphaTest(mat))
	SetTextFieldText(widMaterials.alphaThrsTxf, GetMaterialAlphaThreshold(mat))
	SetTextFieldText(widMaterials.prlxScaleTxf, GetMaterialParallaxScale(mat))

	local map = GetMaterialDiffuseMap(mat)
	if map ~= nil then SetTextFieldText(widMaterials.diffuseMapTxf, GetTextureName(map))
	else SetTextFieldText(widMaterials.diffuseMapTxf, "") end
	map = GetMaterialNormalMap(mat)
	if map ~= nil then SetTextFieldText(widMaterials.normalMapTxf, GetTextureName(map))
	else SetTextFieldText(widMaterials.normalMapTxf, "") end
	map = GetMaterialHeightMap(mat)
	if map ~= nil then SetTextFieldText(widMaterials.heightMapTxf, GetTextureName(map))
	else SetTextFieldText(widMaterials.heightMapTxf, "") end
	map = GetMaterialSpecularMap(mat)
	if map ~= nil then SetTextFieldText(widMaterials.specularMapTxf, GetTextureName(map))
	else SetTextFieldText(widMaterials.specularMapTxf, "") end
	map = GetMaterialLightMap(mat)
	if map ~= nil then SetTextFieldText(widMaterials.lightMapTxf, GetTextureName(map))
	else SetTextFieldText(widMaterials.lightMapTxf, "") end

	SetTextFieldCursorPosition(widMaterials.nameTxf, 0)
	SetTextFieldCursorPosition(widMaterials.diffuseRTxf, 0)
	SetTextFieldCursorPosition(widMaterials.diffuseGTxf, 0)
	SetTextFieldCursorPosition(widMaterials.diffuseBTxf, 0)
	SetTextFieldCursorPosition(widMaterials.diffuseATxf, 0)
	SetTextFieldCursorPosition(widMaterials.specularRTxf, 0)
	SetTextFieldCursorPosition(widMaterials.specularGTxf, 0)
	SetTextFieldCursorPosition(widMaterials.specularBTxf, 0)
	SetTextFieldCursorPosition(widMaterials.ambientRTxf, 0)
	SetTextFieldCursorPosition(widMaterials.ambientGTxf, 0)
	SetTextFieldCursorPosition(widMaterials.ambientBTxf, 0)
	SetTextFieldCursorPosition(widMaterials.specPowerTxf, 0)
	SetTextFieldCursorPosition(widMaterials.alphaThrsTxf, 0)
	SetTextFieldCursorPosition(widMaterials.diffuseMapTxf, 0)
	SetTextFieldCursorPosition(widMaterials.normalMapTxf, 0)
	SetTextFieldCursorPosition(widMaterials.heightMapTxf, 0)
	SetTextFieldCursorPosition(widMaterials.prlxScaleTxf, 0)
	SetTextFieldCursorPosition(widMaterials.specularMapTxf, 0)
	SetTextFieldCursorPosition(widMaterials.lightMapTxf, 0)

end

function ediUpdateWidMaterialsSelection()
	local widMaterials = editor.gui.properties.widMaterials
	local sel = ediGetSelection()

	RemoveTextListItems(widMaterials.materialsTxl)
	SetSliderValue(widMaterials.materialsScrollBar, 1.0)

	if GetEntityMaterialCount(sel) > 0 then
		for i=0, GetEntityMaterialCount(sel)-1 do
			AddTextListItem(widMaterials.materialsTxl, GetMaterialName(GetEntityMaterial(sel, i)))
		end
		SetTextListSelection(widMaterials.materialsTxl, 0)
		ediSetWidMaterialsMaterial(0)
	else
		ediClearWidMaterialsSpecs()
	end
end

function ediUpdateWidMaterials()
	local widMaterials = editor.gui.properties.widMaterials

	if GetGuiObjectEvent(widMaterials.minimize) == CLICKED then
		if GetGuiObjectSize(widMaterials.object).y > 16 then
			SetScreenSize(widMaterials.object, 248, 16)
		else
			SetScreenSize(widMaterials.object, 248, 411)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end

	local sel = ediGetSelection()

	if GetGuiObjectEvent(widMaterials.addMaterialBut) == CLICKED then
		local nmat = CreateMaterial("Material")
		AddEntityMaterial(sel, nmat)
		AddTextListItem(widMaterials.materialsTxl, "Material")
		SetTextListSelection(widMaterials.materialsTxl, GetEntityMaterialCount(sel)-1)
		ediSetWidMaterialsMaterial(GetEntityMaterialCount(sel)-1)
	end

	local diff = GetTextListItemCount(widMaterials.materialsTxl)- GetTextListRowCount(widMaterials.materialsTxl)
	if diff > 0 then
		if GetGuiObjectEvent(widMaterials.materialsScrollBar) == VALUE_CHANGED then
			SetTextListOffset(widMaterials.materialsTxl, diff*(1.0-GetSliderValue(widMaterials.materialsScrollBar)))
		end

		if GetGuiTrace(editor.gui.object) ~= nil and
			GetGuiObjectName(GetGuiTrace(editor.gui.object)) ==
			GetGuiObjectName(widMaterials.materialsTxl) then

			local wheelDiff = -(GetMouseWheel() - widMaterials.prevMouseWheel)
			if wheelDiff ~= 0 then
				offset = GetTextListOffset(widMaterials.materialsTxl)+wheelDiff
				if offset < 0 then offset = 0 end
				if offset > diff then offset = diff end

				SetTextListOffset(widMaterials.materialsTxl, offset)
				SetSliderValue(widMaterials.materialsScrollBar, 1.0-(offset/diff))
			end
		end
	else
		SetSliderValue(widMaterials.materialsScrollBar, 1.0)
	end

	widMaterials.prevMouseWheel = GetMouseWheel()

	if widMaterials.material == nil then return end

	if GetGuiObjectEvent(widMaterials.removeMaterialBut) == CLICKED then
		RemoveEntityMaterial(sel, widMaterials.material)
		RemoveTextListItem(widMaterials.materialsTxl, widMaterials.material)
		if GetEntityMaterialCount(sel) == 0 then return end

		if widMaterials.material <= GetEntityMaterialCount(sel)-1 then
			ediSetWidMaterialsMaterial(widMaterials.material)
			SetTextListSelection(widMaterials.materialsTxl, widMaterials.material)
		else
			ediSetWidMaterialsMaterial(GetEntityMaterialCount(sel)-1)
			SetTextListSelection(widMaterials.materialsTxl, GetEntityMaterialCount(sel)-1)
		end

		diff = GetTextListItemCount(widMaterials.materialsTxl)- GetTextListRowCount(widMaterials.materialsTxl)
		SetTextListOffset(widMaterials.materialsTxl, diff*(1.0-GetSliderValue(widMaterials.materialsScrollBar)))
	end

	local mat = GetEntityMaterial(sel, widMaterials.material)

	if GetGuiObjectEvent(widMaterials.materialsTxl) == SELECTION_CHANGED then
		if GetTextListSelectionIndex(widMaterials.materialsTxl) == -1 then
			SetTextListSelection(widMaterials.materialsTxl, widMaterials.material)
		else
			ediSetWidMaterialsMaterial(GetTextListSelectionIndex(widMaterials.materialsTxl))
		end
	end

	if GetGuiObjectEvent(widMaterials.nameTxf) == LOSE_FOCUS then
		if string.len(GetTextFieldText(widMaterials.nameTxf)) < 1 then
			SetTextFieldText(widMaterials.nameTxf, GetMaterialName(mat))
		else
			SetMaterialName(mat, GetTextFieldText(widMaterials.nameTxf))
			SetTextListItem(widMaterials.materialsTxl, widMaterials.material, GetMaterialName(mat))
		end
	end

	if GetGuiObjectEvent(widMaterials.diffuseRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.diffuseRTxf, 0, nil)
		SetMaterialDiffuseColor(mat, tonumber(GetTextFieldText(widMaterials.diffuseRTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseGTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseBTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseATxf)))
	end

	if GetGuiObjectEvent(widMaterials.diffuseGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.diffuseGTxf, 0, nil)
		SetMaterialDiffuseColor(mat, tonumber(GetTextFieldText(widMaterials.diffuseRTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseGTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseBTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseATxf)))
	end

	if GetGuiObjectEvent(widMaterials.diffuseBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.diffuseBTxf, 0, nil)
		SetMaterialDiffuseColor(mat, tonumber(GetTextFieldText(widMaterials.diffuseRTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseGTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseBTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseATxf)))
	end

	if GetGuiObjectEvent(widMaterials.diffuseATxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.diffuseATxf, 0, nil)
		SetMaterialDiffuseColor(mat, tonumber(GetTextFieldText(widMaterials.diffuseRTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseGTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseBTxf)),
			tonumber(GetTextFieldText(widMaterials.diffuseATxf)))
	end

	if GetGuiObjectEvent(widMaterials.specularRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.specularRTxf, 0, nil)
		SetMaterialSpecularColor(mat, tonumber(GetTextFieldText(widMaterials.specularRTxf)),
			tonumber(GetTextFieldText(widMaterials.specularGTxf)),
			tonumber(GetTextFieldText(widMaterials.specularBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widMaterials.specularGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.specularGTxf, 0, nil)
		SetMaterialSpecularColor(mat, tonumber(GetTextFieldText(widMaterials.specularRTxf)),
			tonumber(GetTextFieldText(widMaterials.specularGTxf)),
			tonumber(GetTextFieldText(widMaterials.specularBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widMaterials.specularBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.specularBTxf, 0, nil)
		SetMaterialSpecularColor(mat, tonumber(GetTextFieldText(widMaterials.specularRTxf)),
			tonumber(GetTextFieldText(widMaterials.specularGTxf)),
			tonumber(GetTextFieldText(widMaterials.specularBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widMaterials.ambientRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.ambientRTxf, 0, nil)
		SetMaterialAmbientColor(mat, tonumber(GetTextFieldText(widMaterials.ambientRTxf)),
			tonumber(GetTextFieldText(widMaterials.ambientGTxf)),
			tonumber(GetTextFieldText(widMaterials.ambientBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widMaterials.ambientGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.ambientGTxf, 0, nil)
		SetMaterialAmbientColor(mat, tonumber(GetTextFieldText(widMaterials.ambientRTxf)),
			tonumber(GetTextFieldText(widMaterials.ambientGTxf)),
			tonumber(GetTextFieldText(widMaterials.ambientBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widMaterials.ambientBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.ambientBTxf, 0, nil)
		SetMaterialAmbientColor(mat, tonumber(GetTextFieldText(widMaterials.ambientRTxf)),
			tonumber(GetTextFieldText(widMaterials.ambientGTxf)),
			tonumber(GetTextFieldText(widMaterials.ambientBTxf)), 1.0)
	end

	if GetGuiObjectEvent(widMaterials.specPowerTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.specPowerTxf, 0, nil)
		SetMaterialSpecularPower(mat, tonumber(GetTextFieldText(widMaterials.specPowerTxf)))
	end

	if GetGuiObjectEvent(widMaterials.lightingCbx) == STATE_CHANGED then
		SetMaterialLighting(mat, GetCheckBoxState(widMaterials.lightingCbx))
	end

	if GetGuiObjectEvent(widMaterials.alphaTestCbx) == STATE_CHANGED then
		SetMaterialAlphaTest(mat, GetCheckBoxState(widMaterials.alphaTestCbx))
	end

	if GetGuiObjectEvent(widMaterials.alphaThrsTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.alphaThrsTxf, 0, nil)
		SetMaterialAlphaThreshold(mat, tonumber(GetTextFieldText(widMaterials.alphaThrsTxf)))
	end

	if GetGuiObjectEvent(widMaterials.prlxScaleTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(widMaterials.prlxScaleTxf, 0, nil)
		SetMaterialParallaxScale(mat, tonumber(GetTextFieldText(widMaterials.prlxScaleTxf)))
	end

	if GetGuiObjectEvent(widMaterials.diffuseMapTxf) == LOSE_FOCUS then
		local map = GetMaterialDiffuseMap(mat)
		if map ~= nil then
			if string.len(GetTextFieldText(widMaterials.diffuseMapTxf)) < 1 then
				ClearMaterialDiffuseMap(mat)
			else
				SetTextureName(map, GetTextFieldText(widMaterials.diffuseMapTxf))
			end
		else
			local textures = GetSceneTextures(editor.scene.object)
			local tex = BeginList(textures)
			local found = false
			while tex ~= nil do
				print(GetTextureName(tex))
				if GetTextureName(tex) == GetTextFieldText(widMaterials.diffuseMapTxf) then
					SetMaterialDiffuseMap(mat, tex)
					found = true
					break
				end
				tex = GetListNext(textures)
			end
			if found == false then SetTextFieldText(widMaterials.diffuseMapTxf, "") end
		end
	elseif GetGuiObjectEvent(widMaterials.diffuseMapTxf) == DROP then
		if GetGuiObjectName(editor.gui.toolbox.widFiles.fileList) == GetGuiObjectName(GetGuiDragObject(editor.gui.object)) then
			local tex = CreateTextureFromFile(ediGetWidFilesDirectory() .. string.sub(GetGuiDragContent(editor.gui.object), 2))
			if tex ~= nil then
				SetMaterialDiffuseMap(mat, tex)
				SetTextFieldText(widMaterials.diffuseMapTxf, GetTextureName(tex))
			end
		end
	end

	if GetGuiObjectEvent(widMaterials.normalMapTxf) == LOSE_FOCUS then
		local map = GetMaterialNormalMap(mat)
		if map ~= nil then
			if string.len(GetTextFieldText(widMaterials.normalMapTxf)) < 1 then
				ClearMaterialNormalMap(mat)
			else
				SetTextureName(map, GetTextFieldText(widMaterials.normalMapTxf))
			end
		else
			local textures = GetSceneTextures(editor.scene.object)
			local tex = BeginList(textures)
			local found = false
			while tex ~= nil do
				if GetTextureName(tex) == GetTextFieldText(widMaterials.normalMapTxf) then
					SetMaterialNormalMap(mat, tex)
					GenerateEntityTangents(sel)
					found = true
					break
				end
				tex = GetListNext(textures)
			end
			if found == false then SetTextFieldText(widMaterials.normalMapTxf, "") end
		end
	elseif GetGuiObjectEvent(widMaterials.normalMapTxf) == DROP then
		if GetGuiObjectName(editor.gui.toolbox.widFiles.fileList) == GetGuiObjectName(GetGuiDragObject(editor.gui.object)) then
			local tex = CreateTextureFromFile(ediGetWidFilesDirectory() .. string.sub(GetGuiDragContent(editor.gui.object), 2))
			if tex ~= nil then
				SetMaterialNormalMap(mat, tex)
				GenerateEntityTangents(sel)
				SetTextFieldText(widMaterials.normalMapTxf, GetTextureName(tex))
			end
		end
	end

	if GetGuiObjectEvent(widMaterials.heightMapTxf) == LOSE_FOCUS then
		local map = GetMaterialHeightMap(mat)
		if map ~= nil then
			if string.len(GetTextFieldText(widMaterials.heightMapTxf)) < 1 then
				ClearMaterialHeightMap(mat)
			else
				SetTextureName(map, GetTextFieldText(widMaterials.heightMapTxf))
			end
		else
			local textures = GetSceneTextures(editor.scene.object)
			local tex = BeginList(textures)
			local found = false
			while tex ~= nil do
				if GetTextureName(tex) == GetTextFieldText(widMaterials.heightMapTxf) then
					SetMaterialHeightMap(mat, tex)
					GenerateEntityTangents(sel)
					found = true
					break
				end
				tex = GetListNext(textures)
			end
			if found == false then SetTextFieldText(widMaterials.heightMapTxf, "") end
		end
	elseif GetGuiObjectEvent(widMaterials.heightMapTxf) == DROP then
		if GetGuiObjectName(editor.gui.toolbox.widFiles.fileList) == GetGuiObjectName(GetGuiDragObject(editor.gui.object)) then
			local tex = CreateTextureFromFile(ediGetWidFilesDirectory() .. string.sub(GetGuiDragContent(editor.gui.object), 2))
			if tex ~= nil then
				SetMaterialHeightMap(mat, tex)
				GenerateEntityTangents(sel)
				SetTextFieldText(widMaterials.heightMapTxf, GetTextureName(tex))
			end
		end
	end

	if GetGuiObjectEvent(widMaterials.specularMapTxf) == LOSE_FOCUS then
		local map = GetMaterialSpecularMap(mat)
		if map ~= nil then
			if string.len(GetTextFieldText(widMaterials.specularMapTxf)) < 1 then
				ClearMaterialSpecularMap(mat)
			else
				SetTextureName(map, GetTextFieldText(widMaterials.specularMapTxf))
			end
		else
			local textures = GetSceneTextures(editor.scene.object)
			local tex = BeginList(textures)
			local found = false
			while tex ~= nil do
				if GetTextureName(tex) == GetTextFieldText(widMaterials.specularMapTxf) then
					SetMaterialSpecularMap(mat, tex)
					found = true
					break
				end
				tex = GetListNext(textures)
			end
			if found == false then SetTextFieldText(widMaterials.specularMapTxf, "") end
		end
	elseif GetGuiObjectEvent(widMaterials.specularMapTxf) == DROP then
		if GetGuiObjectName(editor.gui.toolbox.widFiles.fileList) == GetGuiObjectName(GetGuiDragObject(editor.gui.object)) then
			local tex = CreateTextureFromFile(ediGetWidFilesDirectory() .. string.sub(GetGuiDragContent(editor.gui.object), 2))
			if tex ~= nil then
				SetMaterialSpecularMap(mat, tex)
				SetTextFieldText(widMaterials.specularMapTxf, GetTextureName(tex))
			end
		end
	end

	if GetGuiObjectEvent(widMaterials.lightMapTxf) == LOSE_FOCUS then
		local map = GetMaterialLightMap(mat)
		if map ~= nil then
			if string.len(GetTextFieldText(widMaterials.lightMapTxf)) < 1 then
				ClearMaterialLightMap(mat)
			else
				SetTextureName(map, GetTextFieldText(widMaterials.lightMapTxf))
			end
		else
			local textures = GetSceneTextures(editor.scene.object)
			local tex = BeginList(textures)
			local found = false
			while tex ~= nil do
				if GetTextureName(tex) == GetTextFieldText(widMaterials.lightMapTxf) then
					SetMaterialLightMap(mat, tex)
					found = true
					break
				end
				tex = GetListNext(textures)
			end
			if found == false then SetTextFieldText(widMaterials.lightMapTxf, "") end
		end
	elseif GetGuiObjectEvent(widMaterials.lightMapTxf) == DROP then
		if GetGuiObjectName(editor.gui.toolbox.widFiles.fileList) == GetGuiObjectName(GetGuiDragObject(editor.gui.object)) then
			local tex = CreateTextureFromFile(ediGetWidFilesDirectory() .. string.sub(GetGuiDragContent(editor.gui.object), 2))
			if tex ~= nil then
				SetMaterialLightMap(mat, tex)
				SetTextFieldText(widMaterials.lightMapTxf, GetTextureName(tex))
			end
		end
	end
end

