
function edi_init_message_box()
	editor.gui.message_box = {}

	-- setup the message box
	editor.gui.message_box.box = elf.CreateScreen("message_box")

	-- elf.SetScreenTexture(editor.gui.message_box.box, elf.CreateTextureFromFile("image/message_box_bg.png"))
	elf.SetGuiObjectPosition(editor.gui.message_box.box,
		elf.GetWindowWidth()/2-elf.GetGuiObjectSize(editor.gui.message_box.box).x/2,
		elf.GetWindowHeight()/2-elf.GetGuiObjectSize(editor.gui.message_box.box).y/2)
	elf.SetGuiObjectVisible(editor.gui.message_box.box, false)

	elf.AddGuiObject(editor.gui.handle, editor.gui.message_box.box)
end

function edi_open_message_box()
end

function edi_update_message_box()
	return false
end

