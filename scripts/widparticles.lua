
function ediInitWidParticles()
	editor.gui.properties.widParticles = {}
	local widParticles = editor.gui.properties.widParticles

	widParticles.object = CreateScreen(editor.gui.properties.object, "WidParticles", 0, 25, 248, 425)

	widParticles.maxCountLab = CreateLabel(widParticles.object, "MaxCountLab", 4, 26, "Max Count")
	widParticles.drawModeLab = CreateLabel(widParticles.object, "DrawModeLab", 4, 46, "Draw Mode")
	widParticles.textureLab = CreateLabel(widParticles.object, "TextureLab", 4, 66, "Texture")
	widParticles.modelLab = CreateLabel(widParticles.object, "ModelLab", 4, 86, "Model")
	widParticles.entityLab = CreateLabel(widParticles.object, "EntityLab", 4, 106, "Entity")
	widParticles.spawnLab = CreateLabel(widParticles.object, "SpawnLab", 4, 126, "Spawn")
	widParticles.delayLab = CreateLabel(widParticles.object, "DelayLab", 4, 146, "Delay")
	widParticles.gravityLab = CreateLabel(widParticles.object, "GravityLab", 4, 166, "GravityLab")
	widParticles.sizeLab = CreateLabel(widParticles.object, "SizeLab", 4, 186, "Size")
	widParticles.sizeGrowLab = CreateLabel(widParticles.object, "SizeGrowLab", 4, 206, "Size Grow")
	widParticles.rotationLab = CreateLabel(widParticles.object, "RotationLab", 4, 226, "Rotation")
	widParticles.rotGrowLab = CreateLabel(widParticles.object, "RotGrowLab", 4, 246, "Rot Grow")
	widParticles.lifeSpanLab = CreateLabel(widParticles.object, "LifeSpanLab", 4, 266, "Life Span")
	widParticles.fadeSpeedLab = CreateLabel(widParticles.object, "FadeSpeedLab", 4, 286, "Fade Spd")
	widParticles.posMinLab = CreateLabel(widParticles.object, "PosMinLab", 4, 306, "Pos Min")
	widParticles.posMaxLab = CreateLabel(widParticles.object, "PosMaxLab", 4, 326, "Pos Max")
	widParticles.velMinLab = CreateLabel(widParticles.object, "VelMinLab", 4, 346, "Vel Min")
	widParticles.velMaxLab = CreateLabel(widParticles.object, "VelMaxLab", 4, 366, "Vel Max")
	widParticles.colorMinLab = CreateLabel(widParticles.object, "ColorMinLab", 4, 386, "Color Min")
	widParticles.colorMaxLab = CreateLabel(widParticles.object, "ColorMaxLab", 4, 406, "Color Max")

	SetGuiObjectColor(widParticles.maxCountLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.drawModeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.textureLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.modelLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.entityLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.spawnLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.delayLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.gravityLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.sizeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.sizeGrowLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.rotationLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.rotGrowLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.lifeSpanLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.fadeSpeedLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.posMinLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.posMaxLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.velMinLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.velMaxLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.colorMinLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(widParticles.colorMaxLab, 1.0, 1.0, 1.0, 0.6)

	widParticles.maxCountTxf = CreateTextField(widParticles.object, "MaxCountTxf", 80, 22, 164, "")
	widParticles.transBut = CreateButton(widParticles.object, "TransBut", 80, 42, 82, 18, "Trans")
	widParticles.addBut = CreateButton(widParticles.object, "AddBut", 162, 42, 82, 18, "Add")
	widParticles.textureTxf = CreateTextField(widParticles.object, "TextureTxf", 80, 62, 144, "")
	widParticles.openTexture = CreateButton(widParticles.object, "OpenTexture", 226, 61, 18, 18, "..")
	widParticles.modelTxf = CreateTextField(widParticles.object, "ModelTxf", 80, 82, 164, "")
	widParticles.entityTxf = CreateTextField(widParticles.object, "EntityTxf", 80, 102, 164, "")
	widParticles.spawnCbx = CreateCheckBox(widParticles.object, "SpawnCbx", 80, 125, true)
	widParticles.delayTxf = CreateTextField(widParticles.object, "DelayTxf", 80, 142, 164, "")
	widParticles.gravityXTxf = CreateTextField(widParticles.object, "GravityXTxf", 80, 162, 53, "")
	widParticles.gravityYTxf = CreateTextField(widParticles.object, "GravityYTxf", 135, 162, 53, "")
	widParticles.gravityZTxf = CreateTextField(widParticles.object, "GravityZTxf", 190, 162, 54, "")
	widParticles.sizeMinTxf = CreateTextField(widParticles.object, "SizeMinTxf", 80, 182, 81, "")
	widParticles.sizeMaxTxf = CreateTextField(widParticles.object, "SizeMaxTxf", 163, 182, 81, "")
	widParticles.sizeGrowMinTxf = CreateTextField(widParticles.object, "SizeGrowMinTxf", 80, 202, 81, "")
	widParticles.sizeGrowMaxTxf = CreateTextField(widParticles.object, "SizeGrowMaxTxf", 163, 202, 81, "")
	widParticles.rotationMinTxf = CreateTextField(widParticles.object, "RotationMinTxf", 80, 222, 81, "")
	widParticles.rotationMaxTxf = CreateTextField(widParticles.object, "RotationMaxTxf", 163, 222, 81, "")
	widParticles.rotGrowMinTxf = CreateTextField(widParticles.object, "RotGrowMinTxf", 80, 242, 81, "")
	widParticles.rotGrowMaxTxf = CreateTextField(widParticles.object, "RotGrowMaxTxf", 163, 242, 81, "")
	widParticles.lifeSpanMinTxf = CreateTextField(widParticles.object, "LifeSpanMinTxf", 80, 262, 81, "")
	widParticles.lifeSpanMaxTxf = CreateTextField(widParticles.object, "LifeSpanMaxTxf", 163, 262, 81, "")
	widParticles.fadeSpeedMinTxf = CreateTextField(widParticles.object, "FadeSpeedMinTxf", 80, 282, 81, "")
	widParticles.fadeSpeedMaxTxf = CreateTextField(widParticles.object, "FadeSpeedMaxTxf", 163, 282, 81, "")
	widParticles.posMinXTxf = CreateTextField(widParticles.object, "PosMinXTxf", 80, 302, 53, "")
	widParticles.posMinYTxf = CreateTextField(widParticles.object, "PosMinYTxf", 135, 302, 53, "")
	widParticles.posMinZTxf = CreateTextField(widParticles.object, "PosMixZTxf", 190, 302, 54, "")
	widParticles.posMaxXTxf = CreateTextField(widParticles.object, "PosMaxXTxf", 80, 322, 53, "")
	widParticles.posMaxYTxf = CreateTextField(widParticles.object, "PosMaxYTxf", 135, 322, 53, "")
	widParticles.posMaxZTxf = CreateTextField(widParticles.object, "PosMaxZTxf", 190, 322, 54, "")
	widParticles.velMinXTxf = CreateTextField(widParticles.object, "VelMinXTxf", 80, 342, 53, "")
	widParticles.velMinYTxf = CreateTextField(widParticles.object, "VelMinYTxf", 135, 342, 53, "")
	widParticles.velMinZTxf = CreateTextField(widParticles.object, "VelMinZTxf", 190, 342, 54, "")
	widParticles.velMaxXTxf = CreateTextField(widParticles.object, "VelMaxXTxf", 80, 362, 53, "")
	widParticles.velMaxYTxf = CreateTextField(widParticles.object, "VelMaxYTxf", 135, 362, 53, "")
	widParticles.velMaxZTxf = CreateTextField(widParticles.object, "VelMaxYTxf", 190, 362, 53, "")
	widParticles.colorMinRTxf = CreateTextField(widParticles.object, "ColorMinRTxf", 80, 382, 40, "")
	widParticles.colorMinGTxf = CreateTextField(widParticles.object, "ColorMinGTxf", 122, 382, 40, "")
	widParticles.colorMinBTxf = CreateTextField(widParticles.object, "ColorMinBTxf", 164, 382, 40, "")
	widParticles.colorMinATxf = CreateTextField(widParticles.object, "ColorMinATxf", 206, 382, 38, "")
	widParticles.colorMaxRTxf = CreateTextField(widParticles.object, "ColorMaxRTxf", 80, 402, 40, "")
	widParticles.colorMaxGTxf = CreateTextField(widParticles.object, "ColorMaxGTxf", 122, 402, 40, "")
	widParticles.colorMaxBTxf = CreateTextField(widParticles.object, "ColorMaxBTxf", 164, 402, 40, "")
	widParticles.colorMaxATxf = CreateTextField(widParticles.object, "ColorMaxATxf", 206, 402, 38, "")

	widParticles.minimize = CreateButton(widParticles.object, "Particles", 1, 1, 246, 14, "Particles")

	SetScreenSize(widParticles.object, 248, 16)
end

function ediUpdateWidParticlesSelection()
	local widParticles = editor.gui.properties.widParticles
	local sel = ediGetSelection()
end

function ediUpdateWidParticles()
	local widParticles = editor.gui.properties.widParticles
	local sel = ediGetSelection()

	if GetGuiObjectEvent(widParticles.minimize) == CLICKED then
		if GetGuiObjectSize(widParticles.object).y > 16 then
			SetScreenSize(widParticles.object, 248, 16)
		else
			SetScreenSize(widParticles.object, 248, 425)
		end
		ediPackScreensVer(editor.gui.properties, 25)
	end
end

