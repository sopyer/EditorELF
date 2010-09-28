
function edi_init()
	editor = {}
	editor.scene = {}

	SetTitle("EditorELF 0.9 Beta 2")

	dofile("scripts/gui.lua")
	dofile("scripts/scene.lua")
	dofile("scripts/util.lua")

	edi_init_gui()
	edi_init_scene()
end

function edi_run()
	edi_open_properties()

	while Run() == true do
		if GetKeyState(KEY_ESC) == PRESSED then Quit() end

		-- save a screenshot on F5
		if GetKeyState(KEY_F5) == PRESSED then
			if SaveScreenShot("screenshot.png") == true then
				print("screen shot saved to " .. GetCurrentDirectory() .. "/screenshot.png")
			end
		end

		-- hide debug draw and menu when space is pressed (for screen shots ;)
		SetDebugDraw(true)
		SetGuiObjectVisible(editor.gui.handle, true)
		if GetKeyState(KEY_SPACE) ~= UP then
			SetDebugDraw(false)
			SetGuiObjectVisible(editor.gui.handle, false)
		end

		edi_update_scene()
		edi_update_gui()
	end
end

function edi_deinit()
	editor = nil
end

-- initialize and run EditorELF

edi_init()
edi_run()
edi_deinit()

