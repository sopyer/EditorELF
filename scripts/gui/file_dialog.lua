
EDI_FILE_DIALOG_OPEN = 0
EDI_FILE_DIALOG_SAVE = 1

function edi_init_file_dialog()
	editor.gui.file_dialog = {}
	editor.gui.file_dialog.prev_wheel = 0

	-- setup the file dialog screen
	editor.gui.file_dialog.dialog = CreateScreen("file_dialog")

	SetScreenTexture(editor.gui.file_dialog.dialog, CreateTextureFromFile("images/file_dialog/background.png"))
	SetGuiObjectVisible(editor.gui.file_dialog.dialog, false)
	SetGuiObjectColor(editor.gui.file_dialog.dialog, 1.0, 1.0, 1.0, 0.75)

	AddGuiObject(editor.gui.handle, editor.gui.file_dialog.dialog)

	-- setup the file dialog title label
	editor.gui.file_dialog.title = CreateLabel("title")

	SetLabelFont(editor.gui.file_dialog.title, editor.gui.fonts.normal)
	SetLabelText(editor.gui.file_dialog.title, "File Dialog")
	SetGuiObjectPosition(editor.gui.file_dialog.title, 4, 1)

	AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.title)

	-- setup the file path field
	editor.gui.file_dialog.file_path = CreateTextField("file_path")

	SetTextFieldTexture(editor.gui.file_dialog.file_path, CreateTextureFromFile("images/file_dialog/file_path.png"))
	SetTextFieldFont(editor.gui.file_dialog.file_path, editor.gui.fonts.normal)
	SetTextFieldOffset(editor.gui.file_dialog.file_path, 3, 2)
	SetTextFieldText(editor.gui.file_dialog.file_path, "/")
	SetGuiObjectPosition(editor.gui.file_dialog.file_path, 4, 22)

	AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.file_path)

	-- setup the open button
	editor.gui.file_dialog.open = CreateButton("open")

	SetButtonOffTexture(editor.gui.file_dialog.open, CreateTextureFromFile("images/file_dialog/open_off.png"))
	SetButtonOverTexture(editor.gui.file_dialog.open, CreateTextureFromFile("images/file_dialog/open_over.png"))
	SetButtonOnTexture(editor.gui.file_dialog.open, CreateTextureFromFile("images/file_dialog/open_on.png"))
	SetGuiObjectPosition(editor.gui.file_dialog.open, 933, 22)

	AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.open)

	-- setup the save button
	editor.gui.file_dialog.save = CreateButton("save")

	SetButtonOffTexture(editor.gui.file_dialog.save, CreateTextureFromFile("images/file_dialog/save_off.png"))
	SetButtonOverTexture(editor.gui.file_dialog.save, CreateTextureFromFile("images/file_dialog/save_over.png"))
	SetButtonOnTexture(editor.gui.file_dialog.save, CreateTextureFromFile("images/file_dialog/save_on.png"))
	SetGuiObjectPosition(editor.gui.file_dialog.save, 933, 22)
	SetGuiObjectVisible(editor.gui.file_dialog.save, false)

	AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.save)

	-- setup the cancel button
	editor.gui.file_dialog.cancel = CreateButton("cancel")

	SetButtonOffTexture(editor.gui.file_dialog.cancel, CreateTextureFromFile("images/file_dialog/cancel_off.png"))
	SetButtonOverTexture(editor.gui.file_dialog.cancel, CreateTextureFromFile("images/file_dialog/cancel_over.png"))
	SetButtonOnTexture(editor.gui.file_dialog.cancel, CreateTextureFromFile("images/file_dialog/cancel_on.png"))
	SetGuiObjectPosition(editor.gui.file_dialog.cancel, 4, 698)

	AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.cancel)

	-- setup the file list
	editor.gui.file_dialog.file_list = CreateTextList("file_list")

	SetTextListFont(editor.gui.file_dialog.file_list, editor.gui.fonts.normal)
	SetTextListSize(editor.gui.file_dialog.file_list, 36, 994)
	SetGuiObjectPosition(editor.gui.file_dialog.file_list, 4, 44)

	AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.file_list)

	-- setup the scroll bar
	editor.gui.file_dialog.scroll_bar = CreateSlider("scroll_bar")

	SetSliderBackgroundTexture(editor.gui.file_dialog.scroll_bar, CreateTextureFromFile("images/file_dialog/scroll_bar.png"))
	SetSliderSliderTexture(editor.gui.file_dialog.scroll_bar, CreateTextureFromFile("images/file_dialog/scroll_bar_slider.png"))
	SetGuiObjectPosition(editor.gui.file_dialog.scroll_bar, 1002, 44)

	AddGuiObject(editor.gui.file_dialog.dialog, editor.gui.file_dialog.scroll_bar)
end

function edi_open_file_dialog(path, title, mode, callback)

	if mode == EDI_FILE_DIALOG_OPEN then
		SetGuiObjectVisible(editor.gui.file_dialog.open, true)
		SetGuiObjectVisible(editor.gui.file_dialog.save, false)
	elseif mode == EDI_FILE_DIALOG_SAVE then
		SetGuiObjectVisible(editor.gui.file_dialog.open, false)
		SetGuiObjectVisible(editor.gui.file_dialog.save, true)
	end

	editor.gui.file_dialog.mode = mode

	-- set the file dialog title
	SetLabelText(editor.gui.file_dialog.title, title)

	-- set the file dialog callback
	editor.gui.file_dialog.callback = callback

	-- try to open the requested directory
	if edi_change_file_dialog_path(path) == false then
		if GetPlatform() == "windows" then path = "c:\\" else path = "/" end
		if edi_change_file_dialog_path(path) == false then
			return false
		end
	end

	edi_disable_current_menu()

	-- set the file dialog as the current menu
	editor.gui.current_menu = EDI_FILE_DIALOG

	-- set the dialog on top and visible and lock the focus to it
	SetScreenToTop(editor.gui.file_dialog.dialog)
	SetGuiObjectVisible(editor.gui.file_dialog.dialog, true)
	ForceFocusToScreen(editor.gui.file_dialog.dialog)

	return true
end

function edi_change_file_dialog_path(path)
	-- check if the path is a directory
	local dir = ReadDirectory(path)

	if dir ~= nil then
		SetTextFieldText(editor.gui.file_dialog.file_path, path)

		editor.gui.file_dialog.current_path = path
		editor.gui.file_dialog.dir = dir

		-- list the contents of the new path to the file list
		RemoveTextListItems(editor.gui.file_dialog.file_list)

		for i=0, GetDirectoryItemCount(editor.gui.file_dialog.dir)-1 do
			item = GetDirectoryItem(editor.gui.file_dialog.dir, i)
			if GetDirectoryItemType(item) == DIR and i > 1 then
				AddTextListItem(editor.gui.file_dialog.file_list,
					" " .. GetDirectoryItemName(item) .. "/")
			else
				AddTextListItem(editor.gui.file_dialog.file_list,
					" " .. GetDirectoryItemName(item))
			end
		end

		SetSliderValue(editor.gui.file_dialog.scroll_bar, 1.0)
		SetTextListSelection(editor.gui.file_dialog.file_list, 0)

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

	if GetPlatform() == "windows" then postfix = "\\" else postfix = "/" end

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
	if GetGuiObjectEvent(editor.gui.file_dialog.file_path) == LOSE_FOCUS then
		if GetKeyState(KEY_ENTER) == PRESSED then
			if editor.gui.file_dialog.mode == EDI_FILE_DIALOG_OPEN then
				path = GetTextFieldText(editor.gui.file_dialog.file_path)

				if edi_change_file_dialog_path(path) == false then
					-- check if the path is a file
					file = io.open(path)

					if file ~= nil then
						if editor.gui.file_dialog.callback ~= nil then
							editor.gui.file_dialog.callback(path)
						end
					end
				end
			elseif editor.gui.file_dialog.mode == EDI_FILE_DIALOG_SAVE then
				path = GetTextFieldText(editor.gui.file_dialog.file_path)

				-- check if the path can be opened
				file = io.open(path, "r")
				if file == nil then
					file = io.open(path, "w")
				end

				if file ~= nil then
					file:close()
					if editor.gui.file_dialog.callback ~= nil then
						editor.gui.file_dialog.callback(path)
					end
				end
			end
		end
	end

	-- check if we have to open a file
	if GetGuiObjectEvent(editor.gui.file_dialog.open) == CLICKED then
		path = GetTextFieldText(editor.gui.file_dialog.file_path)

		-- check if the path is a file
		file = io.open(path, "r")

		if file ~= nil then
			if editor.gui.file_dialog.callback ~= nil then
				editor.gui.file_dialog.callback(path)
			end
		end
	end

	-- check if we have to open a file
	if GetGuiObjectEvent(editor.gui.file_dialog.save) == CLICKED then
		path = GetTextFieldText(editor.gui.file_dialog.file_path)

		-- check if the path can be opened
		file = io.open(path, "r")
		if file == nil then
			file = io.open(path, "w")
		end

		if file ~= nil then
			file:close()
			if editor.gui.file_dialog.callback ~= nil then
				editor.gui.file_dialog.callback(path)
			end
		end
	end

	-- check if we have to cancel the file dialog
	if GetGuiObjectEvent(editor.gui.file_dialog.cancel) == CLICKED then
		if editor.gui.file_dialog.callback ~= nil then
			editor.gui.file_dialog.callback("")
		end
	end

	-- see if we have to enter a new folder or just update the file path
	if GetGuiObjectEvent(editor.gui.file_dialog.file_list) == SELECTION_CHANGED then
		item = GetDirectoryItem(editor.gui.file_dialog.dir, GetTextListSelectionIndex(editor.gui.file_dialog.file_list))
		if item ~= nil then
			if GetDirectoryItemType(item) == DIR then
				if GetDirectoryItemName(item) == "." then
				elseif GetDirectoryItemName(item) == ".." then
					edi_change_file_dialog_path(edi_get_parent_folder(editor.gui.file_dialog.current_path))
				else
					path = edi_make_folder_path(editor.gui.file_dialog.current_path) .. string.sub(GetDirectoryItemName(item), 1)
					edi_change_file_dialog_path(path)
				end
			else
				path = edi_make_folder_path(editor.gui.file_dialog.current_path) .. string.sub(GetDirectoryItemName(item), 1)
				SetTextFieldText(editor.gui.file_dialog.file_path, path)
			end
		end
	end

	-- check if we have to scroll
	local diff = GetTextListItemCount(editor.gui.file_dialog.file_list)-
		GetTextListRowCount(editor.gui.file_dialog.file_list)

	if GetGuiObjectEvent(editor.gui.file_dialog.scroll_bar) == VALUE_CHANGED then
		if diff > 0 then
			SetTextListOffset(editor.gui.file_dialog.file_list, diff*(1.0-GetSliderValue(editor.gui.file_dialog.scroll_bar)))
		end
	end

	-- scroll with the mouse wheel
	local wheel_diff = -(GetMouseWheel() - editor.gui.file_dialog.prev_wheel)
	if wheel_diff ~= 0 then
		offset = GetTextListOffset(editor.gui.file_dialog.file_list)+wheel_diff
		if offset < 0 then offset = 0 end
		if offset > diff then offset = diff end
		SetTextListOffset(editor.gui.file_dialog.file_list, offset)

		SetSliderValue(editor.gui.file_dialog.scroll_bar, 1.0-(offset/diff))
	end

	editor.gui.file_dialog.prev_wheel = GetMouseWheel()
end

