
EDI_PROPERTIES_MENU = 1
EDI_PROPERTIES_EDIT = 2
EDI_PROPERTIES_PP = 3

EDI_EDIT_ACTOR = 1
EDI_EDIT_CAMERA = 2
EDI_EDIT_LIGHT = 3
EDI_EDIT_ENTITY = 4
EDI_EDIT_PARTICLES = 5
EDI_EDIT_SPRITE = 6

function ediInitProperties()
	editor.gui.properties = {}

	-- setup the file dialog screen
	editor.gui.properties.handle = CreateScreen(editor.gui.handle, "editMenu", GetWindowWidth()-256, 0, 256, 720)
	SetGuiObjectColor(editor.gui.properties.handle, 1.0, 1.0, 1.0, 0.75)

	-- setup the properties tab check boxes
	editor.gui.properties.menuCb = CreateButton(editor.gui.properties.handle, "menuCb", 4, 4, 82, 18, "Menu")
	editor.gui.properties.editCb = CreateButton(editor.gui.properties.handle, "editCb", 86, 4, 82, 18, "Edit")
	editor.gui.properties.ppCb = CreateButton(editor.gui.properties.handle, "ppCb", 168, 4, 82, 18, "PP")

	-- setup the menu tab

	editor.gui.properties.menu = {}

	editor.gui.properties.menu.open = CreateButton(editor.gui.properties.handle, "open", 4, 30, 248, 18, "Open...")
	editor.gui.properties.menu.save = CreateButton(editor.gui.properties.handle, "save", 4, 50, 248, 18, "Save...")
	editor.gui.properties.menu.importScene = CreateButton(editor.gui.properties.handle, "importScene", 4, 70, 248, 18, "Import Scene...")
	editor.gui.properties.menu.createCamera = CreateButton(editor.gui.properties.handle, "createCamera", 4, 108, 248, 18, "Create Camera")
	editor.gui.properties.menu.createLight = CreateButton(editor.gui.properties.handle, "createLight", 4, 128, 248, 18, "Create Light")
	editor.gui.properties.menu.createEntity = CreateButton(editor.gui.properties.handle, "createEntity", 4, 148, 248, 18, "Create Entity")
	editor.gui.properties.menu.createParticles = CreateButton(editor.gui.properties.handle, "createParticles", 4, 168, 248, 18, "Create Particles")
	editor.gui.properties.menu.ambient = CreateLabel(editor.gui.properties.handle, "ambient", 4, 196, "Ambient")
	editor.gui.properties.menu.ambientR = CreateLabel(editor.gui.properties.handle, "ambient", 4, 215, "R")
	editor.gui.properties.menu.ambientG = CreateLabel(editor.gui.properties.handle, "ambient", 78, 215, "G")
	editor.gui.properties.menu.ambientB = CreateLabel(editor.gui.properties.handle, "ambient", 155, 215, "B")
	SetGuiObjectColor(editor.gui.properties.menu.ambient, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.menu.ambientR, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.menu.ambientG, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.menu.ambientB, 1.0, 1.0, 1.0, 0.6)
	editor.gui.properties.menu.ambientRTxf = CreateTextField(editor.gui.properties.handle, "ambientRTxf", 18, 210, 56, "0")
	editor.gui.properties.menu.ambientGTxf = CreateTextField(editor.gui.properties.handle, "ambientGTxf", 94, 210, 56, "0")
	editor.gui.properties.menu.ambientBTxf = CreateTextField(editor.gui.properties.handle, "ambientBTxf", 169, 210, 56, "0")

	-- setup the edit tab

	editor.gui.properties.edit = {}

	-- setup the edit tab check boxes
	editor.gui.properties.edit.actCb = CreateButton(editor.gui.properties.handle, "actCb", 4, 26, 124, 18, "Actor")
	editor.gui.properties.edit.camCb = CreateButton(editor.gui.properties.handle, "camCb", 128, 26, 124, 18, "Camera")
	editor.gui.properties.edit.ligCb = CreateButton(editor.gui.properties.handle, "ligCb", 128, 26, 124, 18, "Light")
	editor.gui.properties.edit.entCb = CreateButton(editor.gui.properties.handle, "entCb", 128, 26, 124, 18, "Entity")
	editor.gui.properties.edit.parCb = CreateButton(editor.gui.properties.handle, "entCb", 128, 26, 124, 18, "Particles")
	editor.gui.properties.edit.sprCb = CreateButton(editor.gui.properties.handle, "entCb", 128, 26, 124, 18, "Sprite")

	-- setup the actor properties

	editor.gui.properties.edit.actor = {}

	editor.gui.properties.edit.actor.nameLab = CreateLabel(editor.gui.properties.handle, "nameLab", 4, 54, "Name")
	editor.gui.properties.edit.actor.posLab = CreateLabel(editor.gui.properties.handle, "posLab", 4, 75, "Position")
	editor.gui.properties.edit.actor.rotLab = CreateLabel(editor.gui.properties.handle, "rotLab", 4, 97, "Rotation")
	editor.gui.properties.edit.actor.scriptLab = CreateLabel(editor.gui.properties.handle, "scriptLab", 4, 118, "Script")
	editor.gui.properties.edit.actor.physicsEnbLab = CreateLabel(editor.gui.properties.handle, "physicsEnbLab", 4, 162, "Physics")
	editor.gui.properties.edit.actor.lengthsLab = CreateLabel(editor.gui.properties.handle, "lengthsLab", 4, 184, "Lengths")
	editor.gui.properties.edit.actor.offsetLab = CreateLabel(editor.gui.properties.handle, "offsetLab", 4, 206, "Offset")
	editor.gui.properties.edit.actor.massLab = CreateLabel(editor.gui.properties.handle, "massLab", 4, 228, "Mass")
	editor.gui.properties.edit.actor.linDampLab = CreateLabel(editor.gui.properties.handle, "linDampLab", 4, 250, "Lin Damp")
	editor.gui.properties.edit.actor.angDampLab = CreateLabel(editor.gui.properties.handle, "angDampLab", 4, 272, "Ang Damp")
	editor.gui.properties.edit.actor.linSleepLab = CreateLabel(editor.gui.properties.handle, "linSleepLab", 4, 294, "Lin Sleep")
	editor.gui.properties.edit.actor.angSleepLab = CreateLabel(editor.gui.properties.handle, "angSleepLab", 4, 316, "Ang Sleep")
	editor.gui.properties.edit.actor.restituLab = CreateLabel(editor.gui.properties.handle, "restituLab", 4, 337, "Restitu.")
	editor.gui.properties.edit.actor.anisFricLab = CreateLabel(editor.gui.properties.handle, "anisFricLab", 4, 360, "Anis Fric")
	editor.gui.properties.edit.actor.linFacLab = CreateLabel(editor.gui.properties.handle, "linFracLab", 4, 382, "Lin Factor")
	editor.gui.properties.edit.actor.angFacLab = CreateLabel(editor.gui.properties.handle, "angFracLab", 4, 404, "Ang Factor")
	editor.gui.properties.edit.actor.shapeLab = CreateLabel(editor.gui.properties.handle, "physicsLab", 4, 428, "Shape")

	SetGuiObjectColor(editor.gui.properties.edit.actor.nameLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.posLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.rotLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.scriptLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.physicsEnbLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.lengthsLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.offsetLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.massLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.linDampLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.angDampLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.linSleepLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.angSleepLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.restituLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.anisFricLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.linFacLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.angFacLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.shapeLab, 1.0, 1.0, 1.0, 0.6)

	editor.gui.properties.edit.actor.nameTxf = CreateTextField(editor.gui.properties.handle, "nameTxf", 80, 48, 168, "Object")

	editor.gui.properties.edit.actor.posXTxf = CreateTextField(editor.gui.properties.handle, "posXTxf", 80, 70, 53, "0")
	editor.gui.properties.edit.actor.posYTxf = CreateTextField(editor.gui.properties.handle, "posYTxf", 137, 70, 53, "0")
	editor.gui.properties.edit.actor.posZTxf = CreateTextField(editor.gui.properties.handle, "posZTxf", 194, 70, 53, "0")

	editor.gui.properties.edit.actor.rotXTxf = CreateTextField(editor.gui.properties.handle, "rotXTxf", 80, 92, 53, "0")
	editor.gui.properties.edit.actor.rotYTxf = CreateTextField(editor.gui.properties.handle, "rotYTxf", 137, 92, 53, "0")
	editor.gui.properties.edit.actor.rotZTxf = CreateTextField(editor.gui.properties.handle, "rotZTxf", 194, 92, 53, "0")

	editor.gui.properties.edit.actor.scriptTxf = CreateTextField(editor.gui.properties.handle, "scriptTxf", 80, 114, 147, "")
	editor.gui.properties.edit.actor.scriptOpen = CreateButton(editor.gui.properties.handle, "scriptOpen", 231, 114, 18, 18, "...")

	editor.gui.properties.edit.actor.physicsEnbCb = CreateCheckBox(editor.gui.properties.handle, "physicsEnbCb", 80, 160, false)

	editor.gui.properties.edit.actor.lengthsXTxf = CreateTextField(editor.gui.properties.handle, "lengthsXTxf", 80, 180, 53, "0")
	editor.gui.properties.edit.actor.lengthsYTxf = CreateTextField(editor.gui.properties.handle, "lengthsYTxf", 137, 180, 53, "0")
	editor.gui.properties.edit.actor.lengthsZTxf = CreateTextField(editor.gui.properties.handle, "lengthsZTxf", 194, 180, 53, "0")

	editor.gui.properties.edit.actor.offsetXTxf = CreateTextField(editor.gui.properties.handle, "offsetXTxf", 80, 202, 53, "0")
	editor.gui.properties.edit.actor.offsetYTxf = CreateTextField(editor.gui.properties.handle, "offsetYTxf", 137, 202, 53, "0")
	editor.gui.properties.edit.actor.offsetZTxf = CreateTextField(editor.gui.properties.handle, "offsetZTxf", 194, 202, 53, "0")

	editor.gui.properties.edit.actor.massTxf = CreateTextField(editor.gui.properties.handle, "massTxf", 80, 224, 168, "0")
	editor.gui.properties.edit.actor.linDampTxf = CreateTextField(editor.gui.properties.handle, "linDampTxf", 80, 246, 168, "0")
	editor.gui.properties.edit.actor.angDampTxf = CreateTextField(editor.gui.properties.handle, "angDampTxf", 80, 268, 168, "0")
	editor.gui.properties.edit.actor.linSleepTxf = CreateTextField(editor.gui.properties.handle, "linSleepTxf", 80, 290, 168, "0")
	editor.gui.properties.edit.actor.angSleepTxf = CreateTextField(editor.gui.properties.handle, "angSleepTxf", 80, 312, 168, "0")
	editor.gui.properties.edit.actor.restituTxf = CreateTextField(editor.gui.properties.handle, "restituTxf", 80, 334, 168, "0")

	editor.gui.properties.edit.actor.anisFricXTxf = CreateTextField(editor.gui.properties.handle, "anisFricXTxf", 80, 356, 53, "0")
	editor.gui.properties.edit.actor.anisFricYTxf = CreateTextField(editor.gui.properties.handle, "anisFricYTxf", 137, 356, 53, "0")
	editor.gui.properties.edit.actor.anisFricZTxf = CreateTextField(editor.gui.properties.handle, "anisFricZTxf", 194, 356, 53, "0")

	editor.gui.properties.edit.actor.linFactorXTxf = CreateTextField(editor.gui.properties.handle, "linFactorZTxf", 80, 378, 53, "0")
	editor.gui.properties.edit.actor.linFactorYTxf = CreateTextField(editor.gui.properties.handle, "linFactorYTxf", 137, 378, 53, "0")
	editor.gui.properties.edit.actor.linFactorZTxf = CreateTextField(editor.gui.properties.handle, "linFactorZTxf", 194, 378, 53, "0")

	editor.gui.properties.edit.actor.angFactorXTxf = CreateTextField(editor.gui.properties.handle, "angFactorXTxf", 80, 400, 53, "0")
	editor.gui.properties.edit.actor.angFactorYTxf = CreateTextField(editor.gui.properties.handle, "angFactorYTxf", 137, 400, 53, "0")
	editor.gui.properties.edit.actor.angFactorZTxf = CreateTextField(editor.gui.properties.handle, "angFactorZTxf", 194, 400, 53, "0")

	editor.gui.properties.edit.actor.shape = CreateTextList(editor.gui.properties.handle, "fileList", 77, 424, 4, 157)
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Box")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Sphere")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Triangle Mesh")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule X")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule Y")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule Z")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone X")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone Y")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone Z")
	AddGuiObject(editor.gui.properties.handle, editor.gui.properties.edit.actor.shape)

	editor.gui.properties.edit.actor.shapeSb = CreateSlider(editor.gui.properties.handle, "scrollBar", 238, 428, 0, 54, 1.0)

	-- setup the light properties

	editor.gui.properties.edit.light = {}

	editor.gui.properties.edit.light.typeLab = CreateLabel(editor.gui.properties.handle, "typeLab", 4, 50, "Type")
	editor.gui.properties.edit.light.colorLab = CreateLabel(editor.gui.properties.handle, "colorLab", 4, 101, "Color")
	editor.gui.properties.edit.light.distanceLab = CreateLabel(editor.gui.properties.handle, "distanceLab", 4, 123, "Distance")
	editor.gui.properties.edit.light.fadeSpeedLab = CreateLabel(editor.gui.properties.handle, "fadeSpeedLab", 4, 145, "Fade Speed")
	editor.gui.properties.edit.light.spotConeLab = CreateLabel(editor.gui.properties.handle, "spotConeLab", 4, 167, "Spot Cone")
	editor.gui.properties.edit.light.shadowsLab = CreateLabel(editor.gui.properties.handle, "shadowsLab", 4, 189, "Shadows")
	editor.gui.properties.edit.light.lsEnabledLab = CreateLabel(editor.gui.properties.handle, "lsEnabledLab", 4, 226, "Shafts")
	editor.gui.properties.edit.light.sizeLab = CreateLabel(editor.gui.properties.handle, "sizeLab", 4, 248, "Size")
	editor.gui.properties.edit.light.intensityLab = CreateLabel(editor.gui.properties.handle, "intensityLab", 4, 270, "Intensity")
	editor.gui.properties.edit.light.fadeoffLab = CreateLabel(editor.gui.properties.handle, "fadeoffLab", 4, 292, "Fadeoff")

	SetGuiObjectColor(editor.gui.properties.edit.light.typeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.colorLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.distanceLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.fadeSpeedLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.spotConeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.shadowsLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.lsEnabledLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.sizeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.intensityLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.fadeoffLab, 1.0, 1.0, 1.0, 0.6)

	editor.gui.properties.edit.light.typeTxl = CreateTextList(editor.gui.properties.handle, "typeList", 50, 48, 3, 202)
	AddTextListItem(editor.gui.properties.edit.light.typeTxl, " Point")
	AddTextListItem(editor.gui.properties.edit.light.typeTxl, " Sun")
	AddTextListItem(editor.gui.properties.edit.light.typeTxl, " Spot")

	editor.gui.properties.edit.light.colorRTxf = CreateTextField(editor.gui.properties.handle, "colorRTxf", 80, 97, 53, "0")
	editor.gui.properties.edit.light.colorGTxf = CreateTextField(editor.gui.properties.handle, "colorGTxf", 137, 97, 53, "0")
	editor.gui.properties.edit.light.colorBTxf = CreateTextField(editor.gui.properties.handle, "colorBTxf", 194, 97, 53, "0")

	editor.gui.properties.edit.light.distanceTxf = CreateTextField(editor.gui.properties.handle, "distanceTxf", 80, 119, 168, "0")
	editor.gui.properties.edit.light.fadeSpeedTxf = CreateTextField(editor.gui.properties.handle, "fadeSpeedTxf", 86, 141, 162, "0")

	editor.gui.properties.edit.light.innerConeTxf = CreateTextField(editor.gui.properties.handle, "innerConeTxf", 80, 163, 82, "0")
	editor.gui.properties.edit.light.outerConeTxf = CreateTextField(editor.gui.properties.handle, "outerConeTxf", 166, 163, 82, "0")

	editor.gui.properties.edit.light.shadowsCb = CreateCheckBox(editor.gui.properties.handle, "shadowsCb", 80, 187, false)

	editor.gui.properties.edit.light.lsEnabledCb = CreateCheckBox(editor.gui.properties.handle, "lsEnabledCb", 80, 224, false)
	editor.gui.properties.edit.light.sizeTxf = CreateTextField(editor.gui.properties.handle, "sizeTxf", 80, 244, 168, "0")
	editor.gui.properties.edit.light.intensityTxf = CreateTextField(editor.gui.properties.handle, "intensityTxf", 80, 266, 168, "0")
	editor.gui.properties.edit.light.fadeOffTxf = CreateTextField(editor.gui.properties.handle, "fadeOffTxf", 80, 288, 168, "0")

	-- setup the camera properties

	editor.gui.properties.edit.camera = {}

	editor.gui.properties.edit.camera.fovLab = CreateLabel(editor.gui.properties.handle, "fovLab", 4, 52, "Fov")
	editor.gui.properties.edit.camera.clipLab = CreateLabel(editor.gui.properties.handle, "clipLab", 4, 74, "Clip")
	editor.gui.properties.edit.camera.fovTxf = CreateTextField(editor.gui.properties.handle, "fovTxf", 80, 48, 168, "0")
	editor.gui.properties.edit.camera.clipNearTxf = CreateTextField(editor.gui.properties.handle, "clipNearTxf", 80, 70, 83, "0")
	editor.gui.properties.edit.camera.clipFarTxf = CreateTextField(editor.gui.properties.handle, "clipFarTxf", 166, 70, 83, "0")
	editor.gui.properties.edit.camera.copyBut = CreateButton(editor.gui.properties.handle, "copyBut", 4, 92, 248, 18, "Copy To View")

	SetGuiObjectColor(editor.gui.properties.edit.camera.fovLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.camera.clipLab, 1.0, 1.0, 1.0, 0.6)

	-- setup the entity properties

	editor.gui.properties.edit.entity = {}

	editor.gui.properties.edit.entity.modelLab = CreateLabel(editor.gui.properties.handle, "modelLab", 4, 53, "Model")
	editor.gui.properties.edit.entity.scaleLab = CreateLabel(editor.gui.properties.handle, "scaleLab", 4, 74, "Scale")
	editor.gui.properties.edit.entity.matNameLab = CreateLabel(editor.gui.properties.handle, "matNameLab", 4, 264, "Name")
	editor.gui.properties.edit.entity.matDiffuseLab = CreateLabel(editor.gui.properties.handle, "matDiffuseLab", 4, 286, "Diffuse")
	editor.gui.properties.edit.entity.matSpecularLab = CreateLabel(editor.gui.properties.handle, "matSpecularLab", 4, 330, "Specular")
	editor.gui.properties.edit.entity.matAmbientLab = CreateLabel(editor.gui.properties.handle, "matAmbientLab", 4, 352, "Ambient")
	editor.gui.properties.edit.entity.matSpecPowerLab = CreateLabel(editor.gui.properties.handle, "matSpecPowerLab", 4, 374, "Shininess")
	editor.gui.properties.edit.entity.matLightingLab = CreateLabel(editor.gui.properties.handle, "matLightingLab", 4, 396, "Lighting")
	editor.gui.properties.edit.entity.matPrlxScaleLab = CreateLabel(editor.gui.properties.handle, "prlxScaleLab", 4, 418, "Prlx Scale")
	editor.gui.properties.edit.entity.matAlphaTestLab = CreateLabel(editor.gui.properties.handle, "alphaTestLab", 4, 440, "Alpha Test")
	editor.gui.properties.edit.entity.matAlphaThrsLab = CreateLabel(editor.gui.properties.handle, "alphaThrsLab", 4, 462, "Alpha Thrs")
	editor.gui.properties.edit.entity.matDiffuseMapLab = CreateLabel(editor.gui.properties.handle, "diffuseMapLab", 4, 484, "Diffu. Map")
	editor.gui.properties.edit.entity.matNormalMapLab = CreateLabel(editor.gui.properties.handle, "normalMapLab", 4, 506, "Normal Map")
	editor.gui.properties.edit.entity.matHeightMapLab = CreateLabel(editor.gui.properties.handle, "heightMapLab", 4, 528, "Height Map")
	editor.gui.properties.edit.entity.matSpecMapLab = CreateLabel(editor.gui.properties.handle, "specMapLab", 4, 550, "Spec Map")
	editor.gui.properties.edit.entity.matLightMapLab = CreateLabel(editor.gui.properties.handle, "lightMapLab", 4, 572, "Light Map")

	SetGuiObjectColor(editor.gui.properties.edit.entity.modelLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.scaleLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matNameLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matDiffuseLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matSpecularLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matAmbientLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matSpecPowerLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matLightingLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matPrlxScaleLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matAlphaTestLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matAlphaThrsLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matDiffuseMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matNormalMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matHeightMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matSpecMapLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.matLightMapLab, 1.0, 1.0, 1.0, 0.6)

	editor.gui.properties.edit.entity.modelTxf = CreateTextField(editor.gui.properties.handle, "modelTxf", 80, 48, 168, "")

	editor.gui.properties.edit.entity.scaleXTxf = CreateTextField(editor.gui.properties.handle, "scaleXTxf", 80, 70, 53, "0")
	editor.gui.properties.edit.entity.scaleYTxf = CreateTextField(editor.gui.properties.handle, "scaleYTxf", 137, 70, 53, "0")
	editor.gui.properties.edit.entity.scaleZTxf = CreateTextField(editor.gui.properties.handle, "scaleZTxf", 194, 70, 53, "0")

	editor.gui.properties.edit.entity.addMaterialBut = CreateButton(editor.gui.properties.handle, "addMaterialBut", 4, 114, 248, 18, "Add Material")
	editor.gui.properties.edit.entity.replaceMaterialBut = CreateButton(editor.gui.properties.handle, "replaceMaterialBut", 4, 136, 248, 18, "Replace Material")
	editor.gui.properties.edit.entity.removeMaterialBut = CreateButton(editor.gui.properties.handle, "removeMaterialBut", 4, 158, 248, 18, "Remove Material")

	editor.gui.properties.edit.entity.materialsTxl = CreateTextList(editor.gui.properties.handle, "materialsTxl", 4, 180, 5, 238)
	AddTextListItem(editor.gui.properties.edit.entity.materialsTxl, " Empty 1")
	AddTextListItem(editor.gui.properties.edit.entity.materialsTxl, " Empty 2")
	AddTextListItem(editor.gui.properties.edit.entity.materialsTxl, " Empty 3")
	AddTextListItem(editor.gui.properties.edit.entity.materialsTxl, " Empty 4")

	editor.gui.properties.edit.entity.materialsSb = CreateSlider(editor.gui.properties.handle, "scrollBar", 246, 184, 0, 68, 1.0)

	editor.gui.properties.edit.entity.matNameTxf = CreateTextField(editor.gui.properties.handle, "matNameTxf", 80, 260, 168, "")

	editor.gui.properties.edit.entity.matDiffuseRTxf = CreateTextField(editor.gui.properties.handle, "matDiffuseRTxf", 4, 304, 58, "0")
	editor.gui.properties.edit.entity.matDiffuseGTxf = CreateTextField(editor.gui.properties.handle, "matDiffuseGTxf", 66, 304, 58, "0")
	editor.gui.properties.edit.entity.matDiffuseBTxf = CreateTextField(editor.gui.properties.handle, "matDiffuseBTxf", 128, 304, 58, "0")
	editor.gui.properties.edit.entity.matDiffuseATxf = CreateTextField(editor.gui.properties.handle, "matDiffuseATxf", 190, 304, 58, "0")

	editor.gui.properties.edit.entity.matSpecularRTxf = CreateTextField(editor.gui.properties.handle, "matSpecularRTxf", 80, 326, 53, "0")
	editor.gui.properties.edit.entity.matSpecularGTxf = CreateTextField(editor.gui.properties.handle, "matSpecularGTxf", 137, 326, 53, "0")
	editor.gui.properties.edit.entity.matSpecularBTxf = CreateTextField(editor.gui.properties.handle, "matSpecularBTxf", 194, 326, 53, "0")

	editor.gui.properties.edit.entity.matAmbientRTxf = CreateTextField(editor.gui.properties.handle, "matAmbientRTxf", 80, 348, 53, "0")
	editor.gui.properties.edit.entity.matAmbientGTxf = CreateTextField(editor.gui.properties.handle, "matAmbientGTxf", 137, 348, 53, "0")
	editor.gui.properties.edit.entity.matAmbientBTxf = CreateTextField(editor.gui.properties.handle, "matAmbientBTxf", 194, 348, 53, "0")

	editor.gui.properties.edit.entity.matSpecPowerTxf = CreateTextField(editor.gui.properties.handle, "matSpecPowerTxf", 80, 370, 168, "0")

	editor.gui.properties.edit.entity.matLightingCb = CreateCheckBox(editor.gui.properties.handle, "matLightingCb", 80, 395, false)

	editor.gui.properties.edit.entity.matPrlxScaleTxf = CreateTextField(editor.gui.properties.handle, "matPrlxScaleTxf", 80, 414, 168, "0")
	editor.gui.properties.edit.entity.matAlphaTestCb = CreateCheckBox(editor.gui.properties.handle, "matAlphaTestCb", 80, 439, false)
	editor.gui.properties.edit.entity.matAlphaThrsTxf = CreateTextField(editor.gui.properties.handle, "matAlphaThrsTxf", 80, 458, 168, "0")

	editor.gui.properties.edit.entity.matDiffuseMapTxf = CreateTextField(editor.gui.properties.handle, "matDiffuseMapTxf", 80, 480, 147, "")
	editor.gui.properties.edit.entity.matNormalMapTxf = CreateTextField(editor.gui.properties.handle, "matNormalMapTxf", 80, 502, 147, "")
	editor.gui.properties.edit.entity.matHeightMapTxf = CreateTextField(editor.gui.properties.handle, "matHeightMapTxf", 80, 524, 147, "")
	editor.gui.properties.edit.entity.matSpecMapTxf = CreateTextField(editor.gui.properties.handle, "matSpecMapTxf", 80, 546, 147, "")
	editor.gui.properties.edit.entity.matLightMapTxf = CreateTextField(editor.gui.properties.handle, "matLightMapTxf", 80, 568, 147, "")

	editor.gui.properties.edit.entity.matDiffuseMapOpen = CreateButton(editor.gui.properties.handle, "matDiffuseMapOpen", 231, 480, 18, 18, "...")
	editor.gui.properties.edit.entity.matNormalMapOpen = CreateButton(editor.gui.properties.handle, "matDiffuseMapOpen", 231, 502, 18, 18, "...")
	editor.gui.properties.edit.entity.matHeightMapOpen = CreateButton(editor.gui.properties.handle, "matDiffuseMapOpen", 231, 524, 18, 18, "...")
	editor.gui.properties.edit.entity.matSpecMapOpen = CreateButton(editor.gui.properties.handle, "matDiffuseMapOpen", 231, 546, 18, 18, "...")
	editor.gui.properties.edit.entity.matLightMapOpen = CreateButton(editor.gui.properties.handle, "matDiffuseMapOpen", 231, 568, 18, 18, "...")

	-- setup the particles properties

	editor.gui.properties.edit.particles = {}

	editor.gui.properties.edit.particles.maxCountLab = CreateLabel(editor.gui.properties.handle, "maxCountLab", 4, 52, "Max Count")
	editor.gui.properties.edit.particles.drawModeLab = CreateLabel(editor.gui.properties.handle, "drawModeLab", 4, 74, "Draw Mode")
	editor.gui.properties.edit.particles.textureLab = CreateLabel(editor.gui.properties.handle, "textureLab", 4, 96, "Texture")
	editor.gui.properties.edit.particles.modelLab = CreateLabel(editor.gui.properties.handle, "modelLab", 4, 118, "Model")
	editor.gui.properties.edit.particles.entityLab = CreateLabel(editor.gui.properties.handle, "entityLab", 4, 140, "Entity")
	editor.gui.properties.edit.particles.gravityLab = CreateLabel(editor.gui.properties.handle, "gravityLab", 4, 162, "Gravity")
	editor.gui.properties.edit.particles.spawnDelayLab = CreateLabel(editor.gui.properties.handle, "spawnDelayLab", 4, 184, "Spn Delay")
	editor.gui.properties.edit.particles.spawnLab = CreateLabel(editor.gui.properties.handle, "spawnLab", 4, 206, "Spawn")

	editor.gui.properties.edit.particles.sizeLab = CreateLabel(editor.gui.properties.handle, "sizeLab", 4, 228, "Size")
	editor.gui.properties.edit.particles.sizeGrowLab = CreateLabel(editor.gui.properties.handle, "sizeGrowLab", 4, 250, "Size Grow")
	editor.gui.properties.edit.particles.rotationLab = CreateLabel(editor.gui.properties.handle, "rotationLab", 4, 272, "Rotation")
	editor.gui.properties.edit.particles.rotGrowLab = CreateLabel(editor.gui.properties.handle, "rotGrowLab", 4, 294, "Rot. Grow")
	editor.gui.properties.edit.particles.lifeSpanLab = CreateLabel(editor.gui.properties.handle, "lifeSpanLab", 4, 316, "Life Span")
	editor.gui.properties.edit.particles.fadeSpeedLab = CreateLabel(editor.gui.properties.handle, "fadeSpeedLab", 4, 338, "Fade Speed")
	editor.gui.properties.edit.particles.posMinLab = CreateLabel(editor.gui.properties.handle, "posMinLab", 4, 360, "Pos. Min")
	editor.gui.properties.edit.particles.posMaxLab = CreateLabel(editor.gui.properties.handle, "posMaxLab", 4, 382, "Pos. Max")
	editor.gui.properties.edit.particles.velMinLab = CreateLabel(editor.gui.properties.handle, "velMinLab", 4, 404, "Vel. Min")
	editor.gui.properties.edit.particles.velMaxLab = CreateLabel(editor.gui.properties.handle, "velMaxLab", 4, 426, "Vel. Max")
	editor.gui.properties.edit.particles.colorMinLab = CreateLabel(editor.gui.properties.handle, "colorMinLab", 4, 448, "Color Min")
	editor.gui.properties.edit.particles.colorMaxLab = CreateLabel(editor.gui.properties.handle, "colorMaxLab", 4, 492, "Color Max")

	SetGuiObjectColor(editor.gui.properties.edit.particles.maxCountLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.drawModeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.textureLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.modelLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.entityLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.gravityLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.spawnDelayLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.spawnLab, 1.0, 1.0, 1.0, 0.6)

	SetGuiObjectColor(editor.gui.properties.edit.particles.sizeLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.sizeGrowLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.rotationLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.rotGrowLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.lifeSpanLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.fadeSpeedLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.posMinLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.posMaxLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.velMinLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.velMaxLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.colorMinLab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.colorMaxLab, 1.0, 1.0, 1.0, 0.6)

	editor.gui.properties.edit.particles.maxCountTxf = CreateTextField(editor.gui.properties.handle, "maxCountTxf", 80, 48, 168, "0")
	editor.gui.properties.edit.particles.trsCb = CreateButton(editor.gui.properties.handle, "trsCb", 80, 70, 82, 18, "Transparent")
	editor.gui.properties.edit.particles.addCb = CreateButton(editor.gui.properties.handle, "addCb", 166, 70, 82, 18, "Additive")
	editor.gui.properties.edit.particles.textureTxf = CreateTextField(editor.gui.properties.handle, "textureTxf", 80, 92, 147, "")
	editor.gui.properties.edit.particles.textureOpen = CreateButton(editor.gui.properties.handle, "textureOpen", 231, 92, 18, 18, "...")
	editor.gui.properties.edit.particles.modelTxf = CreateTextField(editor.gui.properties.handle, "modelTxf", 80, 114, 168, "")
	editor.gui.properties.edit.particles.entityTxf = CreateTextField(editor.gui.properties.handle, "entityTxf", 80, 136, 168, "")

	editor.gui.properties.edit.particles.gravityXTxf = CreateTextField(editor.gui.properties.handle, "gravityXTxf", 80, 158, 53, "0")
	editor.gui.properties.edit.particles.gravityYTxf = CreateTextField(editor.gui.properties.handle, "gravityYTxf", 137, 158, 53, "0")
	editor.gui.properties.edit.particles.gravityZTxf = CreateTextField(editor.gui.properties.handle, "gravityZTxf", 194, 158, 53, "0")

	editor.gui.properties.edit.particles.spawnDelayTxf = CreateTextField(editor.gui.properties.handle, "spawnDelayTxf", 80, 180, 168, "0")
	editor.gui.properties.edit.particles.spawnCb = CreateCheckBox(editor.gui.properties.handle, "spawnCb", 80, 205, false)

	editor.gui.properties.edit.particles.sizeMinTxf = CreateTextField(editor.gui.properties.handle, "sizeMinTxf", 80, 224, 82, "0")
	editor.gui.properties.edit.particles.sizeMaxTxf = CreateTextField(editor.gui.properties.handle, "sizeMaxTxf", 166, 224, 82, "0")

	editor.gui.properties.edit.particles.sizeGrowMinTxf = CreateTextField(editor.gui.properties.handle, "sizeGrowMinTxf", 80, 246, 82, "0")
	editor.gui.properties.edit.particles.sizeGrowMaxTxf = CreateTextField(editor.gui.properties.handle, "sizeGrowMaxTxf", 166, 246, 82, "0")

	editor.gui.properties.edit.particles.rotationMinTxf = CreateTextField(editor.gui.properties.handle, "rotationMinTxf", 80, 268, 82, "0")
	editor.gui.properties.edit.particles.rotationMaxTxf = CreateTextField(editor.gui.properties.handle, "rotationMaxTxf", 166, 268, 82, "0")

	editor.gui.properties.edit.particles.rotGrowMinTxf = CreateTextField(editor.gui.properties.handle, "rotGrowMinTxf", 80, 290, 82, "0")
	editor.gui.properties.edit.particles.rotGrowMaxTxf = CreateTextField(editor.gui.properties.handle, "rotGrowMaxTxf", 166, 290, 82, "0")

	editor.gui.properties.edit.particles.lifeSpanMinTxf = CreateTextField(editor.gui.properties.handle, "lifeSpanMinTxf", 80, 312, 82, "0")
	editor.gui.properties.edit.particles.lifeSpanMaxTxf = CreateTextField(editor.gui.properties.handle, "lifeSpanMaxTxf", 166, 312, 82, "0")

	editor.gui.properties.edit.particles.fadeSpeedMinTxf = CreateTextField(editor.gui.properties.handle, "fadeSpeedMinTxf", 80, 334, 82, "0")
	editor.gui.properties.edit.particles.fadeSpeedMaxTxf = CreateTextField(editor.gui.properties.handle, "fadeSpeedMaxTxf", 166, 334, 82, "0")

	editor.gui.properties.edit.particles.posMinXTxf = CreateTextField(editor.gui.properties.handle, "posMinTxf", 80, 356, 53, "0")
	editor.gui.properties.edit.particles.posMinYTxf = CreateTextField(editor.gui.properties.handle, "posMinTxf", 137, 356, 53, "0")
	editor.gui.properties.edit.particles.posMinZTxf = CreateTextField(editor.gui.properties.handle, "posMinTxf", 194, 356, 53, "0")

	editor.gui.properties.edit.particles.posMaxXTxf = CreateTextField(editor.gui.properties.handle, "posMaxTxf", 80, 378, 53, "0")
	editor.gui.properties.edit.particles.posMaxYTxf = CreateTextField(editor.gui.properties.handle, "posMaxTxf", 137, 378, 53, "0")
	editor.gui.properties.edit.particles.posMaxZTxf = CreateTextField(editor.gui.properties.handle, "posMaxTxf", 194, 378, 53, "0")

	editor.gui.properties.edit.particles.velMinXTxf = CreateTextField(editor.gui.properties.handle, "velMinTxf", 80, 400, 53, "0")
	editor.gui.properties.edit.particles.velMinYTxf = CreateTextField(editor.gui.properties.handle, "velMinTxf", 137, 400, 53, "0")
	editor.gui.properties.edit.particles.velMinZTxf = CreateTextField(editor.gui.properties.handle, "velMinTxf", 194, 400, 53, "0")

	editor.gui.properties.edit.particles.velMaxXTxf = CreateTextField(editor.gui.properties.handle, "velMaxTxf", 80, 422, 53, "0")
	editor.gui.properties.edit.particles.velMaxYTxf = CreateTextField(editor.gui.properties.handle, "velMaxTxf", 137, 422, 53, "0")
	editor.gui.properties.edit.particles.velMaxZTxf = CreateTextField(editor.gui.properties.handle, "velMaxTxf", 194, 422, 53, "0")

	editor.gui.properties.edit.particles.colorMinRTxf = CreateTextField(editor.gui.properties.handle, "colorMinRTxf", 4, 466, 58, "0")
	editor.gui.properties.edit.particles.colorMinGTxf = CreateTextField(editor.gui.properties.handle, "colorMinGTxf", 66, 466, 58, "0")
	editor.gui.properties.edit.particles.colorMinBTxf = CreateTextField(editor.gui.properties.handle, "colorMinBTxf", 128, 466, 58, "0")
	editor.gui.properties.edit.particles.colorMinATxf = CreateTextField(editor.gui.properties.handle, "colorMinATxf", 190, 466, 58, "0")

	editor.gui.properties.edit.particles.colorMaxRTxf = CreateTextField(editor.gui.properties.handle, "colorMaxRTxf", 4, 510, 58, "0")
	editor.gui.properties.edit.particles.colorMaxGTxf = CreateTextField(editor.gui.properties.handle, "colorMaxGTxf", 66, 510, 58, "0")
	editor.gui.properties.edit.particles.colorMaxBTxf = CreateTextField(editor.gui.properties.handle, "colorMaxBTxf", 128, 510, 58, "0")
	editor.gui.properties.edit.particles.colorMaxATxf = CreateTextField(editor.gui.properties.handle, "colorMaxATxf", 190, 510, 58, "0")

	-- setup the sprite properties

	editor.gui.properties.edit.sprite = {}

	-- setup the post processing tab

	editor.gui.properties.pp = {}

	-- setup the bloom settings

	editor.gui.properties.pp.bloomEnb = CreateLabel(editor.gui.properties.handle, "bloomEnb", 4, 32, "Bloom")
	editor.gui.properties.pp.bloomStr = CreateLabel(editor.gui.properties.handle, "bloomThr", 4, 52, "Threshold")
	editor.gui.properties.pp.bloomCb = CreateCheckBox(editor.gui.properties.handle, "bloomCb", 100, 30, false)
	editor.gui.properties.pp.bloomStrSli = CreateSlider(editor.gui.properties.handle, "bloomStrSli", 100, 55, 148, 0, 0.5)

	SetGuiObjectColor(editor.gui.properties.pp.bloomEnb, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.pp.bloomStr, 1.0, 1.0, 1.0, 0.6)

	-- setup the DOF settings

	editor.gui.properties.pp.dofEnb = CreateLabel(editor.gui.properties.handle, "dofEnb", 4, 85, "Dof")
	editor.gui.properties.pp.dofFocRng = CreateLabel(editor.gui.properties.handle, "dofFocRng", 4, 107, "Focal Range")
	editor.gui.properties.pp.dofFocDst = CreateLabel(editor.gui.properties.handle, "dofFocDst", 4, 129, "Focal Dist")
	editor.gui.properties.pp.dofEnbCb = CreateCheckBox(editor.gui.properties.handle, "dofEnbCb", 100, 83, false)
	editor.gui.properties.pp.dofFocRngTxf = CreateTextField(editor.gui.properties.handle, "dofFocRngTxf", 100, 102, 148, "7.5")
	editor.gui.properties.pp.dofFocDstTxf = CreateTextField(editor.gui.properties.handle, "dofFocDstTxf", 100, 124, 148, "15")

	SetGuiObjectColor(editor.gui.properties.pp.dofEnb, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.pp.dofFocRng, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.pp.dofFocDst, 1.0, 1.0, 1.0, 0.6)

	-- setup the light shaft settings

	editor.gui.properties.pp.lshEnb = CreateLabel(editor.gui.properties.handle, "lshEnb", 4, 163, "Light Shafts")
	editor.gui.properties.pp.lshStr = CreateLabel(editor.gui.properties.handle, "lshStr", 4, 185, "Strength")
	editor.gui.properties.pp.lshEnbCb = CreateCheckBox(editor.gui.properties.handle, "lshEnbCb", 100, 161, false)
	editor.gui.properties.pp.lshStrSli = CreateSlider(editor.gui.properties.handle, "lshStrSli", 100, 188, 148, 0, 1.0)

	SetGuiObjectColor(editor.gui.properties.pp.lshEnb, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.pp.lshStr, 1.0, 1.0, 1.0, 0.6)

	-- hide other tabs and show

	ediHideEditTab(EDI_EDIT_CAMERA)
	ediHideEditTab(EDI_EDIT_LIGHT)
	ediHideEditTab(EDI_EDIT_ENTITY)
	ediHideEditTab(EDI_EDIT_PARTICLES)
	ediHideEditTab(EDI_EDIT_SPRITES)
	ediSwitchEditTab(EDI_EDIT_ACTOR)

	ediHidePropertiesTab(EDI_PROPERTIES_EDIT)
	ediHidePropertiesTab(EDI_PROPERTIES_PP)
	ediSwitchPropertiesTab(EDI_PROPERTIES_MENU)
end

function ediHideEditTab(tab)
	if tab == EDI_EDIT_ACTOR then
		for k, v in pairs(editor.gui.properties.edit.actor) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_CAMERA then
		for k, v in pairs(editor.gui.properties.edit.camera) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_LIGHT then
		for k, v in pairs(editor.gui.properties.edit.light) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_ENTITY then
		for k, v in pairs(editor.gui.properties.edit.entity) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_PARTICLES then
		for k, v in pairs(editor.gui.properties.edit.particles) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_SPRITE then
		for k, v in pairs(editor.gui.properties.edit.sprite) do SetGuiObjectVisible(v, false) end
	end
end

function ediShowEditTab(tab)
	if tab == EDI_EDIT_ACTOR then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.actor) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_CAMERA then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.camera) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_LIGHT then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.light) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_ENTITY then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.entity) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_PARTICLES then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.particles) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_SPRITE then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.sprite) do SetGuiObjectVisible(v, true) end
		end
	end

	if editor.scene.selection ~= nil then
		if GetObjectType(editor.scene.selection) == CAMERA then
			SetGuiObjectVisible(editor.gui.properties.edit.camCb, true)
			SetGuiObjectVisible(editor.gui.properties.edit.ligCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.entCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.parCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.sprCb, false)
		elseif GetObjectType(editor.scene.selection) == LIGHT then
			SetGuiObjectVisible(editor.gui.properties.edit.camCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.ligCb, true)
			SetGuiObjectVisible(editor.gui.properties.edit.entCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.parCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.sprCb, false)
		elseif GetObjectType(editor.scene.selection) == ENTITY then
			SetGuiObjectVisible(editor.gui.properties.edit.camCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.ligCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.entCb, true)
			SetGuiObjectVisible(editor.gui.properties.edit.parCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.sprCb, false)
		elseif GetObjectType(editor.scene.selection) == PARTICLES then
			SetGuiObjectVisible(editor.gui.properties.edit.camCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.ligCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.entCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.parCb, true)
			SetGuiObjectVisible(editor.gui.properties.edit.sprCb, false)
		elseif GetObjectType(editor.scene.selection) == SPRITE then
			SetGuiObjectVisible(editor.gui.properties.edit.camCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.ligCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.entCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.parCb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.sprCb, true)
		end
	end
end

function ediSwitchEditTab(tab)
	ediHideEditTab(editor.gui.properties.edit.currentTab)
	ediShowEditTab(tab)

	editor.gui.properties.edit.currentTab = tab
end

function ediHidePropertiesTab(tab)
	if tab == EDI_PROPERTIES_MENU then
		for k, v in pairs(editor.gui.properties.menu) do SetGuiObjectVisible(v, false) end
	elseif tab == EDI_PROPERTIES_EDIT then
		SetGuiObjectVisible(editor.gui.properties.edit.actCb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.camCb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.ligCb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.entCb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.parCb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.sprCb, false)
		ediHideEditTab(editor.gui.properties.edit.currentTab)
	elseif tab == EDI_PROPERTIES_PP then
		for k, v in pairs(editor.gui.properties.pp) do SetGuiObjectVisible(v, false) end
	end
end

function ediShowPropertiesTab(tab)
	if tab == EDI_PROPERTIES_MENU then
		for k, v in pairs(editor.gui.properties.menu) do SetGuiObjectVisible(v, true) end
	elseif tab == EDI_PROPERTIES_EDIT then
		SetGuiObjectVisible(editor.gui.properties.edit.actCb, true)
		ediSwitchEditTab(EDI_EDIT_ACTOR)
	elseif tab == EDI_PROPERTIES_PP then
		for k, v in pairs(editor.gui.properties.pp) do SetGuiObjectVisible(v, true) end
	end
end

function ediSwitchPropertiesTab(tab)
	ediHidePropertiesTab(editor.gui.properties.currentTab)
	ediShowPropertiesTab(tab)

	editor.gui.properties.currentTab = tab
end

function ediOpenProperties()
	ediDisableCurrentMenu()

	editor.gui.currentMenu = EDI_PROPERTIES

	SetGuiObjectVisible(editor.gui.properties.handle, true)
end

function ediUpdateEditSelection()
	if editor.scene.selection == nil then
		if editor.gui.properties.currenTab == EDI_PROPERTIES_EDIT then
			ediHideEditTab(editor.gui.properties.edit.currentTab)
		end
		return
	end

	if editor.gui.properties.currentTab == EDI_PROPERTIES_EDIT then
		ediSwitchEditTab(EDI_EDIT_ACTOR)
	end

	-- update actor properties

	SetTextFieldText(editor.gui.properties.edit.actor.nameTxf, GetActorName(editor.scene.selection))
	local pos = GetActorPosition(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.posXTxf, tostring(pos.x))
	SetTextFieldText(editor.gui.properties.edit.actor.posYTxf, tostring(pos.y))
	SetTextFieldText(editor.gui.properties.edit.actor.posZTxf, tostring(pos.z))
	local rot = GetActorRotation(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.rotXTxf, tostring(rot.x))
	SetTextFieldText(editor.gui.properties.edit.actor.rotYTxf, tostring(rot.y))
	SetTextFieldText(editor.gui.properties.edit.actor.rotZTxf, tostring(rot.z))
	local scr = GetActorScript(editor.scene.selection)
	if scr ~= nil then
		SetTextFieldText(editor.gui.properties.edit.actor.scriptTxf, GetScriptName(scr))
	else
		SetTextFieldText(editor.gui.properties.edit.actor.scriptTxf, "")
	end

	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.nameTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.posXTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.posYTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.posZTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rotXTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rotYTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rotZTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.scriptTxf, 0)

	if IsActorPhysics(editor.scene.selection) == true then
		SetCheckBoxState(editor.gui.properties.edit.actor.physicsEnbCb, true)
	else
		SetCheckBoxState(editor.gui.properties.edit.actor.physicsEnbCb, false)
	end

	local lengths = GetActorBoundingLengths(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.lengthsXTxf, tostring(lengths.x))
	SetTextFieldText(editor.gui.properties.edit.actor.lengthsYTxf, tostring(lengths.y))
	SetTextFieldText(editor.gui.properties.edit.actor.lengthsZTxf, tostring(lengths.z))
	local offset = GetActorBoundingOffset(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.offsetXTxf, tostring(offset.x))
	SetTextFieldText(editor.gui.properties.edit.actor.offsetYTxf, tostring(offset.y))
	SetTextFieldText(editor.gui.properties.edit.actor.offsetZTxf, tostring(offset.z))
	SetTextFieldText(editor.gui.properties.edit.actor.massTxf, tostring(GetActorMass(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.linDampTxf, tostring(GetActorLinearDamping(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.angDampTxf, tostring(GetActorAngularDamping(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.linSleepTxf, tostring(GetActorLinearSleepThreshold(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.angSleepTxf, tostring(GetActorAngularSleepThreshold(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.restituTxf, tostring(GetActorRestitution(editor.scene.selection)))
	local anisFric = GetActorAnisotropicFriction(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.anisFricXTxf, tostring(anisFric.x))
	SetTextFieldText(editor.gui.properties.edit.actor.anisFricYTxf, tostring(anisFric.y))
	SetTextFieldText(editor.gui.properties.edit.actor.anisFricZTxf, tostring(anisFric.z))
	local linFactor = GetActorLinearFactor(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.linFactorXTxf, tostring(linFactor.x))
	SetTextFieldText(editor.gui.properties.edit.actor.linFactorYTxf, tostring(linFactor.y))
	SetTextFieldText(editor.gui.properties.edit.actor.linFactorZTxf, tostring(linFactor.z))
	local angFactor = GetActorAngularFactor(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.angFactorXTxf, tostring(angFactor.x))
	SetTextFieldText(editor.gui.properties.edit.actor.angFactorYTxf, tostring(angFactor.y))
	SetTextFieldText(editor.gui.properties.edit.actor.angFactorZTxf, tostring(angFactor.z))
	SetTextListSelection(editor.gui.properties.edit.actor.shape, GetActorShape(editor.scene.selection)-1)

	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengthsXTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengthsYTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengthsZTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offsetXTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offsetYTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offsetZTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.massTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.linDampTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.angDampTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.linSleepTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.angSleepTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.restituTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anisFricXTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anisFricYTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anisFricZTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.linFactorXTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.linFactorYTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.linFactorZTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.angFactorXTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.angFactorYTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.angFactorZTxf, 0)

	if GetObjectType(editor.scene.selection) == CAMERA then
		SetTextFieldText(editor.gui.properties.edit.camera.fovTxf, GetCameraFov(editor.scene.selection))
		local clip = GetCameraClip(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.camera.clipNearTxf, clip.x)
		SetTextFieldText(editor.gui.properties.edit.camera.clipFarTxf, clip.y)

		SetTextFieldCursorPosition(editor.gui.properties.edit.camera.fovTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.camera.clipNearTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.camera.clipFarTxf, 0)
	elseif GetObjectType(editor.scene.selection) == LIGHT then
		local color = GetLightColor(editor.scene.selection)
		SetTextListSelection(editor.gui.properties.edit.light.typeTxl, GetLightType(editor.scene.selection)-1)

		SetTextFieldText(editor.gui.properties.edit.light.colorRTxf, color.r)
		SetTextFieldText(editor.gui.properties.edit.light.colorGTxf, color.g)
		SetTextFieldText(editor.gui.properties.edit.light.colorBTxf, color.b)

		SetTextFieldText(editor.gui.properties.edit.light.distanceTxf, GetLightDistance(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.light.fadeSpeedTxf, GetLightFadeSpeed(editor.scene.selection))

		SetTextFieldText(editor.gui.properties.edit.light.innerConeTxf, GetLightCone(editor.scene.selection).x)
		SetTextFieldText(editor.gui.properties.edit.light.outerConeTxf, GetLightCone(editor.scene.selection).y)

		SetCheckBoxState(editor.gui.properties.edit.light.shadowsCb, GetLightShadows(editor.scene.selection))

		SetCheckBoxState(editor.gui.properties.edit.light.lsEnabledCb, IsLightShaft(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.light.sizeTxf, GetLightShaftSize(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.light.intensityTxf, GetLightShaftIntensity(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.light.fadeOffTxf, GetLightShaftFadeOff(editor.scene.selection))

		SetTextFieldCursorPosition(editor.gui.properties.edit.light.colorRTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.colorGTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.colorBTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.distanceTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.fadeSpeedTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.innerConeTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.outerConeTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.sizeTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.intensityTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.fadeOffTxf, 0)
	elseif GetObjectType(editor.scene.selection) == ENTITY then
		local mdl = GetEntityModel(editor.scene.selection)
		if mdl ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.modelTxf, GetModelName(mdl))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.modelTxf, "")
		end

		local scale = GetEntityScale(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.entity.scaleXTxf, scale.x)
		SetTextFieldText(editor.gui.properties.edit.entity.scaleYTxf, scale.y)
		SetTextFieldText(editor.gui.properties.edit.entity.scaleZTxf, scale.z)

		RemoveTextListItems(editor.gui.properties.edit.entity.materialsTxl)
		for i=0, GetEntityMaterialCount(editor.scene.selection)-1 do
			local mat = GetEntityMaterial(editor.scene.selection, i)
			AddTextListItem(editor.gui.properties.edit.entity.materialsTxl, GetMaterialName(mat))
		end

		if GetEntityMaterialCount(editor.scene.selection) > 0 then
			SetTextListSelection(editor.gui.properties.edit.entity.materialsTxl, 0)
			editor.scene.material = GetEntityMaterial(editor.scene.selection, 0)
		else
			SetTextListSelection(editor.gui.properties.edit.entity.materialsTxl, -1)
		end

		ediUpdateEditSelectionMaterial()

		SetTextFieldCursorPosition(editor.gui.properties.edit.entity.modelTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.entity.scaleXTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.entity.scaleYTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.entity.scaleZTxf, 0)
	elseif GetObjectType(editor.scene.selection) == PARTICLES then
		SetTextFieldText(editor.gui.properties.edit.particles.maxCountTxf, GetParticlesMaxCount(editor.scene.selection))

		local tex = GetParticlesTexture(editor.scene.selection)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.particles.textureTxf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.particles.textureTxf, "")
		end

		local mdl = GetParticlesModel(editor.scene.selection)
		if mdl ~= nil then
			SetTextFieldText(editor.gui.properties.edit.particles.modelTxf, GetModelName(mdl))
		else
			SetTextFieldText(editor.gui.properties.edit.particles.modelTxf, "")
		end

		local ent = GetParticlesEntity(editor.scene.selection)
		if ent ~= nil then
			SetTextFieldText(editor.gui.properties.edit.particles.entityTxf, GetActorName(ent))
		else
			SetTextFieldText(editor.gui.properties.edit.particles.entityTxf, "")
		end

		local gravity = GetParticlesGravity(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.gravityXTxf, gravity.x)
		SetTextFieldText(editor.gui.properties.edit.particles.gravityYTxf, gravity.y)
		SetTextFieldText(editor.gui.properties.edit.particles.gravityZTxf, gravity.z)

		SetTextFieldText(editor.gui.properties.edit.particles.spawnDelayTxf, GetParticlesSpawnDelay(editor.scene.selection))
		SetCheckBoxState(editor.gui.properties.edit.particles.spawnCb, GetParticlesSpawn(editor.scene.selection))

		SetTextFieldText(editor.gui.properties.edit.particles.sizeMinTxf, GetParticlesSizeMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.sizeMaxTxf, GetParticlesSizeMax(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.sizeGrowMinTxf, GetParticlesSizeGrowthMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.sizeGrowMaxTxf, GetParticlesSizeGrowthMax(editor.scene.selection))

		SetTextFieldText(editor.gui.properties.edit.particles.rotationMinTxf, GetParticlesRotationMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.rotationMaxTxf, GetParticlesRotationMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.rotGrowMinTxf, GetParticlesRotationGrowthMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.rotGrowMaxTxf, GetParticlesRotationGrowthMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.lifeSpanMinTxf, GetParticlesLifeSpanMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.lifeSpanMaxTxf, GetParticlesLifeSpanMax(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.fadeSpeedMinTxf, GetParticlesFadeSpeedMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.fadeSpeedMaxTxf, GetParticlesFadeSpeedMax(editor.scene.selection))

		local pos = GetParticlesPositionMin(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.posMinXTxf, pos.x)
		SetTextFieldText(editor.gui.properties.edit.particles.posMinYTxf, pos.y)
		SetTextFieldText(editor.gui.properties.edit.particles.posMinZTxf, pos.z)

		local pos = GetParticlesPositionMax(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.posMaxXTxf, pos.x)
		SetTextFieldText(editor.gui.properties.edit.particles.posMaxYTxf, pos.y)
		SetTextFieldText(editor.gui.properties.edit.particles.posMaxZTxf, pos.z)

		local vel = GetParticlesVelocityMin(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.velMinXTxf, vel.x)
		SetTextFieldText(editor.gui.properties.edit.particles.velMinYTxf, vel.y)
		SetTextFieldText(editor.gui.properties.edit.particles.velMinZTxf, vel.z)

		local vel = GetParticlesVelocityMax(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.velMaxXTxf, vel.x)
		SetTextFieldText(editor.gui.properties.edit.particles.velMaxYTxf, vel.y)
		SetTextFieldText(editor.gui.properties.edit.particles.velMaxZTxf, vel.z)

		local color = GetParticlesColorMin(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.colorMinRTxf, color.r)
		SetTextFieldText(editor.gui.properties.edit.particles.colorMinGTxf, color.g)
		SetTextFieldText(editor.gui.properties.edit.particles.colorMinBTxf, color.b)
		SetTextFieldText(editor.gui.properties.edit.particles.colorMinATxf, color.a)

		local color = GetParticlesColorMax(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.colorMaxRTxf, color.r)
		SetTextFieldText(editor.gui.properties.edit.particles.colorMaxGTxf, color.g)
		SetTextFieldText(editor.gui.properties.edit.particles.colorMaxBTxf, color.b)
		SetTextFieldText(editor.gui.properties.edit.particles.colorMaxATxf, color.a)

		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.maxCountTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.textureTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.modelTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.entityTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravityXTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravityYTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravityZTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.spawnDelayTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.sizeMinTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.sizeMaxTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.sizeGrowMinTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.sizeGrowMaxTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rotationMinTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rotationMaxTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rotGrowMinTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rotGrowMaxTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.lifeSpanMinTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.lifeSpanMaxTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.fadeSpeedMinTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.fadeSpeedMaxTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.posMinXTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.posMinYTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.posMinZTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.posMaxXTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.posMaxYTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.posMaxZTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.velMinXTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.velMinYTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.velMinZTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.velMaxXTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.velMaxYTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.velMaxZTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.colorMinRTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.colorMinGTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.colorMinBTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.colorMinATxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.colorMaxRTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.colorMaxGTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.colorMaxBTxf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.colorMaxATxf, 0)
	elseif GetObjectType(editor.scene.selection) == SPRITE then
	end
end

function ediUpdateEditSelectionMaterial()
	local index = GetTextListSelectionIndex(editor.gui.properties.edit.entity.materialsTxl)
	if index < 0 then
		SetTextFieldText(editor.gui.properties.edit.entity.matNameTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseRTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseGTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseBTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseATxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecularRTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecularGTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecularBTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matAmbientRTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matAmbientGTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matAmbientBTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecPowerTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matPrlxScaleTxf, "")
		SetCheckBoxState(editor.gui.properties.edit.entity.matLightingCb, false)
		SetTextFieldText(editor.gui.properties.edit.entity.matAlphaThrsTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseMapTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matNormalMapTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matHeightMapTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecMapTxf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.matLightMapTxf, "")
	else
		local mat = GetEntityMaterial(editor.scene.selection, index)
		SetTextFieldText(editor.gui.properties.edit.entity.matNameTxf, GetMaterialName(mat))
		local col = GetMaterialDiffuseColor(mat)
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseRTxf, col.r)
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseGTxf, col.g)
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseBTxf, col.b)
		SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseATxf, col.a)
		local col = GetMaterialSpecularColor(mat)
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecularRTxf, col.r)
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecularGTxf, col.g)
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecularBTxf, col.b)
		local col = GetMaterialAmbientColor(mat)
		SetTextFieldText(editor.gui.properties.edit.entity.matAmbientRTxf, col.r)
		SetTextFieldText(editor.gui.properties.edit.entity.matAmbientGTxf, col.g)
		SetTextFieldText(editor.gui.properties.edit.entity.matAmbientBTxf, col.b)
		SetTextFieldText(editor.gui.properties.edit.entity.matSpecPowerTxf, GetMaterialSpecularPower(mat))
		SetCheckBoxState(editor.gui.properties.edit.entity.matLightingCb, GetMaterialLighting(mat))
		SetTextFieldText(editor.gui.properties.edit.entity.matPrlxScaleTxf, GetMaterialParallaxScale(mat))
		SetCheckBoxState(editor.gui.properties.edit.entity.matAlphaTestCb, GetMaterialAlphaTest(mat))
		SetTextFieldText(editor.gui.properties.edit.entity.matAlphaThrsTxf, GetMaterialAlphaThreshold(mat))
		local tex = GetMaterialDiffuseMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseMapTxf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseMapTxf, "")
		end
		tex = GetMaterialNormalMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.matNormalMapTxf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.matNormalMapTxf, "")
		end
		tex = GetMaterialHeightMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.matHeightMapTxf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.matHeightMapTxf, "")
		end
		tex = GetMaterialSpecularMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.matSpecMapTxf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.matSpecMapTxf, "")
		end
		tex = GetMaterialLightMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.matLightMapTxf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.matLightMapTxf, "")
		end
	end

	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matNameTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matDiffuseRTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matDiffuseGTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matDiffuseBTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matDiffuseATxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matSpecularRTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matSpecularGTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matSpecularBTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matAmbientRTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matAmbientGTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matAmbientBTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matSpecPowerTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matPrlxScaleTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matAlphaThrsTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matDiffuseMapTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matNormalMapTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matHeightMapTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matSpecMapTxf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.matLightMapTxf, 0)
end

function ediUpdatePropertiesSelection()
	ediUpdateEditSelection()
end

function ediPropertiesMenuOpen(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	if ediLoadScene(path) == true then
		ediOpenProperties()
	end
end

function ediPropertiesMenuSave(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	if ediSaveScene(path) == true then
		ediOpenProperties()
	end
end

function ediPropertiesMenuImportScene(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	local scn = CreateSceneFromFile(path)
	if scn ~= nil then

		print("importing scene \"" .. path .. "\"")
		print("  cameras: " .. GetSceneCameraCount(scn))
		print("  entities: " .. GetSceneEntityCount(scn))
		print("  lights: " .. GetSceneLightCount(scn))
		print("  sprites: " .. GetSceneSpriteCount(scn))
		print("  particles: " .. GetSceneParticlesCount(scn))

		while GetSceneCameraByIndex(scn, 0) ~= nil do
			local cam = GetSceneCameraByIndex(scn, 0)
			AddSceneCamera(editor.scene.handle, cam)
		end
		while GetSceneEntityByIndex(scn, 0) ~= nil do
			local ent = GetSceneEntityByIndex(scn, 0)
			AddSceneEntity(editor.scene.handle, ent)
		end
		while GetSceneLightByIndex(scn, 0) ~= nil do
			local lig = GetSceneLightByIndex(scn, 0)
			AddSceneLight(editor.scene.handle, lig)
		end
		while GetSceneSpriteByIndex(scn, 0) ~= nil do
			local spr = GetSceneSpriteByIndex(scn, 0)
			AddSceneSprite(editor.scene.handle, spr)
		end
		while GetSceneParticlesByIndex(scn, 0) ~= nil do
			local par = GetSceneParticlesByIndex(scn, 0)
			AddSceneParticles(editor.scene.handle, par)
		end
		ediOpenProperties()
	end
end

function ediUpdateMenu()
	if GetGuiObjectEvent(editor.gui.properties.menu.open) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Open PAK...", EDI_FILE_DIALOG_OPEN, ediPropertiesMenuOpen)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.save) == CLICKED then
		local path = GetSceneFilePath(editor.scene.handle)
		if path == nil or string.len(path) < 1 then
			path = GetCurrentDirectory()
		else
			path = ediGetParentFolder(path)
		end
		ediOpenFileDialog(path, "Save PAK...", EDI_FILE_DIALOG_SAVE, ediPropertiesMenuSave)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.importScene) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Import Scene (.pak/.dae/.3ds/.md2/...) ...", EDI_FILE_DIALOG_OPEN, ediPropertiesMenuImportScene)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.createCamera) == CLICKED then
		local cam = CreateCamera("Camera")
		AddSceneCamera(editor.scene.handle, cam)

		ediSelectActor(cam)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.createLight) == CLICKED then
		local lig = CreateLight("Light")
		AddSceneLight(editor.scene.handle, lig)

		ediSelectActor(lig)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.createEntity) == CLICKED then
		local ent = CreateEntity("Entity")
		AddSceneEntity(editor.scene.handle, ent)

		ediSelectActor(ent)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.createParticles) == CLICKED then
		local par = CreateParticles("Particles", 25)
		AddSceneParticles(editor.scene.handle, par)

		ediSelectActor(par)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.ambientRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.menu.ambientRTxf, 0.0, nil)
		SetSceneAmbientColor(editor.scene.handle,
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.ambientGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.menu.ambientGTxf, 0.0, nil)
		SetSceneAmbientColor(editor.scene.handle,
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.ambientBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.menu.ambientBTxf, 0.0, nil)
		SetSceneAmbientColor(editor.scene.handle,
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambientBTxf)), 1.0)
	end
end

function ediPropertiesEditActorOpenScript(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	if string.find(path, ".lua") == nil then return end

	local scr = CreateScriptFromFile(path)
	if scr ~= nil then
		SetActorScript(editor.scene.selection, scr)
		ediUpdateEditSelection()
		ediOpenProperties()
	end
end

function ediUpdateActor()
	if GetGuiObjectEvent(editor.gui.properties.edit.actor.nameTxf) == LOSE_FOCUS then
		SetActorName(editor.scene.selection, GetTextFieldText(editor.gui.properties.edit.actor.nameTxf))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.scriptOpen) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Open Script (.lua)...", EDI_FILE_DIALOG_OPEN, ediPropertiesEditActorOpenScript)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.scriptTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.actor.scriptTxf)
		if string.len(name) > 0 then
			local scr = GetActorScript(editor.scene.selection)
			if scr ~= nil then
				SetScriptName(scr, name)
			else
				local scripts = GetSceneScripts(editor.scene.handle)
				scr = BeginList(scripts)
				while scr ~= nil do
					if GetScriptName(scr) == name then
						SetActorScript(editor.scene.selection, scr)
						break
					end
					scr = NextInList(scripts)
				end
				if scr ~= nil then SetTextFieldText(editor.gui.properties.edit.actor.scriptTxf, "") end
			end
		else
			ClearActorScript(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.posXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.posXTxf, nil, nil)
		SetActorPosition(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.posYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.posYTxf, nil, nil)
		SetActorPosition(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.posZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.posZTxf, nil, nil)
		SetActorPosition(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.posZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.rotXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.rotXTxf, nil, nil)
		SetActorRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.rotYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.rotYTxf, nil, nil)
		SetActorRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.rotZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.rotZTxf, nil, nil)
		SetActorRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rotZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.physicsEnbCb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.edit.actor.physicsEnbCb) == true then
			local shape = GetActorShape(editor.scene.selection)
			if shape == 0 then
				SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
				shape = 1
			end
			SetActorPhysics(editor.scene.selection, shape, GetActorMass(editor.scene.selection))
		else
			DisableActorPhysics(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lengthsXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.lengthsXTxf, 0.0, nil)
		SetActorBoundingLengths(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lengthsYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.lengthsYTxf, 0.0, nil)
		SetActorBoundingLengths(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lengthsZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.lengthsZTxf, 0.0, nil)
		SetActorBoundingLengths(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengthsZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.offsetXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.offsetXTxf, 0.0, nil)
		SetActorBoundingOffset(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.offsetYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.offsetYTxf, 0.0, nil)
		SetActorBoundingOffset(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.offsetZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.offsetZTxf, 0.0, nil)
		SetActorBoundingOffset(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offsetZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.massTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.massTxf, 0.0, nil)
		local physics = IsActorPhysics(editor.scene.selection)
		local shape = GetActorShape(editor.scene.selection)
		if shape == 0 then
			SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
			shape = 1
		end
		SetActorPhysics(editor.scene.selection, shape,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.massTxf)))
		if physics == false then DisableActorPhysics(editor.scene.selection) end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.linDampTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.linDampTxf, 0.0, nil)
		SetActorDamping(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linDampTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angDampTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.angDampTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.angDampTxf, 0.0, nil)
		SetActorDamping(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linDampTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angDampTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.linSleepTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.linSleepTxf, 0.0, nil)
		SetActorSleepThresholds(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linSleepTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angSleepTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.angSleepTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.angSleepTxf, 0.0, nil)
		SetActorSleepThresholds(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linSleepTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angSleepTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.restituTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.restituTxf, 0.0, nil)
		SetActorRestitution(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.restituTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.anisFricXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.anisFricXTxf, 0.0, nil)
		SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.anisFricYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.anisFricYTxf, 0.0, nil)
		SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.anisFricZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.anisFricZTxf, 0.0, nil)
		SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anisFricZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.linFactorXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.linFactorXTxf, 0.0, nil)
		SetActorLinearFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.linFactorYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.linFactorYTxf, 0.0, nil)
		SetActorLinearFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.linFactorZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.linFactorZTxf, 0.0, nil)
		SetActorLinearFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.linFactorZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.angFactorXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.angFactorXTxf, 0.0, nil)
		SetActorAngularFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.angFactorYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.angFactorYTxf, 0.0, nil)
		SetActorAngularFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.angFactorZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.actor.angFactorZTxf, 0.0, nil)
		SetActorAngularFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.angFactorZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.shape) == SELECTION_CHANGED then
		local physics = IsActorPhysics(editor.scene.selection)
		local shape = GetTextListSelectionIndex(editor.gui.properties.edit.actor.shape)+1
		if shape == 0 then
			SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
			shape = 1
		end
		SetActorPhysics(editor.scene.selection, shape,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.massTxf)))
		if physics == false then DisableActorPhysics(editor.scene.selection) end
	end

	local diff = GetTextListItemCount(editor.gui.properties.edit.actor.shape)-
		GetTextListRowCount(editor.gui.properties.edit.actor.shape)

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.shapeSb) == VALUE_CHANGED then
		if diff > 0 then
			SetTextListOffset(editor.gui.properties.edit.actor.shape, diff*(1.0-GetSliderValue(editor.gui.properties.edit.actor.shapeSb)))
		end
	end
end

function ediUpdateCamera()
	if GetGuiObjectEvent(editor.gui.properties.edit.camera.fovTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.camera.fovTxf, 0.0, 179.0)
		SetCameraPerspective(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.fovTxf)),
			-1.0, tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clipNearTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clipFarTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.camera.clipNearTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.camera.clipNearTxf, 0.0, nil)
		SetCameraPerspective(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.fovTxf)),
			-1.0, tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clipNearTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clipFarTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.camera.clipFarTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.camera.clipFarTxf, 0.0, nil)
		SetCameraPerspective(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.fovTxf)),
			-1.0, tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clipNearTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clipFarTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.camera.copyBut) == CLICKED then
		local pos = GetActorPosition(editor.scene.selection)
		local rot = GetActorRotation(editor.scene.selection)
		local clip = GetCameraClip(editor.scene.selection)
		SetActorPosition(editor.scene.camera.handle, pos.x, pos.y, pos.z)
		SetActorRotation(editor.scene.camera.handle, rot.x, rot.y, rot.z)
		SetCameraPerspective(editor.scene.camera.handle,
			GetCameraFov(editor.scene.selection), -1.0, clip.x, clip.y)
	end
end

function ediUpdateLight()
	if GetGuiObjectEvent(editor.gui.properties.edit.light.typeTxl) == SELECTION_CHANGED then
		SetLightType(editor.scene.selection, GetTextListSelectionIndex(editor.gui.properties.edit.light.typeTxl)+1)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.colorRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.colorRTxf, 0.0, nil)
		SetLightColor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.colorGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.colorGTxf, 0.0, nil)
		SetLightColor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.colorBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.colorBTxf, 0.0, nil)
		SetLightColor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.colorBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.distanceTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.distanceTxf, 0.0, nil)
		SetLightDistance(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.distanceTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.fadeSpeedTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.fadeSpeedTxf, 0.0, nil)
		SetLightFadeSpeed(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.fadeSpeedTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.innerConeTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.innerConeTxf, 0.0, nil)
		SetLightCone(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.innerConeTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.outerConeTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.outerConeTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.outerConeTxf, 0.0, nil)
		SetLightCone(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.innerConeTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.outerConeTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.shadowsCb) == STATE_CHANGED then
		SetLightShadows(editor.scene.selection, GetCheckBoxState(editor.gui.properties.edit.light.shadowsCb))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.lsEnabledCb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.edit.light.lsEnabledCb) then
			SetLightShaft(editor.scene.selection,
				tonumber(GetTextFieldText(editor.gui.properties.edit.light.sizeTxf)),
				tonumber(GetTextFieldText(editor.gui.properties.edit.light.intensityTxf)),
				tonumber(GetTextFieldText(editor.gui.properties.edit.light.fadeOffTxf)))
		else
			DisableLightShaft(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.sizeTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.sizeTxf, 0.0, nil)
		local enabled = IsLightShaft(editor.scene.selection)
		SetLightShaft(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.sizeTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.intensityTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.fadeOffTxf)))
		if enabled == false then DisableLightShaft(editor.scene.selection) end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.intensityTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.intensityTxf, 0.0, nil)
		local enabled = IsLightShaft(editor.scene.selection)
		SetLightShaft(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.sizeTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.intensityTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.fadeOffTxf)))
		if enabled == false then DisableLightShaft(editor.scene.selection) end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.fadeOffTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.light.fadeOffTxf, 0.0, nil)
		local enabled = IsLightShaft(editor.scene.selection)
		SetLightShaft(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.sizeTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.intensityTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.fadeOffTxf)))
		if enabled == false then DisableLightShaft(editor.scene.selection) end
	end
end

function ediPropertiesEditEntityOpenDiffuseMap(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialDiffuseMap(editor.scene.material, tex)
		ediUpdateEditSelectionMaterial()
		ediOpenProperties()
	end
end

function ediPropertiesEditEntityOpenNormalMap(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialNormalMap(editor.scene.material, tex)
		GenerateEntityTangents(editor.scene.selection)
		ediUpdateEditSelectionMaterial()
		ediOpenProperties()
	end
end

function ediPropertiesEditEntityOpenHeightMap(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialHeightMap(editor.scene.material, tex)
		GenerateEntityTangents(editor.scene.selection)
		ediUpdateEditSelectionMaterial()
		ediOpenProperties()
	end
end

function ediPropertiesEditEntityOpenSpecMap(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialSpecularMap(editor.scene.material, tex)
		ediUpdateEditSelectionMaterial()
		ediOpenProperties()
	end
end

function ediPropertiesEditEntityOpenLightMap(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialLightMap(editor.scene.material, tex)
		ediUpdateEditSelectionMaterial()
		ediOpenProperties()
	end
end

function ediUpdateEntity()
	if GetGuiObjectEvent(editor.gui.properties.edit.entity.modelTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.modelTxf)
		if string.len(name) > 0 then
			local mdl = GetEntityModel(editor.scene.selection)
			if mdl ~= nil then
				SetModelName(mdl, name)
			else
				local models = GetSceneModels(editor.scene.handle)
				local mdl = BeginList(models)
				while mdl ~= nil do
					if GetModelName(mdl) == name then
						SetEntityModel(editor.scene.selection, mdl)

						RemoveTextListItems(editor.gui.properties.edit.entity.materialsTxl)
						for i=0, GetEntityMaterialCount(editor.scene.selection)-1 do
							local mat = GetEntityMaterial(editor.scene.selection, i)
							AddTextListItem(editor.gui.properties.edit.entity.materialsTxl, GetMaterialName(mat))
						end

						if GetEntityMaterialCount(editor.scene.selection) > 0 then
							SetTextListSelection(editor.gui.properties.edit.entity.materialsTxl, 0)
							editor.scene.material = GetEntityMaterial(editor.scene.selection, 0)
						else
							SetTextListSelection(editor.gui.properties.edit.entity.materialsTxl, -1)
						end

						ediUpdateEditSelectionMaterial()

						break
					end
					mdl = NextInList(models)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.modelTxf, "") end
			end
		else
			ClearEntityModel(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.scaleXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.scaleXTxf, nil, nil)
		SetEntityScale(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.scaleYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.scaleYTxf, nil, nil)
		SetEntityScale(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.scaleZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.scaleZTxf, nil, nil)
		SetEntityScale(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scaleZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.materialsTxl) == SELECTION_CHANGED then
		ediUpdateEditSelectionMaterial()
	end

	local diff = GetTextListItemCount(editor.gui.properties.edit.entity.materialsTxl)-
		GetTextListRowCount(editor.gui.properties.edit.entity.materialsTxl)

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.materialsSb) == VALUE_CHANGED then
		if diff > 0 then
			SetTextListOffset(editor.gui.properties.edit.entity.materialsTxl,
				diff*(1.0-GetSliderValue(editor.gui.properties.edit.entity.materialsSb)))
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.addMaterialBut) == CLICKED then
		local newMat = CreateMaterial("Material")
		AddEntityMaterial(editor.scene.selection, newMat)
		AddTextListItem(editor.gui.properties.edit.entity.materialsTxl, "Material")
	end

	local index = GetTextListSelectionIndex(editor.gui.properties.edit.entity.materialsTxl)

	if index < 0 then return end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.replaceMaterialBut) == CLICKED then
		local newMat = CreateMaterial("Material")
		SetEntityMaterial(editor.scene.selection, index, newMat)
		SetTextListItem(editor.gui.properties.edit.entity.materialsTxl, index, "Material")
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.removeMaterialBut) == CLICKED then
		RemoveEntityMaterial(editor.scene.selection, index)

		RemoveTextListItems(editor.gui.properties.edit.entity.materialsTxl)
		for i=0, GetEntityMaterialCount(editor.scene.selection)-1 do
			local mat = GetEntityMaterial(editor.scene.selection, i)
			AddTextListItem(editor.gui.properties.edit.entity.materialsTxl, GetMaterialName(mat))
		end

		if GetEntityMaterialCount(editor.scene.selection) > 0 then
			SetTextListSelection(editor.gui.properties.edit.entity.materialsTxl, 0)
			editor.scene.material = GetEntityMaterial(editor.scene.selection, 0)
		else
			SetTextListSelection(editor.gui.properties.edit.entity.materialsTxl, -1)
		end

		ediUpdateEditSelectionMaterial()
	end

	local mat = GetEntityMaterial(editor.scene.selection, index)
	if mat == nil then return end

	editor.scene.material = mat

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matNameTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.matNameTxf)
		if string.len(name) < 1 then
			SetTextFieldText(editor.gui.properties.edit.entity.matNameTxf, GetMaterialName(mat))
		else
			SetMaterialName(mat, name)
			SetTextListItem(editor.gui.properties.edit.entity.materialsTxl, index, name)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matDiffuseRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matDiffuseRTxf, 0.0, nil)
		SetMaterialDiffuseColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matDiffuseGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matDiffuseGTxf, 0.0, nil)
		SetMaterialDiffuseColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matDiffuseBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matDiffuseBTxf, 0.0, nil)
		SetMaterialDiffuseColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matDiffuseATxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matDiffuseATxf, 0.0, nil)
		SetMaterialDiffuseColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matSpecularRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matSpecularRTxf, 0.0, nil)
		SetMaterialSpecularColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matSpecularGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matSpecularGTxf, 0.0, nil)
		SetMaterialSpecularColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matSpecularBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matSpecularBTxf, 0.0, nil)
		SetMaterialSpecularColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecularBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matAmbientRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matAmbientRTxf, 0.0, nil)
		SetMaterialAmbientColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matAmbientGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matAmbientGTxf, 0.0, nil)
		SetMaterialAmbientColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matAmbientBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matAmbientBTxf, 0.0, nil)
		SetMaterialAmbientColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAmbientBTxf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matSpecPowerTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matSpecPowerTxf, 0.0, nil)
		SetMaterialSpecularPower(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matSpecPowerTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matLightingCb) == STATE_CHANGED then
		SetMaterialLighting(mat, GetCheckBoxState(editor.gui.properties.edit.entity.matLightingCb))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matPrlxScaleTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matPrlxScaleTxf, 0.0, nil)
		SetMaterialParallaxScale(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matPrlxScaleTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matAlphaTestCb) == STATE_CHANGED then
		SetMaterialAlphaTest(mat, GetCheckBoxState(editor.gui.properties.edit.entity.matAlphaTestCb))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matAlphaThrsTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.entity.matAlphaThrsTxf, 0.0, 1.0)
		SetMaterialAlphaThreshold(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.matAlphaThrsTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matDiffuseMapTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.matDiffuseMapTxf)
		if string.len(name) > 0 then
			local tex = GetMaterialDiffuseMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialDiffuseMap(mat, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.matDiffuseMapTxf, "") end
			end
		else
			ClearMaterialDiffuseMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matNormalMapTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.matNormalMapTxf)
		if string.len(name) > 0 then
			local tex = GetMaterialNormalMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialNormalMap(mat, tex)
						GenerateEntityTangents(editor.scene.selection)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.matNormalMapTxf, "") end
			end
		else
			ClearMaterialNormalMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matHeightMapTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.matHeightMapTxf)
		if string.len(name) > 0 then
			local tex = GetMaterialHeightMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialHeightMap(mat, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.matHeightMapTxf, "") end
			end
		else
			ClearMaterialHeightMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matSpecMapTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.matSpecMapTxf)
		if string.len(name) > 0 then
			local tex = GetMaterialSpecularMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialSpecularMap(mat, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.matSpecMapTxf, "") end
			end
		else
			ClearMaterialSpecularMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matLightMapTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.matLightMapTxf)
		if string.len(name) > 0 then
			local tex = GetMaterialLightMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialLightMap(mat, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.matLightMapTxf, "") end
			end
		else
			ClearMaterialLightMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matDiffuseMapOpen) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Open Diffuse Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, ediPropertiesEditEntityOpenDiffuseMap)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matNormalMapOpen) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Open Normal Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, ediPropertiesEditEntityOpenNormalMap)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matHeightMapOpen) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Open Height Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, ediPropertiesEditEntityOpenHeightMap)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matSpecMapOpen) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Open Specular Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, ediPropertiesEditEntityOpenSpecMap)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.matLightMapOpen) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Open Light Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, ediPropertiesEditEntityOpenLightMap)
	end
end

function ediPropertiesEditParticlesOpenTexture(path)
	if string.len(path) < 1 then
		ediOpenProperties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetParticlesTexture(editor.scene.selection, tex)
		ediUpdateEditSelection()
		ediOpenProperties()
	end
end

function ediUpdateParticles()
	if GetGuiObjectEvent(editor.gui.properties.edit.particles.maxCountTxf) == LOSE_FOCUS then
		ediCheckTextFieldInt(editor.gui.properties.edit.particles.maxCountTxf, 0, nil)
		SetParticlesMaxCount(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.maxCountTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.textureOpen) == CLICKED then
		ediOpenFileDialog(GetCurrentDirectory(), "Open Particles Texture...", EDI_FILE_DIALOG_OPEN, ediPropertiesEditParticlesOpenTexture)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.textureTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.particles.textureTxf)
		if string.len(name) > 0 then
			local tex = GetParticlesTexture(editor.scene.selection)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				local tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetParticlesTexture(editor.scene.selection, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.particles.textureTxf, "") end
			end
		else
			ClearParticlesTexture(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.trsCb) == CLICKED then
		SetParticlesDrawMode(editor.scene.selection, TRANSPARENT)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.addCb) == CLICKED then
		SetParticlesDrawMode(editor.scene.selection, ADD)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.modelTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.particles.modelTxf)
		if string.len(name) > 0 then
			local mdl = GetParticlesModel(editor.scene.selection)
			if mdl ~= nil  then
				SetModelName(mdl, name)
			else
				local models = GetSceneModels(editor.scene.handle)
				local mdl = BeginList(models)
				while mdl ~= nil do
					if GetModelName(mdl) == name then
						SetTextFieldText(editor.gui.properties.edit.particles.entityTxf, "")
						SetParticlesModel(editor.scene.selection, mdl)
						break
					end
					mdl = NextInList(models)
				end
				if mdl == nil then SetTextFieldText(editor.gui.properties.edit.particles.modelTxf, "") end
			end
		else
			ClearParticlesModel(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.entityTxf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.particles.entityTxf)
		if string.len(name) > 0 then
			local ent = GetParticlesEntity(editor.scene.selection)
			if ent ~= nil then
				SetActorName(ent, name)
			else
				local ent = nil
				for i=0, GetSceneEntityCount(editor.scene.handle)-1 do
					ent = GetSceneEntityByIndex(editor.scene.handle, i)
					if GetActorName(ent) == name then
						SetTextFieldText(editor.gui.properties.edit.particles.modelTxf, "")
						SetParticlesEntity(editor.scene.selection, ent)
						break
					end
				end
				if ent == nil then SetTextFieldText(editor.gui.properties.edit.particles.entityTxf, "") end
			end
		else
			ClearParticlesEntity(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.gravityXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.gravityXTxf, nil, nil)
		SetParticlesGravity(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.gravityYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.gravityZTxf, nil, nil)
		SetParticlesGravity(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.gravityZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.gravityZTxf, nil, nil)
		SetParticlesGravity(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravityZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.spawnDelayTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.spawnDelayTxf, 0.00001, nil)
		SetParticlesSpawnDelay(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.spawnDelayTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.spawnCb) == STATE_CHANGED then
		SetParticlesSpawn(editor.scene.selection,
			GetCheckBoxState(editor.gui.properties.edit.particles.spawnCb))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.sizeMinTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.sizeMinTxf, 0.0, nil)
		SetParticlesSize(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.sizeMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.sizeMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.sizeMaxTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.sizeMaxTxf, 0.0, nil)
		SetParticlesSize(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.sizeMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.sizeMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.sizeGrowMinTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.sizeGrowMinTxf, nil, nil)
		SetParticlesSizeGrowth(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.sizeGrowMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.sizeGrowMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.sizeGrowMaxTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.sizeGrowMaxTxf, nil, nil)
		SetParticlesSizeGrowth(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.sizeGrowMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.sizeGrowMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.rotationMinTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.rotationMinTxf, 0.0, nil)
		SetParticlesRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotationMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotationMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.rotationMaxTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.rotationMaxTxf, 0.0, nil)
		SetParticlesRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotationMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotationMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.rotGrowMinTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.rotGrowMinTxf, nil, nil)
		SetParticlesRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotGrowMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotGrowMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.rotGrowMaxTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.rotGrowMaxTxf, nil, nil)
		SetParticlesRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotGrowMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotGrowMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.lifeSpanMinTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.lifeSpanMinTxf, 0.0, nil)
		SetParticlesLifeSpan(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.lifeSpanMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.lifeSpanMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.lifeSpanMaxTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.lifeSpanMaxTxf, 0.0, nil)
		SetParticlesLifeSpan(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.lifeSpanMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.lifeSpanMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.fadeSpeedMinTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.fadeSpeedMinTxf, 0.0, nil)
		SetParticlesFadeSpeed(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.fadeSpeedMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.fadeSpeedMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.fadeSpeedMaxTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.fadeSpeedMaxTxf, 0.0, nil)
		SetParticlesFadeSpeed(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.fadeSpeedMinTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.fadeSpeedMaxTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.posMinXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.posMinXTxf, nil, nil)
		SetParticlesPositionMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.posMinYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.posMinYTxf, nil, nil)
		SetParticlesPositionMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.posMinZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.posMinZTxf, nil, nil)
		SetParticlesPositionMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMinZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.posMaxXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.posMaxXTxf, nil, nil)
		SetParticlesPositionMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.posMaxYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.posMaxYTxf, nil, nil)
		SetParticlesPositionMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.posMaxZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.posMaxZTxf, nil, nil)
		SetParticlesPositionMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.posMaxZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.velMinXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.velMinXTxf, nil, nil)
		SetParticlesVelocityMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.velMinYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.velMinYTxf, nil, nil)
		SetParticlesVelocityMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.velMinZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.velMinZTxf, nil, nil)
		SetParticlesVelocityMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMinZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.velMaxXTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.velMaxXTxf, nil, nil)
		SetParticlesVelocityMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.velMaxYTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.velMaxYTxf, nil, nil)
		SetParticlesVelocityMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.velMaxZTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.velMaxZTxf, nil, nil)
		SetParticlesVelocityMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxXTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxYTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.velMaxZTxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.colorMinRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.colorMinRTxf, 0.0, nil)
		SetParticlesColorMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.colorMinGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.colorMinGTxf, 0.0, nil)
		SetParticlesColorMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.colorMinBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.colorMinBTxf, 0.0, nil)
		SetParticlesColorMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.colorMinATxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.colorMinATxf, 0.0, nil)
		SetParticlesColorMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMinATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.colorMaxRTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.colorMaxRTxf, 0.0, nil)
		SetParticlesColorMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.colorMaxGTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.colorMaxGTxf, 0.0, nil)
		SetParticlesColorMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.colorMaxBTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.colorMaxBTxf, 0.0, nil)
		SetParticlesColorMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxATxf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.colorMaxATxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.edit.particles.colorMaxATxf, 0.0, nil)
		SetParticlesColorMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxRTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxGTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxBTxf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.colorMaxATxf)))
	end
end

function ediUpdateSprite()
end

function ediUpdateEdit()
	if editor.scene.selection == nil then return end

	if GetGuiObjectEvent(editor.gui.properties.edit.actCb) == CLICKED then
		ediSwitchEditTab(EDI_EDIT_ACTOR)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.camCb) == CLICKED then
		ediSwitchEditTab(EDI_EDIT_CAMERA)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.ligCb) == CLICKED then
		ediSwitchEditTab(EDI_EDIT_LIGHT)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.entCb) == CLICKED then
		ediSwitchEditTab(EDI_EDIT_ENTITY)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.parCb) == CLICKED then
		ediSwitchEditTab(EDI_EDIT_PARTICLES)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.sprCb) == CLICKED then
		ediSwitchEditTab(EDI_EDIT_SPRITE)
	end

	if editor.gui.properties.edit.currentTab == EDI_EDIT_ACTOR then ediUpdateActor()
	elseif editor.gui.properties.edit.currentTab == EDI_EDIT_CAMERA then ediUpdateCamera()
	elseif editor.gui.properties.edit.currentTab == EDI_EDIT_LIGHT then ediUpdateLight()
	elseif editor.gui.properties.edit.currentTab == EDI_EDIT_ENTITY then ediUpdateEntity()
	elseif editor.gui.properties.edit.currentTab == EDI_EDIT_PARTICLES then ediUpdateParticles()
	elseif editor.gui.properties.edit.currentTab == EDI_EDIT_SPRITE then ediUpdateSprite() end
end

function ediUpdatePp()
	if GetGuiObjectEvent(editor.gui.properties.pp.bloomCb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.bloomCb) == true then
			SetBloom(GetSliderValue(editor.gui.properties.pp.bloomStrSli))
		else
			DisableBloom()
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.bloomStrSli) == VALUE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.bloomCb) == true then
			SetBloom(GetSliderValue(editor.gui.properties.pp.bloomStrSli))
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.dofEnbCb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.dofEnbCb) == true then
			SetDof(tonumber(GetTextFieldText(editor.gui.properties.pp.dofFocRngTxf)),
				tonumber(GetTextFieldText(editor.gui.properties.pp.dofFocDstTxf)))
		else
			DisableDof()
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.dofFocRngTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.pp.dofFocRngTxf, 0, nil)
		if GetCheckBoxState(editor.gui.properties.pp.dofEnbCb) == true then
			SetDof(tonumber(GetTextFieldText(editor.gui.properties.pp.dofFocRngTxf)),
				tonumber(GetTextFieldText(editor.gui.properties.pp.dofFocDstTxf)))
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.dofFocDstTxf) == LOSE_FOCUS then
		ediCheckTextFieldFloat(editor.gui.properties.pp.dofFocDstTxf, 0, nil)
		if GetCheckBoxState(editor.gui.properties.pp.dofEnbCb) == true then
			SetDof(tonumber(GetTextFieldText(editor.gui.properties.pp.dofFocRngTxf)),
				tonumber(GetTextFieldText(editor.gui.properties.pp.dofFocDstTxf)))
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.lshEnbCb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.lshEnbCb) == true then
			SetLightShafts(GetSliderValue(editor.gui.properties.pp.lshStrSli))
		else
			DisableLightShafts()
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.lshStrSli) == VALUE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.lshEnbCb) == true then
			SetLightShafts(GetSliderValue(editor.gui.properties.pp.lshStrSli))
		end
	end
end

function ediUpdateProperties()
	if GetGuiObjectEvent(editor.gui.properties.menuCb) == CLICKED then
		ediSwitchPropertiesTab(EDI_PROPERTIES_MENU)
	end

	if GetGuiObjectEvent(editor.gui.properties.editCb) == CLICKED then
		ediSwitchPropertiesTab(EDI_PROPERTIES_EDIT)
	end

	if GetGuiObjectEvent(editor.gui.properties.ppCb) == CLICKED then
		ediSwitchPropertiesTab(EDI_PROPERTIES_PP)
	end

	if editor.gui.properties.currentTab == EDI_PROPERTIES_MENU then ediUpdateMenu()
	elseif editor.gui.properties.currentTab == EDI_PROPERTIES_EDIT then ediUpdateEdit()
	elseif editor.gui.properties.currentTab == EDI_PROPERTIES_PP then ediUpdatePp() end
end

