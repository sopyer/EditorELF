
function edi_create_label(parent, name, x, y, text, font)
	local label = elf.CreateLabel(name)

	elf.SetLabelFont(label, font)
	elf.SetLabelText(label, text)
	elf.SetGuiObjectPosition(label, x, y)

	elf.AddGuiObject(parent, label)

	return label
end

function edi_create_button(parent, name, x, y, path)
	local button = elf.CreateButton(name)

	elf.SetButtonOffTexture(button, elf.CreateTextureFromFile(path .. "_off.png"))
	elf.SetButtonOverTexture(button, elf.CreateTextureFromFile(path .. "_over.png"))
	elf.SetButtonOnTexture(button, elf.CreateTextureFromFile(path .. "_on.png"))
	elf.SetGuiObjectPosition(button, x, y)

	elf.AddGuiObject(parent, button)

	return button
end

function edi_create_check_box(parent, name, x, y, path, default)
	local check_box = elf.CreateCheckBox(name)

	elf.SetCheckBoxOffTexture(check_box, elf.CreateTextureFromFile(path .. "_off.png"))
	elf.SetCheckBoxOnTexture(check_box, elf.CreateTextureFromFile(path .. "_on.png"))
	elf.SetCheckBoxState(check_box, default)
	elf.SetGuiObjectPosition(check_box, x, y)

	elf.AddGuiObject(parent, check_box)

	return check_box
end

function edi_create_text_field(parent, name, x, y, path, font, default)
	local text_field = elf.CreateTextField(name)

	elf.SetTextFieldTexture(text_field, elf.CreateTextureFromFile(path .. ".png"))
	elf.SetTextFieldOffset(text_field, 3, 2)
	elf.SetTextFieldFont(text_field, font)
	elf.SetTextFieldText(text_field, default)
	elf.SetGuiObjectPosition(text_field, x, y)

	elf.AddGuiObject(parent, text_field)

	return text_field
end

function edi_create_slider(parent, name, x, y, path, default)
	local slider = elf.CreateSlider(name)

	elf.SetSliderBackgroundTexture(slider, elf.CreateTextureFromFile(path .. "_bg.png"))
	elf.SetSliderSliderTexture(slider, elf.CreateTextureFromFile(path .. "_slider.png"))
	elf.SetGuiObjectPosition(slider, x, y)
	elf.SetSliderValue(slider, default)

	elf.AddGuiObject(parent, slider)

	return slider
end

EDI_NONE = 0
EDI_MESSAGE_BOX = 1
EDI_FILE_DIALOG = 2
EDI_PROPERTIES = 3

function edi_init_gui()
	editor.gui = {}
	editor.gui.current_menu = EDI_NONE

	-- create the main gui
	editor.gui.handle = elf.CreateGui()
	elf.SetGui(editor.gui.handle)

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
	editor.gui.version = elf.CreateLabel("EditorELF_version")

	elf.SetLabelFont(editor.gui.version, editor.gui.fonts.normal)
	elf.SetLabelText(editor.gui.version, "EditorELF 0.9 Beta 2")
	elf.SetGuiObjectPosition(editor.gui.version, elf.GetWindowWidth()-elf.GetGuiObjectSize(editor.gui.version).x-5,
		elf.GetWindowHeight()-elf.GetGuiObjectSize(editor.gui.version).y-2)

	elf.AddGuiObject(editor.gui.handle, editor.gui.version)
end

function edi_disable_current_menu()
	if editor.gui.current_menu == EDI_MESSAGE_BOX then
		elf.SetGuiObjectVisible(editor.gui.file_dialog.box, false)
		elf.ReleaseFocusFromScreen(editor.gui.message_box.box)
	elseif editor.gui.current_menu == EDI_FILE_DIALOG then
		elf.SetGuiObjectVisible(editor.gui.file_dialog.dialog, false)
		elf.ReleaseFocusFromScreen(editor.gui.file_dialog.dialog)
	elseif editor.gui.current_menu == EDI_PROPERTIES then
		elf.SetGuiObjectVisible(editor.gui.properties.handle, false)
		elf.ReleaseFocusFromScreen(editor.gui.properties.handle)
	end

	editor.gui.current_menu = EDI_NONE
end

function edi_update_gui()
	if editor.gui.current_menu == EDI_MESSAGE_BOX then edi_update_message_box()
	elseif editor.gui.current_menu == EDI_FILE_DIALOG then edi_update_file_dialog()
	elseif editor.gui.current_menu == EDI_PROPERTIES then edi_update_edit_menu() end
end

