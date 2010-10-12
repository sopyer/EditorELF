
function ediCheckTextFieldFloat(txf, min, max)
	local val = GetTextFieldText(txf)

	if val == nil then val = 0 end
	val = tonumber(val)
	if val == nil then
		val = 0
	else
		if min ~= nil and val < min then val = min end
		if max ~= nil and val > max then val = max end
	end

	SetTextFieldText(txf, tostring(val))
	SetTextFieldCursorPosition(txf, 0)
end

function ediCheckTextFieldInt(txf, min, max)
	local val = GetTextFieldText(txf)

	if val == nil then val = 0 end
	val = tonumber(val)
	if val == nil then
		val = 0
	else
		val = ediRound(val)
		if min ~= nil then min = ediRound(min) end
		if max ~= nil then max = ediRound(max) end
		if min ~= nil and val < min then val = min end
		if max ~= nil and val > max then val = max end
	end

	SetTextFieldText(txf, tostring(val))
	SetTextFieldCursorPosition(txf, 0)
end

EDI_NONE = 0
EDI_MESSAGE_BOX = 1
EDI_FILE_DIALOG = 2
EDI_PROPERTIES = 3

function ediInitGui()
	editor.gui = {}
	editor.gui.currentMenu = EDI_NONE
	editor.gui.action = {}
	editor.gui.action.move = false
	editor.gui.action.rotate = false

	-- create the main gui
	editor.gui.handle = CreateGui()
	SetGui(editor.gui.handle)

	dofile("scripts/messagebox.lua")
	dofile("scripts/filedialog.lua")
	dofile("scripts/properties.lua")

	-- initialize gui resources and dialogs
	ediInitMessageBox()
	ediInitFileDialog()
	ediInitProperties()

	-- add a version label
	editor.gui.version = CreateLabel(editor.gui.handle, "EditorELF_version", 0, 0, "EDitorELF 0.9 Beta 3, FPS: 0")
	SetGuiObjectPosition(editor.gui.version, 5, GetWindowHeight()-GetGuiObjectSize(editor.gui.version).y-2)
	SetGuiObjectColor(editor.gui.version, 1.0, 1.0, 1.0, 0.6)
end

function ediDisableCurrentMenu()
	if editor.gui.currentMenu == EDI_MESSAGE_BOX then
		SetGuiObjectVisible(editor.gui.fileDialog.box, false)
		ReleaseScreenFocus(editor.gui.messageBox.box)
	elseif editor.gui.currentMenu == EDI_FILE_DIALOG then
		SetGuiObjectVisible(editor.gui.fileDialog.dialog, false)
		ReleaseScreenFocus(editor.gui.fileDialog.dialog)
	elseif editor.gui.currentMenu == EDI_PROPERTIES then
		SetGuiObjectVisible(editor.gui.properties.handle, false)
		ReleaseScreenFocus(editor.gui.properties.handle)
	end

	editor.gui.currentMenu = EDI_NONE
end

function ediUpdateGuiSelection()
	ediUpdatePropertiesSelection()
end

function ediUpdateGui()
	SetLabelText(editor.gui.version, "EditorELF 0.9 Beta 3, FPS: " .. GetFps())

	if editor.gui.currentMenu == EDI_MESSAGE_BOX then ediUpdateMessageBox()
	elseif editor.gui.currentMenu == EDI_FILE_DIALOG then ediUpdateFileDialog()
	elseif editor.gui.currentMenu == EDI_PROPERTIES then ediUpdateProperties() end
end

