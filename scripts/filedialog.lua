
EDI_FILE_DIALOG_OPEN = 0
EDI_FILE_DIALOG_SAVE = 1

function ediInitFileDialog()
	editor.gui.fileDialog = {}
	editor.gui.fileDialog.prevWheel = 0

	-- setup the file dialog screen
	editor.gui.fileDialog.dialog = CreateScreen(editor.gui.handle, "fileDialog", 0, 0, GetWindowWidth(), GetWindowHeight())
	SetGuiObjectColor(editor.gui.fileDialog.dialog, 1.0, 1.0, 1.0, 0.75)

	editor.gui.fileDialog.filePath = CreateTextField(editor.gui.fileDialog.dialog, "filePath", 4, 4, GetWindowWidth()-101, "/")
	editor.gui.fileDialog.open = CreateButton(editor.gui.fileDialog.dialog, "open", GetWindowWidth()-91, 4, 87, 18, "Open")
	editor.gui.fileDialog.save = CreateButton(editor.gui.fileDialog.dialog, "save", GetWindowWidth()-91, 4, 87, 18, "Save")
	editor.gui.fileDialog.cancel = CreateButton(editor.gui.fileDialog.dialog, "cancel", 4, GetWindowHeight()-22, 87, 18, "Cancel")
	editor.gui.fileDialog.fileList = CreateTextList(editor.gui.fileDialog.dialog, "fileList", 4, 26, 44, GetWindowWidth()-18)
	editor.gui.fileDialog.scrollBar = CreateSlider(editor.gui.fileDialog.dialog, "scrollBar", GetWindowWidth()-10, 30, 0, GetWindowHeight()-66, 1.0)

	SetGuiObjectVisible(editor.gui.fileDialog.dialog, false)
	SetGuiObjectVisible(editor.gui.fileDialog.save, false)
end

function ediOpenFileDialog(path, title, mode, callback)

	if mode == EDI_FILE_DIALOG_OPEN then
		SetGuiObjectVisible(editor.gui.fileDialog.open, true)
		SetGuiObjectVisible(editor.gui.fileDialog.save, false)
	elseif mode == EDI_FILE_DIALOG_SAVE then
		SetGuiObjectVisible(editor.gui.fileDialog.open, false)
		SetGuiObjectVisible(editor.gui.fileDialog.save, true)
	end

	editor.gui.fileDialog.mode = mode

	-- set the file dialog callback
	editor.gui.fileDialog.callback = callback

	-- try to open the requested directory
	if ediChangeFileDialogPath(path) == false then
		if GetPlatform() == "windows" then path = "c:\\" else path = "/" end
		if ediChangeFileDialogPath(path) == false then
			return false
		end
	end

	ediDisableCurrentMenu()

	-- set the file dialog as the current menu
	editor.gui.currentMenu = EDI_FILE_DIALOG

	-- set the dialog on top and visible and lock the focus to it
	SetScreenToTop(editor.gui.fileDialog.dialog)
	SetGuiObjectVisible(editor.gui.fileDialog.dialog, true)
	ForceScreenFocus(editor.gui.fileDialog.dialog)

	return true
end

function ediChangeFileDialogPath(path)
	-- check if the path is a directory
	local dir = ReadDirectory(path)

	if dir ~= nil then
		SetTextFieldText(editor.gui.fileDialog.filePath, path)

		editor.gui.fileDialog.currentPath = path
		editor.gui.fileDialog.dir = dir

		-- list the contents of the new path to the file list
		RemoveTextListItems(editor.gui.fileDialog.fileList)

		for i=0, GetDirectoryItemCount(editor.gui.fileDialog.dir)-1 do
			item = GetDirectoryItem(editor.gui.fileDialog.dir, i)
			if GetDirectoryItemType(item) == DIR and i > 1 then
				AddTextListItem(editor.gui.fileDialog.fileList,
					" " .. GetDirectoryItemName(item) .. "/")
			else
				AddTextListItem(editor.gui.fileDialog.fileList,
					" " .. GetDirectoryItemName(item))
			end
		end

		SetSliderValue(editor.gui.fileDialog.scrollBar, 1.0)
		SetTextListSelection(editor.gui.fileDialog.fileList, 0)

		return true
	end

	return false
end

function ediGetParentFolder(path)
	if string.len(path) < 2 then return path end

	local rpath = string.reverse(path)

	if string.sub(rpath, 1, 1) == "\\" then rpath = string.sub(rpath, 2) end
	if string.sub(rpath, 1, 1) == "/" then rpath = string.sub(rpath, 2) end

	local idx = string.find(rpath, "\\")
	if idx == nil then idx = string.find(rpath, "/") end
	if idx == nil then return string.reverse(rpath) end

	return string.reverse(rpath.sub(rpath, idx))
end

function ediMakeFolderPath(path)
	local postfix = nil

	if string.len(path) < 2 then return path end

	local rpath = string.reverse(path)

	if string.sub(rpath, 1, 1) == "\\" then return string.reverse(rpath) end
	if string.sub(rpath, 1, 1) == "/" then return string.reverse(rpath) end

	if GetPlatform() == "windows" then postfix = "\\" else postfix = "/" end

	return string.reverse(rpath) .. postfix
end

function ediUpdateFileDialog()
	local path = nil
	local item = nil
	local dir = nil
	local diff = nil
	local wheelDiff = nil
	local offset = nil
	local file = nil

	-- check if we have to try to open a new file or enter a directory
	if GetGuiObjectEvent(editor.gui.fileDialog.filePath) == LOSE_FOCUS then
		if GetKeyState(KEY_ENTER) == PRESSED then
			if editor.gui.fileDialog.mode == EDI_FILE_DIALOG_OPEN then
				path = GetTextFieldText(editor.gui.fileDialog.filePath)

				if ediChangeFileDialogPath(path) == false then
					-- check if the path is a file
					file = io.open(path)

					if file ~= nil then
						if editor.gui.fileDialog.callback ~= nil then
							editor.gui.fileDialog.callback(path)
						end
					end
				end
			elseif editor.gui.fileDialog.mode == EDI_FILE_DIALOG_SAVE then
				path = GetTextFieldText(editor.gui.fileDialog.filePath)

				-- check if the path can be opened
				file = io.open(path, "r")
				if file == nil then
					file = io.open(path, "w")
				end

				if file ~= nil then
					file:close()
					if editor.gui.fileDialog.callback ~= nil then
						editor.gui.fileDialog.callback(path)
					end
				end
			end
		end
	end

	-- check if we have to open a file
	if GetGuiObjectEvent(editor.gui.fileDialog.open) == CLICKED then
		path = GetTextFieldText(editor.gui.fileDialog.filePath)

		-- check if the path is a file
		file = io.open(path, "r")

		if file ~= nil then
			if editor.gui.fileDialog.callback ~= nil then
				editor.gui.fileDialog.callback(path)
			end
		end
	end

	-- check if we have to open a file
	if GetGuiObjectEvent(editor.gui.fileDialog.save) == CLICKED then
		path = GetTextFieldText(editor.gui.fileDialog.filePath)

		-- check if the path can be opened
		file = io.open(path, "r")
		if file == nil then
			file = io.open(path, "w")
		end

		if file ~= nil then
			file:close()
			if editor.gui.fileDialog.callback ~= nil then
				editor.gui.fileDialog.callback(path)
			end
		end
	end

	-- check if we have to cancel the file dialog
	if GetGuiObjectEvent(editor.gui.fileDialog.cancel) == CLICKED then
		if editor.gui.fileDialog.callback ~= nil then
			editor.gui.fileDialog.callback("")
		end
	end

	-- see if we have to enter a new folder or just update the file path
	if GetGuiObjectEvent(editor.gui.fileDialog.fileList) == SELECTION_CHANGED then
		item = GetDirectoryItem(editor.gui.fileDialog.dir, GetTextListSelectionIndex(editor.gui.fileDialog.fileList))
		if item ~= nil then
			if GetDirectoryItemType(item) == DIR then
				if GetDirectoryItemName(item) == "." then
				elseif GetDirectoryItemName(item) == ".." then
					ediChangeFileDialogPath(ediGetParentFolder(editor.gui.fileDialog.currentPath))
				else
					path = ediMakeFolderPath(editor.gui.fileDialog.currentPath) .. string.sub(GetDirectoryItemName(item), 1)
					ediChangeFileDialogPath(path)
				end
			else
				path = ediMakeFolderPath(editor.gui.fileDialog.currentPath) .. string.sub(GetDirectoryItemName(item), 1)
				SetTextFieldText(editor.gui.fileDialog.filePath, path)
			end
		end
	end

	-- check if we have to scroll
	local diff = GetTextListItemCount(editor.gui.fileDialog.fileList)-
		GetTextListRowCount(editor.gui.fileDialog.fileList)

	if GetGuiObjectEvent(editor.gui.fileDialog.scrollBar) == VALUE_CHANGED then
		if diff > 0 then
			SetTextListOffset(editor.gui.fileDialog.fileList, diff*(1.0-GetSliderValue(editor.gui.fileDialog.scrollBar)))
		end
	end

	-- scroll with the mouse wheel
	local wheelDiff = -(GetMouseWheel() - editor.gui.fileDialog.prevWheel)
	if wheelDiff ~= 0 then
		offset = GetTextListOffset(editor.gui.fileDialog.fileList)+wheelDiff
		if offset < 0 then offset = 0 end
		if offset > diff then offset = diff end
		SetTextListOffset(editor.gui.fileDialog.fileList, offset)

		SetSliderValue(editor.gui.fileDialog.scrollBar, 1.0-(offset/diff))
	end

	editor.gui.fileDialog.prevWheel = GetMouseWheel()
end

