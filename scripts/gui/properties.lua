
EDI_PROPERTIES_MENU = 1
EDI_PROPERTIES_EDIT = 2
EDI_PROPERTIES_PP = 3

function edi_init_properties()
	editor.gui.properties = {}

	-- setup the file dialog screen
	editor.gui.properties.handle = elf.CreateScreen("edit_menu")

	elf.SetScreenTexture(editor.gui.properties.handle, elf.CreateTextureFromFile("images/properties/background.png"))
	elf.SetGuiObjectVisible(editor.gui.properties.handle, false)
	elf.SetGuiObjectColor(editor.gui.properties.handle, 1.0, 1.0, 1.0, 0.5)
	elf.SetGuiObjectPosition(editor.gui.properties.handle, elf.GetWindowWidth()-elf.GetGuiObjectSize(editor.gui.properties.handle).x, 0)

	elf.AddGuiObject(editor.gui.handle, editor.gui.properties.handle)

	-- setup the properties tab check boxes
	editor.gui.properties.menu_cb = edi_create_check_box(editor.gui.properties.handle, "menu", 4, 4, "images/properties/menu", true)
	editor.gui.properties.edit_cb = edi_create_check_box(editor.gui.properties.handle, "menu", 55, 4, "images/properties/edit", false)
	editor.gui.properties.pp_cb = edi_create_check_box(editor.gui.properties.handle, "menu", 106, 4, "images/properties/pp", false)

	-- setup the menu tab

	editor.gui.properties.menu = {}

	editor.gui.properties.menu.open = edi_create_button(editor.gui.properties.handle, "open", 4, 26, "images/properties/menu/open")

	-- setup the post processing tab

	editor.gui.properties.pp = {}

	-- setup the bloom settings

	editor.gui.properties.pp.bloom = edi_create_label(editor.gui.properties.handle, "bloom", 4, 27, "----------- Bloom ----------", editor.gui.fonts.normal)
	editor.gui.properties.pp.bloom_enb = edi_create_label(editor.gui.properties.handle, "bloom_enb", 4, 49, "Enabled", editor.gui.fonts.normal)
	editor.gui.properties.pp.bloom_str = edi_create_label(editor.gui.properties.handle, "bloom_thr", 4, 71, "Threshold", editor.gui.fonts.normal)

	editor.gui.properties.pp.bloom_cb = edi_create_check_box(editor.gui.properties.handle, "bloom_cb", 100, 48, "images/check_box", false)

	editor.gui.properties.pp.bloom_str_sli = edi_create_slider(editor.gui.properties.handle, "bloom_str_sli", 100, 70, "images/slider128", 0.5)

	-- setup the DOF settings

	editor.gui.properties.pp.dof = edi_create_label(editor.gui.properties.handle, "dof", 4, 92, "------------ DOF -----------", editor.gui.fonts.normal)
	editor.gui.properties.pp.dof_enb = edi_create_label(editor.gui.properties.handle, "dof_enb", 4, 115, "Enabled", editor.gui.fonts.normal)
	editor.gui.properties.pp.dof_foc_rng = edi_create_label(editor.gui.properties.handle, "dof_foc_rng", 4, 137, "Focal Range", editor.gui.fonts.normal)
	editor.gui.properties.pp.dof_foc_dst = edi_create_label(editor.gui.properties.handle, "dof_foc_dst", 4, 159, "Focal Distance", editor.gui.fonts.normal)

	editor.gui.properties.pp.dof_enb_cb = edi_create_check_box(editor.gui.properties.handle, "dof_enb_cb", 140, 114, "images/check_box", false)

	editor.gui.properties.pp.dof_foc_rng_txf = edi_create_text_field(editor.gui.properties.handle, "dof_foc_rng_txf", 140, 136, "images/text_field64", editor.gui.fonts.normal, "7.5")
	editor.gui.properties.pp.dof_foc_dst_txf = edi_create_text_field(editor.gui.properties.handle, "dof_foc_dst_txf", 140, 158, "images/text_field64", editor.gui.fonts.normal, "15.0")

	-- setup the light shaft settings

	editor.gui.properties.pp.lsh = edi_create_label(editor.gui.properties.handle, "lsh", 4, 180, "------- Light Shafts -------", editor.gui.fonts.normal)
	editor.gui.properties.pp.lsh_enb = edi_create_label(editor.gui.properties.handle, "lsh_enb", 4, 203, "Enabled", editor.gui.fonts.normal)
	editor.gui.properties.pp.lsh_str = edi_create_label(editor.gui.properties.handle, "lsh_str", 4, 225, "Threshold", editor.gui.fonts.normal)

	editor.gui.properties.pp.lsh_enb_cb = edi_create_check_box(editor.gui.properties.handle, "lsh_enb_cb", 100, 202, "images/check_box", false)

	editor.gui.properties.pp.lsh_str_sli = edi_create_slider(editor.gui.properties.handle, "lsh_str_sli", 100, 224, "images/slider128", 1.0)

	-- reset the visibilities
	editor.gui.properties.current_tab = EDI_PROPERTIES_EDIT
	edi_change_properties_tab(EDI_PROPERTIES_MENU)
	editor.gui.properties.current_tab = EDI_PROPERTIES_PP
	edi_change_properties_tab(EDI_PROPERTIES_MENU)
end

function edi_change_properties_tab(tab)
	if editor.gui.properties.current_tab == EDI_PROPERTIES_MENU then

		elf.SetCheckBoxState(editor.gui.properties.menu_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.menu.open, false)

	elseif editor.gui.properties.current_tab == EDI_PROPERTIES_EDIT then

		elf.SetCheckBoxState(editor.gui.properties.edit_cb, false)

	elseif editor.gui.properties.current_tab == EDI_PROPERTIES_PP then

		elf.SetCheckBoxState(editor.gui.properties.pp_cb, false)

		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom_enb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom_str, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom_str_sli, false)

		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_enb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_foc_rng, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_foc_dst, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_enb_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_foc_rng_txf, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_foc_dst_txf, false)

		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh_enb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh_str, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh_enb_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh_str_sli, false)

	end

	if tab == EDI_PROPERTIES_MENU then

		elf.SetGuiObjectVisible(editor.gui.properties.menu.open, true)

	elseif tab == EDI_PROPERTIES_EDIT then
	elseif tab == EDI_PROPERTIES_PP then

		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom_enb, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom_cb, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom_str, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.bloom_str_sli, true)

		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_enb, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_foc_rng, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_foc_dst, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_enb_cb, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_foc_rng_txf, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.dof_foc_dst_txf, true)

		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh_enb, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh_str, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh_enb_cb, true)
		elf.SetGuiObjectVisible(editor.gui.properties.pp.lsh_str_sli, true)

	end

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

function edi_update_edit_menu()
	-- check tab check boxes

	if elf.GetGuiObjectEvent(editor.gui.properties.menu_cb) == elf.STATE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.menu_cb) == true then
			edi_change_properties_tab(EDI_PROPERTIES_MENU)
		else
			elf.SetCheckBoxState(editor.gui.properties.menu_cb, true)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit_cb) == elf.STATE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.edit_cb) == true then
			edi_change_properties_tab(EDI_PROPERTIES_EDIT)
		else
			elf.SetCheckBoxState(editor.gui.properties.edit_cb, true)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp_cb) == elf.STATE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.pp_cb) == true then
			edi_change_properties_tab(EDI_PROPERTIES_PP)
		else
			elf.SetCheckBoxState(editor.gui.properties.pp_cb, true)
		end
	end

	-- check menu tab objects

	if elf.GetGuiObjectEvent(editor.gui.properties.menu.open) == elf.CLICKED then
		edi_open_file_dialog(elf.GetCurrentDirectory(), "Open PAK...", edi_properties_menu_open)
	end

	-- check post processing tab objects

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
		local val = elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf)
		if val == nil then val = "0.0" end
		val = tonumber(val)
		if val == nil then
			val = "0.0"
		else
			if val < 0.0 then val = "0.0" end
		end

		elf.SetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf, val)
		if elf.GetCheckBoxState(editor.gui.properties.pp.dof_enb_cb) == true then
			elf.SetDof(tonumber(elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf)),
				tonumber(elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf)))
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.pp.dof_foc_dst_txf) == elf.LOSE_FOCUS then
		local val = elf.GetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf)
		if val == nil then val = "0.0" end
		val = tonumber(val)
		if val == nil then
			val = "0.0"
		else
			if val < 0.0 then val = "0.0" end
		end

		elf.SetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf, val)
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

