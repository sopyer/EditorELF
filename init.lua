
function edi_init()
	editor = {}
	editor.scene = {}

	elf.SetTitle("EditorELF 0.9 Beta 2")

	dofile("scripts/gui.lua")
	dofile("scripts/scene.lua")

	edi_init_gui()
	edi_init_scene()
end

function edi_run()
	edi_open_properties()

	while elf.Run() == true do
		if elf.GetKeyState(elf.KEY_ESC) == elf.PRESSED then elf.Quit() end

		-- save a screenshot on F5
		if elf.GetKeyState(elf.KEY_F5) == elf.PRESSED then
			if elf.SaveScreenShot("screenshot.png") == true then
				print("screen shot saved to " .. elf.GetCurrentDirectory() .. "/screenshot.png")
			end
		end

		-- hide debug draw and menu when space is pressed (for screen shots ;)
		elf.SetDebugDraw(true)
		elf.SetGuiObjectVisible(editor.gui.handle, true)
		if elf.GetKeyState(elf.KEY_SPACE) ~= elf.UP then
			elf.SetDebugDraw(false)
			elf.SetGuiObjectVisible(editor.gui.handle, false)
		end

		edi_update_gui()
		edi_update_scene()
	end
end

function edi_deinit()
	editor = nil
end

-- initialize and run EditorELF

edi_init()
edi_run()
edi_deinit()

