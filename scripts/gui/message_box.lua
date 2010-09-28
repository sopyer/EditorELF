
function edi_init_message_box()
	editor.gui.message_box = {}

	-- setup the message box
	editor.gui.message_box.box = CreateScreen("message_box")

	-- SetScreenTexture(editor.gui.message_box.box, CreateTextureFromFile("image/message_box_bg.png"))
	SetGuiObjectPosition(editor.gui.message_box.box,
		GetWindowWidth()/2-GetGuiObjectSize(editor.gui.message_box.box).x/2,
		GetWindowHeight()/2-GetGuiObjectSize(editor.gui.message_box.box).y/2)
	SetGuiObjectVisible(editor.gui.message_box.box, false)

	AddGuiObject(editor.gui.handle, editor.gui.message_box.box)
end

function edi_open_message_box()
end

function edi_update_message_box()
	return false
end

