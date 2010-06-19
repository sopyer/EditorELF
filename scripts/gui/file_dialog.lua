
function edi_init_file_dialog()
	editor.gui.file_dialog = {}
	editor.gui.file_dialog.prev_wheel = 0

	-- setup the file dialog screen
	editor.gui.file_dialog.dialog = elf.CreateScreen("file_dialog")

	elf.SetScreenTexture(editor.gui.file_dialog.dialog, elf.CreateTextureFromFile("images/file_dialog/background.png"))
	elf.SetGuiObjectVisible(editor.gui.file_dialog.dialog, false)
	elf.SetGuiObjectColor(editor.gui.file_dialog.dialog, 1.0, 1.0, 1.0, 0.75)

	elf.AddGuiObject(editor.gui.handle, editor.gui.file_dialog.dialog)

	-- setup the file dialog title label
	editor.gui.file_dialog.title = elf.CreateLabel("title")

	elf.SetLabelFont(editor.gui.file_dialog.title, editor.gui.fonts.normal)
	elf.SetLabelText(editor.gui.file_dialog.title, "File Dialog")
	elf.SetGuiObjectPosition(editor.gui.file_dialog.title, 4, 1)

	elf.AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.title)

	-- setup the file path field
	editor.gui.file_dialog.file_path = elf.CreateTextField("file_path")

	elf.SetTextFieldTexture(editor.gui.file_dialog.file_path, elf.CreateTextureFromFile("images/file_dialog/file_path.png"))
	elf.SetTextFieldFont(editor.gui.file_dialog.file_path, editor.gui.fonts.normal)
	elf.SetTextFieldOffset(editor.gui.file_dialog.file_path, 3, 2)
	elf.SetTextFieldText(editor.gui.file_dialog.file_path, "/")
	elf.SetGuiObjectPosition(editor.gui.file_dialog.file_path, 4, 22)

	elf.AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.file_path)

	-- setup the open button
	editor.gui.file_dialog.open = elf.CreateButton("open")

	elf.SetButtonOffTexture(editor.gui.file_dialog.open, elf.CreateTextureFromFile("images/file_dialog/open_off.png"))
	elf.SetButtonOverTexture(editor.gui.file_dialog.open, elf.CreateTextureFromFile("images/file_dialog/open_over.png"))
	elf.SetButtonOnTexture(editor.gui.file_dialog.open, elf.CreateTextureFromFile("images/file_dialog/open_on.png"))
	elf.SetGuiObjectPosition(editor.gui.file_dialog.open, 933, 22)

	elf.AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.open)

	-- setup the cancel button
	editor.gui.file_dialog.cancel = elf.CreateButton("cancel")

	elf.SetButtonOffTexture(editor.gui.file_dialog.cancel, elf.CreateTextureFromFile("images/file_dialog/cancel_off.png"))
	elf.SetButtonOverTexture(editor.gui.file_dialog.cancel, elf.CreateTextureFromFile("images/file_dialog/cancel_over.png"))
	elf.SetButtonOnTexture(editor.gui.file_dialog.cancel, elf.CreateTextureFromFile("images/file_dialog/cancel_on.png"))
	elf.SetGuiObjectPosition(editor.gui.file_dialog.cancel, 4, 698)

	elf.AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.cancel)

	-- setup the file list
	editor.gui.file_dialog.file_list = elf.CreateTextList("file_list")

	elf.SetTextListFont(editor.gui.file_dialog.file_list, editor.gui.fonts.normal)
	elf.SetTextListSize(editor.gui.file_dialog.file_list, 36, 994)
	elf.SetGuiObjectPosition(editor.gui.file_dialog.file_list, 4, 44)

	elf.AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.file_list)

	-- setup the scroll bar
	editor.gui.file_dialog.scroll_bar = elf.CreateSlider("scroll_bar")

	elf.SetSliderBackgroundTexture(editor.gui.file_dialog.scroll_bar, elf.CreateTextureFromFile("images/file_dialog/scroll_bar.png"))
	elf.SetSliderSliderTexture(editor.gui.file_dialog.scroll_bar, elf.CreateTextureFromFile("images/file_dialog/scroll_bar_slider.png"))
	elf.SetGuiObjectPosition(editor.gui.file_dialog.scroll_bar, 1002, 44)

	elf.AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.scroll_bar)
end

function edi_open_file_dialog(path, title, callback)

	-- set the file dialog title
	elf.SetLabelText(editor.gui.file_dialog.title, title)

	-- set the file dialog callback
	editor.gui.file_dialog.callback = callback

	-- try to open the requested directory
	if edi_change_file_dialog_path(path) == false then
		if elf.GetPlatform() == "windows" then path = "c:\\" else path = "/" end
		if edi_change_file_dialog_path(path) == false then
			return false
		end
	end

	edi_disable_current_menu()

	-- set the file dialog as the current menu
	editor.gui.current_menu = EDI_FILE_DIALOG

	-- set the dialog on top and visible and lock the focus to it
	elf.SetScreenToTop(editor.gui.file_dialog.dialog)
	elf.SetGuiObjectVisible(editor.gui.file_dialog.dialog, true)
	elf.ForceFocusToScreen(editor.gui.file_dialog.dialog)

	return true
end

function edi_change_file_dialog_path(path)
	-- check if the path is a directory
	local dir = elf.ReadDirectory(path)

	if elf.IsObject(dir) == true then
		elf.SetTextFieldText(editor.gui.file_dialog.file_path, path)

		editor.gui.file_dialog.current_path = path
		editor.gui.file_dialog.dir = dir

		-- list the contents of the new path to the file list
		elf.RemoveTextListItems(editor.gui.file_dialog.file_list)

		for i=0, elf.GetDirectoryItemCount(editor.gui.file_dialog.dir)-1 do
			item = elf.GetDirectoryItem(editor.gui.file_dialog.dir, i)
			if elf.GetDirectoryItemType(item) == elf.DIR and i > 1 then
				elf.AddTextListItem(editor.gui.file_dialog.file_list,
					" " .. elf.GetDirectoryItemName(item) .. "/")
			else
				elf.AddTextListItem(editor.gui.file_dialog.file_list,
					" " .. elf.GetDirectoryItemName(item))
			end
		end

		elf.SetSliderValue(editor.gui.file_dialog.scroll_bar, 1.0)
		elf.SetTextListSelection(editor.gui.file_dialog.file_list, 0)

		return true
	end

	return false
end

function edi_get_parent_folder(path)
	if string.len(path) < 2 then return path end

	local rpath = string.reverse(path)

	if string.sub(rpath, 1, 1) == "\\" then rpath = string.sub(rpath, 2) end
	if string.sub(rpath, 1, 1) == "/" then rpath = string.sub(rpath, 2) end

	local idx = string.find(rpath, "\\")
	if idx == nil then idx = string.find(rpath, "/") end
	if idx == nil then return string.reverse(rpath) end

	return string.reverse(rpath.sub(rpath, idx))
end

function edi_make_folder_path(path)
	local postfix = nil

	if string.len(path) < 2 then return path end

	local rpath = string.reverse(path)

	if string.sub(rpath, 1, 1) == "\\" then return string.reverse(rpath) end
	if string.sub(rpath, 1, 1) == "/" then return string.reverse(rpath) end

	if elf.GetPlatform() == "windows" then postfix = "\\" else postfix = "/" end

	return string.reverse(rpath) .. postfix
end

function edi_update_file_dialog()
	local path = nil
	local item = nil
	local dir = nil
	local diff = nil
	local wheel_diff = nil
	local offset = nil
	local file = nil

	-- check if we have to try to open a new file or enter a directory
	if elf.GetGuiObjectEvent(editor.gui.file_dialog.file_path) == elf.LOSE_FOCUS then
		if elf.GetKeyState(elf.KEY_ENTER) == elf.PRESSED then
			path = elf.GetTextFieldText(editor.gui.file_dialog.file_path)

			if edi_change_file_dialog_path(path) == false then
				-- check if the path is a file
				file = io.open(path)

				if file ~= nil then
					if editor.gui.file_dialog.callback ~= nil then
						editor.gui.file_dialog.callback(path)
					end
				end
			end
		end
	end

	-- check if we have to open a file
	if elf.GetGuiObjectEvent(editor.gui.file_dialog.open) == elf.CLICKED then
		path = elf.GetTextFieldText(editor.gui.file_dialog.file_path)

		-- check if the path is a file
		file = io.open(path)

		if file ~= nil then
			if editor.gui.file_dialog.callback ~= nil then
				editor.gui.file_dialog.callback(path)
			end
		end
	end

	-- check if we have to cancel the file dialog
	if elf.GetGuiObjectEvent(editor.gui.file_dialog.cancel) == elf.CLICKED then
		if editor.gui.file_dialog.callback ~= nil then
			editor.gui.file_dialog.callback("")
		end
	end

	-- see if we have to enter a new folder or just update the file path
	if elf.GetGuiObjectEvent(editor.gui.file_dialog.file_list) == elf.SELECTION_CHANGED then
		item = elf.GetDirectoryItem(editor.gui.file_dialog.dir, elf.GetTextListSelectionIndex(editor.gui.file_dialog.file_list))
		if elf.IsObject(item) == true then
			if elf.GetDirectoryItemType(item) == elf.DIR then
				if elf.GetDirectoryItemName(item) == "." then
				elseif elf.GetDirectoryItemName(item) == ".." then
					edi_change_file_dialog_path(edi_get_parent_folder(editor.gui.file_dialog.current_path))
				else
					path = edi_make_folder_path(editor.gui.file_dialog.current_path) .. string.sub(elf.GetDirectoryItemName(item), 1)
					edi_change_file_dialog_path(path)
				end
			else
				path = edi_make_folder_path(editor.gui.file_dialog.current_path) .. string.sub(elf.GetDirectoryItemName(item), 1)
				elf.SetTextFieldText(editor.gui.file_dialog.file_path, path)
			end
		end
	end

	-- check if we have to scroll
	diff = elf.GetTextListItemCount(editor.gui.file_dialog.file_list)-
		elf.GetTextListRowCount(editor.gui.file_dialog.file_list)

	if elf.GetGuiObjectEvent(editor.gui.file_dialog.scroll_bar) == elf.VALUE_CHANGED then
		if diff > 0 then
			elf.SetTextListOffset(editor.gui.file_dialog.file_list, diff*(1.0-elf.GetSliderValue(editor.gui.file_dialog.scroll_bar)))
		end
	end

	-- scroll with the mouse wheel
	wheel_diff = -(elf.GetMouseWheel() - editor.gui.file_dialog.prev_wheel)
	if wheel_diff ~= 0 then
		offset = elf.GetTextListOffset(editor.gui.file_dialog.file_list)+wheel_diff
		if offset < 0 then offset = 0 end
		if offset > diff then offset = diff end
		elf.SetTextListOffset(editor.gui.file_dialog.file_list, offset)

		elf.SetSliderValue(editor.gui.file_dialog.scroll_bar, 1.0-(offset/diff))
	end

	editor.gui.file_dialog.prev_wheel = elf.GetMouseWheel()
end

