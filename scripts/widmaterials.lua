
function ediInitWidMaterials()
	editor.gui.properties.widMaterials = {}
	local widMaterials = editor.gui.properties.widMaterials

	widMaterials.object = CreateScreen(editor.gui.properties.object, "WidMaterials", 0, 25, 248, 411)

	widMaterials.addMaterialBut = CreateButton(widMaterials.object, "AddMaterialBut", 10, 22, 228, 18, "Add Material")
	widMaterials.removeMaterialBut = CreateButton(widMaterials.object, "RemoveMaterialBut", 10, 42, 228, 18, "Remove Material")

	widMaterials.materialsTxl = CreateTextList(widMaterials.object, "MaterialsTxl", 10, 64, 4, 218)
	widMaterials.scrollBar = CreateSlider(widMaterials.object, "ScrollBar", 232, 68, 0, 52, 1.0)

	widMaterials.nameLab = CreateLabel(widMaterials.object, "NameLab", 4, 132, "Name")
	widMaterials.diffuseLab = CreateLabel(widMaterials.object, "DiffuseLab", 4, 152, "Diffuse")
	widMaterials.specularLab = CreateLabel(widMaterials.object, "SpecularLab", 4, 172, "Specular")
	widMaterials.ambientLab = CreateLabel(widMaterials.object, "AmbientLab", 4, 192, "Ambient")
	widMaterials.shininessLab = CreateLabel(widMaterials.object, "ShininessLab", 4, 212, "Shininess")
	widMaterials.lightingLab = CreateLabel(widMaterials.object, "LightingLab", 4, 232, "Lighting")
	widMaterials.alphaTestLab = CreateLabel(widMaterials.object, "AlphaTestLab", 4, 252, "Alpha test")
	widMaterials.alphaThrsLab = CreateLabel(widMaterials.object, "AlphaThrsLab", 4, 272, "Alpha thrs.")
	widMaterials.diffuseMapLab = CreateLabel(widMaterials.object, "DiffuseMapLab", 4, 292, "Diff Map")
	widMaterials.normalMapLab = CreateLabel(widMaterials.object, "NormalMapLab", 4, 312, "Norm Map")
	widMaterials.parallaxMapLab = CreateLabel(widMaterials.object, "ParallaxMapLab", 4, 332, "Prlx Map")
	widMaterials.prlxScaleLab = CreateLabel(widMaterials.object, "PrlxScaleLab", 4, 352, "Prlx Scale")
	widMaterials.specularMapLab = CreateLabel(widMaterials.object, "SpecularMapLab", 4, 372, "Spec Map")
	widMaterials.lightMapLab = CreateLabel(widMaterials.object, "LightMapLab", 4, 392, "LightMap")

	SetGuiObjectColor(widMaterials.nameLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.diffuseLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.specularLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.ambientLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.shininessLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.lightingLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.alphaTestLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.alphaThrsLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.diffuseMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.normalMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.parallaxMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.prlxScaleLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.specularMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widMaterials.lightMapLab, 1.0, 1.0, 1.0, 0.6)

	widMaterials.nameTxf = CreateTextField(widMaterials.object, "NameTxf", 80, 128, 164, "")

	widMaterials.diffuseRTxf = CreateTextField(widMaterials.object, "DiffuseRTxf", 80, 148, 40, "")
	widMaterials.diffuseGTxf = CreateTextField(widMaterials.object, "DiffuseGTxf", 122, 148, 40, "")
	widMaterials.diffuseBTxf = CreateTextField(widMaterials.object, "DiffuseBTxf", 164, 148, 40, "")
	widMaterials.diffuseATxf = CreateTextField(widMaterials.object, "DiffuseATxf", 206, 148, 38, "")

	widMaterials.specularRTxf = CreateTextField(widMaterials.object, "SpecularRTxf", 80, 168, 53, "")
	widMaterials.specularRTxf = CreateTextField(widMaterials.object, "SpecularRTxf", 135, 168, 53, "")
	widMaterials.specularRTxf = CreateTextField(widMaterials.object, "SpecularRTxf", 190, 168, 54, "")

	widMaterials.ambientRTxf = CreateTextField(widMaterials.object, "AmbientRTxf", 80, 188, 53, "")
	widMaterials.ambientRTxf = CreateTextField(widMaterials.object, "AmbientRTxf", 135, 188, 53, "")
	widMaterials.ambientRTxf = CreateTextField(widMaterials.object, "AmbientRTxf", 190, 188, 54, "")

	widMaterials.shininessTxf = CreateTextField(widMaterials.object, "ShininessTxf", 80, 208, 164, "")

	widMaterials.lightingCbx = CreateCheckBox(widMaterials.object, "LightingCbx", 80, 231, false)

	widMaterials.alphaTestCbx = CreateCheckBox(widMaterials.object, "AlphaTestCbx", 80, 251, false)
	widMaterials.alphaThrsTxf = CreateTextField(widMaterials.object, "AlphaThrsTxf", 80, 268, 164, "")

	widMaterials.diffuseMapTxf = CreateTextField(widMaterials.object, "DiffuseMapTxf", 80, 288, 144, "")
	widMaterials.normalMapTxf = CreateTextField(widMaterials.object, "NormalMapTxf", 80, 308, 144, "")
	widMaterials.parallaxMapTxf = CreateTextField(widMaterials.object, "ParallaxMapTxf", 80, 328, 144, "")
	widMaterials.prlxScaleTxf = CreateTextField(widMaterials.object, "PrlxScaleTxf", 80, 348, 164, "")
	widMaterials.specularMapTxf = CreateTextField(widMaterials.object, "SpecularMapTxf", 80, 368, 144, "")
	widMaterials.lightMapTxf = CreateTextField(widMaterials.object, "LightMapTxf", 80, 388, 144, "")

	widMaterials.openDiffuseMap = CreateButton(widMaterials.object, "OpenDiffuseMap", 226, 288, 18, 18, "..")
	widMaterials.openNormalMap = CreateButton(widMaterials.object, "OpenNormalMap", 226, 308, 18, 18, "..")
	widMaterials.openParallaxMap = CreateButton(widMaterials.object, "OpenParallaxMap", 226, 328, 18, 18, "..")
	widMaterials.openSpecularMap = CreateButton(widMaterials.object, "OpenSpecularMap", 226, 368, 18, 18, "..")
	widMaterials.openLightMap = CreateButton(widMaterials.object, "OpenLightMap", 226, 388, 18, 18, "..")

	widMaterials.minimize = CreateButton(widMaterials.object, "Materials", 1, 1, 246, 14, "Materials")

	SetScreenSize(widMaterials.object, 248, 16)
end

function ediUpdateWidMaterialsSelection()
	local widMaterials = editor.gui.properties.widMaterials
	local sel = ediGetSelection()
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
end

