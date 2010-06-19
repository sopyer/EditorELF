
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

