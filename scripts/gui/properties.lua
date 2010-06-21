
EDI_PROPERTIES_MENU = 1
EDI_PROPERTIES_EDIT = 2
EDI_PROPERTIES_PP = 3

EDI_EDIT_ACTOR = 1
EDI_EDIT_LIGHT = 2

function edi_init_properties()
	editor.gui.properties = {}

	-- setup the file dialog screen
	editor.gui.properties.handle = elf.CreateScreen("edit_menu")

	elf.SetScreenTexture(editor.gui.properties.handle, elf.CreateTextureFromFile("images/properties/background.png"))
	elf.SetGuiObjectVisible(editor.gui.properties.handle, false)
	elf.SetGuiObjectColor(editor.gui.properties.handle, 1.0, 1.0, 1.0, 0.75)
	elf.SetGuiObjectPosition(editor.gui.properties.handle, elf.GetWindowWidth()-elf.GetGuiObjectSize(editor.gui.properties.handle).x, 0)

	elf.AddGuiObject(editor.gui.handle, editor.gui.properties.handle)

	-- setup the properties tab check boxes
	editor.gui.properties.menu_cb = edi_create_check_box(editor.gui.properties.handle, "menu_cb", 4, 4, "images/properties/menu", true)
	editor.gui.properties.edit_cb = edi_create_check_box(editor.gui.properties.handle, "edit_cb", 55, 4, "images/properties/edit", false)
	editor.gui.properties.pp_cb = edi_create_check_box(editor.gui.properties.handle, "pp_cb", 106, 4, "images/properties/pp", false)

	-- setup the menu tab

	editor.gui.properties.menu = {}

	editor.gui.properties.menu.file = edi_create_label(editor.gui.properties.handle, "file", 4, 27, "----------- File -----------", editor.gui.fonts.normal)
	editor.gui.properties.menu.open = edi_create_button(editor.gui.properties.handle, "open", 4, 48, "images/properties/menu/open")

	-- setup the edit tab

	editor.gui.properties.edit = {}

	-- setup the edit tab check boxes
	editor.gui.properties.edit.act_cb = edi_create_check_box(editor.gui.properties.handle, "act_cb", 4, 26, "images/properties/edit/act", true)

	-- setup the actor properties

	editor.gui.properties.edit.actor = {}

	editor.gui.properties.edit.actor.name_lab = edi_create_label(editor.gui.properties.handle, "name_lab", 4, 49, "Name", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.pos_lab = edi_create_label(editor.gui.properties.handle, "pos_lab", 4, 71, "Position", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.rot_lab = edi_create_label(editor.gui.properties.handle, "rot_lab", 4, 93, "Rotation", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.script_lab = edi_create_label(editor.gui.properties.handle, "script_lab", 4, 115, "Script", editor.gui.fonts.normal)

	editor.gui.properties.edit.actor.name_txf = edi_create_text_field(editor.gui.properties.handle, "name_txf", 99, 48, "images/text_field128", editor.gui.fonts.normal, "Object")

	editor.gui.properties.edit.actor.pos_x_txf = edi_create_text_field(editor.gui.properties.handle, "pos_x_txf", 99, 70, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.pos_y_txf = edi_create_text_field(editor.gui.properties.handle, "pos_y_txf", 151, 70, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.pos_z_txf = edi_create_text_field(editor.gui.properties.handle, "pos_z_txf", 203, 70, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.rot_x_txf = edi_create_text_field(editor.gui.properties.handle, "rot_x_txf", 99, 92, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.rot_y_txf = edi_create_text_field(editor.gui.properties.handle, "rot_y_txf", 151, 92, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.rot_z_txf = edi_create_text_field(editor.gui.properties.handle, "rot_z_txf", 203, 92, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.script_txf = edi_create_text_field(editor.gui.properties.handle, "script_txf", 99, 114, "images/text_field128", editor.gui.fonts.normal, "")

	-- setup the post processing tab

	editor.gui.properties.pp = {}

	-- setup the bloom settings

	editor.gui.properties.pp.bloom = edi_create_label(editor.gui.properties.handle, "bloom", 4, 27, "----------- Bloom ----------", editor.gui.fonts.normal)
	editor.gui.properties.pp.bloom_enb = edi_create_label(editor.gui.properties.handle, "bloom_enb", 4, 49, "Enabled", editor.gui.fonts.normal)
	editor.gui.properties.pp.bloom_str = edi_create_label(editor.gui.properties.handle, "bloom_thr", 4, 71, "Threshold", editor.gui.fonts.normal)

	editor.gui.properties.pp.bloom_cb = edi_create_check_box(editor.gui.properties.handle, "bloom_cb", 100, 48, "images/check_box", false)

	editor.gui.properties.pp.bloom_str_sli = edi_create_slider(editor.gui.properties.handle, "bloom_str_sli", 100, 70, "images/slider128", 0.5)

	-- setup the DOF settings

	editor.gui.properties.pp.dof = edi_create_label(editor.gui.properties.handle, "dof", 4, 93, "------------ DOF -----------", editor.gui.fonts.normal)
	editor.gui.properties.pp.dof_enb = edi_create_label(editor.gui.properties.handle, "dof_enb", 4, 115, "Enabled", editor.gui.fonts.normal)
	editor.gui.properties.pp.dof_foc_rng = edi_create_label(editor.gui.properties.handle, "dof_foc_rng", 4, 137, "Focal Range", editor.gui.fonts.normal)
	editor.gui.properties.pp.dof_foc_dst = edi_create_label(editor.gui.properties.handle, "dof_foc_dst", 4, 159, "Focal Distance", editor.gui.fonts.normal)

	editor.gui.properties.pp.dof_enb_cb = edi_create_check_box(editor.gui.properties.handle, "dof_enb_cb", 140, 114, "images/check_box", false)

	editor.gui.properties.pp.dof_foc_rng_txf = edi_create_text_field(editor.gui.properties.handle, "dof_foc_rng_txf", 140, 136, "images/text_field64", editor.gui.fonts.normal, "7.5")
	editor.gui.properties.pp.dof_foc_dst_txf = edi_create_text_field(editor.gui.properties.handle, "dof_foc_dst_txf", 140, 158, "images/text_field64", editor.gui.fonts.normal, "15")

	-- setup the light shaft settings

	editor.gui.properties.pp.lsh = edi_create_label(editor.gui.properties.handle, "lsh", 4, 180, "------- Light Shafts -------", editor.gui.fonts.normal)
	editor.gui.properties.pp.lsh_enb = edi_create_label(editor.gui.properties.handle, "lsh_enb", 4, 203, "Enabled", editor.gui.fonts.normal)
	editor.gui.properties.pp.lsh_str = edi_create_label(editor.gui.properties.handle, "lsh_str", 4, 225, "Strength", editor.gui.fonts.normal)

	editor.gui.properties.pp.lsh_enb_cb = edi_create_check_box(editor.gui.properties.handle, "lsh_enb_cb", 100, 202, "images/check_box", false)

	editor.gui.properties.pp.lsh_str_sli = edi_create_slider(editor.gui.properties.handle, "lsh_str_sli", 100, 224, "images/slider128", 1.0)

	-- hide other tabs and show

	edi_switch_edit_tab(EDI_EDIT_ACTOR)
	edi_hide_properties_tab(EDI_PROPERTIES_EDIT)

	edi_hide_properties_tab(EDI_PROPERTIES_PP)
	edi_switch_properties_tab(EDI_PROPERTIES_MENU)
end

function edi_hide_edit_tab(tab)
	if tab == EDI_EDIT_ACTOR then
		elf.SetCheckBoxState(editor.gui.properties.edit.act_cb, false)
		for k, v in pairs(editor.gui.properties.edit.actor) do elf.SetGuiObjectVisible(v, false) end
	end
end

function edi_show_edit_tab(tab)
	elf.SetCheckBoxState(editor.gui.properties.edit.act_cb, false)

	if tab == EDI_EDIT_ACTOR then
		elf.SetCheckBoxState(editor.gui.properties.edit.act_cb, true)
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.actor) do elf.SetGuiObjectVisible(v, true) end
		end
	end
end

function edi_switch_edit_tab(tab)
	edi_hide_edit_tab(editor.gui.properties.edit.current_tab)
	edi_show_edit_tab(tab)

	editor.gui.properties.edit.current_tab = tab
end

function edi_hide_properties_tab(tab)
	if tab == EDI_PROPERTIES_MENU then
		elf.SetCheckBoxState(editor.gui.properties.menu_cb, false)
		for k, v in pairs(editor.gui.properties.menu) do elf.SetGuiObjectVisible(v, false) end
	elseif tab == EDI_PROPERTIES_EDIT then
		elf.SetCheckBoxState(editor.gui.properties.edit_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.edit.act_cb, false)
		edi_hide_edit_tab(editor.gui.properties.edit.current_tab)
	elseif tab == EDI_PROPERTIES_PP then
		elf.SetCheckBoxState(editor.gui.properties.pp_cb, false)
		for k, v in pairs(editor.gui.properties.pp) do elf.SetGuiObjectVisible(v, false) end
	end
end

function edi_show_properties_tab(tab)
	elf.SetCheckBoxState(editor.gui.properties.menu_cb, false)
	elf.SetCheckBoxState(editor.gui.properties.edit_cb, false)
	elf.SetCheckBoxState(editor.gui.properties.pp_cb, false)

	if tab == EDI_PROPERTIES_MENU then
		elf.SetCheckBoxState(editor.gui.properties.menu_cb, true)
		for k, v in pairs(editor.gui.properties.menu) do elf.SetGuiObjectVisible(v, true) end
	elseif tab == EDI_PROPERTIES_EDIT then
		elf.SetCheckBoxState(editor.gui.properties.edit_cb, true)
		elf.SetGuiObjectVisible(editor.gui.properties.edit.act_cb, true)
		edi_show_edit_tab(editor.gui.properties.edit.current_tab)
	elseif tab == EDI_PROPERTIES_PP then
		elf.SetCheckBoxState(editor.gui.properties.pp_cb, true)
		for k, v in pairs(editor.gui.properties.pp) do elf.SetGuiObjectVisible(v, true) end
	end
end

function edi_switch_properties_tab(tab)
	edi_hide_properties_tab(editor.gui.properties.current_tab)
	edi_show_properties_tab(tab)

	editor.gui.properties.current_tab = tab
end

function edi_open_properties()
	edi_disable_current_menu()

	editor.gui.current_menu = EDI_PROPERTIES

	elf.SetGuiObjectVisible(editor.gui.properties.handle, true)
end

function edi_properties_menu_open(path)
	if string.len(path) < 1 then
		edi_open_properties()
	end

	if edi_load_scene(path) == true then
		edi_open_properties()
	end
end

function edi_update_edit_selection()
	if editor.scene.selection == nil then
		if editor.gui.properties.curren_tab == EDI_PROPERTIES_EDIT then
			edi_hide_edit_tab(editor.gui.properties.edit.current_tab)
		end
		return
	end

	if editor.gui.properties.current_tab == EDI_PROPERTIES_EDIT then
		edi_show_edit_tab(editor.gui.properties.edit.current_tab)
	end

	elf.SetTextFieldText(editor.gui.properties.edit.actor.name_txf, elf.GetActorName(editor.scene.selection))
	local pos = elf.GetActorPosition(editor.scene.selection)
	elf.SetTextFieldText(editor.gui.properties.edit.actor.pos_x_txf, tostring(pos.x))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.pos_y_txf, tostring(pos.y))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.pos_z_txf, tostring(pos.z))
	local rot = elf.GetActorRotation(editor.scene.selection)
	elf.SetTextFieldText(editor.gui.properties.edit.actor.rot_x_txf, tostring(rot.x))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.rot_y_txf, tostring(rot.y))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.rot_z_txf, tostring(rot.z))
	local scr = elf.GetActorScript(editor.scene.selection)
	if elf.IsObject(scr) == true then
		elf.SetTextFieldText(edtior.properties.edit.actor.script_txf, elf.GetScriptName(scsr))
	end

	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.name_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_z_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_z_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.script_txf, 0)
end

function edi_update_properties_selection()
	edi_update_edit_selection()
end

function edi_update_menu()
	if elf.GetGuiObjectEvent(editor.gui.properties.menu.open) == elf.CLICKED then
		edi_open_file_dialog(elf.GetCurrentDirectory(), "Open PAK...", edi_properties_menu_open)
	end
end

function edi_update_edit()
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.act_cb) == elf.STATE_CHANGED then
		edi_switch_edit_tab(EDI_EDIT_ACTOR)
	end
end

function edi_update_pp()
	if elf.GetGuiObjectEvent(editor.gui.properties.pp.bloom_cb) == elf.STATE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.pp.bloom_cb) == true then
			elf.SetBloom(elf.GetSliderValue(editor.gui.properties.pp.bloom_str_sli))
		else
			elf.DisableBloom()
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp.bloom_str_sli) == elf.VALUE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.pp.bloom_cb) == true then
			elf.SetBloom(elf.GetSliderValue(editor.gui.properties.pp.bloom_str_sli))
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp.dof_enb_cb) == elf.STATE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.pp.dof_enb_cb) == true then
			elf.SetDof(tonumber(elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf)),
				tonumber(elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf)))
		else
			elf.DisableDof()
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp.dof_foc_rng_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.pp.dof_foc_rng_txf, 0, nil)
		if elf.GetCheckBoxState(editor.gui.properties.pp.dof_enb_cb) == true then
			elf.SetDof(tonumber(elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf)),
				tonumber(elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf)))
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp.dof_foc_dst_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.pp.dof_foc_dst_txf, 0, nil)
		if elf.GetCheckBoxState(editor.gui.properties.pp.dof_enb_cb) == true then
			elf.SetDof(tonumber(elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf)),
				tonumber(elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf)))
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp.lsh_enb_cb) == elf.STATE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.pp.lsh_enb_cb) == true then
			elf.SetLightShafts(elf.GetSliderValue(editor.gui.properties.pp.lsh_str_sli))
		else
			elf.DisableLightShafts()
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp.lsh_str_sli) == elf.VALUE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.pp.lsh_enb_cb) == true then
			elf.SetLightShafts(elf.GetSliderValue(editor.gui.properties.pp.lsh_str_sli))
		end
	end
end

function edi_update_properties()
	-- check tab check boxes

	if elf.GetGuiObjectEvent(editor.gui.properties.menu_cb) == elf.STATE_CHANGED then
		edi_switch_properties_tab(EDI_PROPERTIES_MENU)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit_cb) == elf.STATE_CHANGED then
		edi_switch_properties_tab(EDI_PROPERTIES_EDIT)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp_cb) == elf.STATE_CHANGED then
		edi_switch_properties_tab(EDI_PROPERTIES_PP)
	end

	if editor.gui.properties.current_tab == EDI_PROPERTIES_MENU then edi_update_menu()
	elseif editor.gui.properties.current_tab == EDI_PROPERTIES_EDIT then edi_update_edit()
	elseif editor.gui.properties.current_tab == EDI_PROPERTIES_PP then edi_update_pp() end
end

