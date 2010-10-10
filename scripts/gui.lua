
function edi_create_label(parent, name, x, y, text, font)
	local label = CreateLabel(parent, name, x, y, text)

	SetLabelText(label, text)
	SetGuiObjectPosition(label, x, y)

	AddGuiObject(parent, label)

	return label
end

function edi_create_button(parent, name, x, y, path)
	local button = CreateButton(parent, name, x, y, 100, 18, "Default")

	SetButtonOffTexture(button, CreateTextureFromFile(path .. "_off.png"))
	SetButtonOverTexture(button, CreateTextureFromFile(path .. "_over.png"))
	SetButtonOnTexture(button, CreateTextureFromFile(path .. "_on.png"))
	SetGuiObjectPosition(button, x, y)

	AddGuiObject(parent, button)

	return button
end

function edi_create_check_box(parent, name, x, y, path, default)
	local check_box = CreateCheckBox(parent, name, x, y)

	SetCheckBoxOffTexture(check_box, CreateTextureFromFile(path .. "_off.png"))
	SetCheckBoxOnTexture(check_box, CreateTextureFromFile(path .. "_on.png"))
	SetCheckBoxState(check_box, default)
	SetGuiObjectPosition(check_box, x, y)

	AddGuiObject(parent, check_box)

	return check_box
end

function edi_create_text_field(parent, name, x, y, path, font, default)
	local text_field = CreateTextField(parent, name, x, y, 100, default)

	SetTextFieldTexture(text_field, CreateTextureFromFile(path .. ".png"))
	SetTextFieldOffset(text_field, 3, 2)
	SetTextFieldText(text_field, default)
	SetGuiObjectPosition(text_field, x, y)

	AddGuiObject(parent, text_field)

	return text_field
end

function edi_create_slider(parent, name, x, y, path, default)
	local slider = CreateSlider(parent, name, x, y, 0, 10, 1.0)

	SetSliderBackgroundTexture(slider, CreateTextureFromFile(path .. "_bg.png"))
	SetSliderSliderTexture(slider, CreateTextureFromFile(path .. "_slider.png"))
	SetGuiObjectPosition(slider, x, y)
	SetSliderValue(slider, default)

	AddGuiObject(parent, slider)

	return slider
end

function edi_check_text_field_float(txf, min, max)
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

function edi_check_text_field_int(txf, min, max)
	local val = GetTextFieldText(txf)

	if val == nil then val = 0 end
	val = tonumber(val)
	if val == nil then
		val = 0
	else
		val = edi_round(val)
		if min ~= nil then min = edi_round(min) end
		if max ~= nil then max = edi_round(max) end
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

function edi_init_gui()
	editor.gui = {}
	editor.gui.current_menu = EDI_NONE
	editor.gui.action = {}
	editor.gui.action.move = false
	editor.gui.action.rotate = false

	-- create the main gui
	editor.gui.handle = CreateGui()
	SetGui(editor.gui.handle)

	dofile("scripts/gui/fonts.lua")
	dofile("scripts/gui/message_box.lua")
	dofile("scripts/gui/file_dialog.lua")
	dofile("scripts/gui/properties.lua")

	-- initialize gui resources and dialogs
	edi_init_fonts()
	edi_init_message_box()
	edi_init_file_dialog()
	edi_init_properties()

	-- add a version label
	editor.gui.version = CreateLabel(editor.gui.handle, "EditorELF_version", 0, 0, "EDitorELF 0.9 Beta 3, FPS: 0")
	SetGuiObjectPosition(editor.gui.version, 5, GetWindowHeight()-GetGuiObjectSize(editor.gui.version).y-2)

	AddGuiObject(editor.gui.handle, editor.gui.version)
end

function edi_disable_current_menu()
	if editor.gui.current_menu == EDI_MESSAGE_BOX then
		SetGuiObjectVisible(editor.gui.file_dialog.box, false)
		ReleaseScreenFocus(editor.gui.message_box.box)
	elseif editor.gui.current_menu == EDI_FILE_DIALOG then
		SetGuiObjectVisible(editor.gui.file_dialog.dialog, false)
		ReleaseScreenFocus(editor.gui.file_dialog.dialog)
	elseif editor.gui.current_menu == EDI_PROPERTIES then
		SetGuiObjectVisible(editor.gui.properties.handle, false)
		ReleaseScreenFocus(editor.gui.properties.handle)
	end

	editor.gui.current_menu = EDI_NONE
end

function edi_update_gui_selection()
	edi_update_properties_selection()
end

function edi_update_gui()
	SetLabelText(editor.gui.version, "EditorELF 0.9 Beta 3, FPS: " .. GetFps())

	if editor.gui.current_menu == EDI_MESSAGE_BOX then edi_update_message_box()
	elseif editor.gui.current_menu == EDI_FILE_DIALOG then edi_update_file_dialog()
	elseif editor.gui.current_menu == EDI_PROPERTIES then edi_update_properties() end
end

