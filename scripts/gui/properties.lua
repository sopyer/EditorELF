
EDI_PROPERTIES_MENU = 1
EDI_PROPERTIES_EDIT = 2
EDI_PROPERTIES_PP = 3

EDI_EDIT_ACTOR = 1
EDI_EDIT_CAMERA = 2
EDI_EDIT_LIGHT = 3
EDI_EDIT_ENTITY = 4
EDI_EDIT_PARTICLES = 5
EDI_EDIT_SPRITE = 6

function edi_init_properties()
	editor.gui.properties = {}

	-- setup the file dialog screen
	editor.gui.properties.handle = elf.CreateScreen("edit_menu")

	elf.SetScreenTexture(editor.gui.properties.handle, elf.CreateTextureFromFile("images/properties/background.png"))
	elf.SetGuiObjectVisible(editor.gui.properties.handle, false)
	elf.SetGuiObjectColor(editor.gui.properties.handle, 1.0, 1.0, 1.0, 0.85)
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
	editor.gui.properties.menu.save = edi_create_button(editor.gui.properties.handle, "save", 4, 70, "images/properties/menu/save")
	editor.gui.properties.menu.import_scene = edi_create_button(editor.gui.properties.handle, "import_scene", 4, 92, "images/properties/menu/import_scene")
	editor.gui.properties.menu.actions = edi_create_label(editor.gui.properties.handle, "actions", 4, 115, "---------- Actions ---------", editor.gui.fonts.normal)
	editor.gui.properties.menu.move = edi_create_check_box(editor.gui.properties.handle, "move", 4, 136, "images/properties/menu/move", false)
	editor.gui.properties.menu.rotate = edi_create_check_box(editor.gui.properties.handle, "rotate", 4, 158, "images/properties/menu/rotate", false)
	editor.gui.properties.menu.create = edi_create_label(editor.gui.properties.handle, "actions", 4, 181, "---------- Create ----------", editor.gui.fonts.normal)
	editor.gui.properties.menu.create_light = edi_create_button(editor.gui.properties.handle, "create_light", 4, 202, "images/properties/menu/create_light")

	-- setup the edit tab

	editor.gui.properties.edit = {}

	-- setup the edit tab check boxes
	editor.gui.properties.edit.act_cb = edi_create_check_box(editor.gui.properties.handle, "act_cb", 4, 26, "images/properties/edit/act", true)
	editor.gui.properties.edit.cam_cb = edi_create_check_box(editor.gui.properties.handle, "cam_cb", 45, 26, "images/properties/edit/cam", false)
	editor.gui.properties.edit.lig_cb = edi_create_check_box(editor.gui.properties.handle, "lig_cb", 45, 26, "images/properties/edit/lig", false)
	editor.gui.properties.edit.ent_cb = edi_create_check_box(editor.gui.properties.handle, "ent_cb", 45, 26, "images/properties/edit/ent", false)
	editor.gui.properties.edit.par_cb = edi_create_check_box(editor.gui.properties.handle, "ent_cb", 45, 26, "images/properties/edit/par", false)
	editor.gui.properties.edit.spr_cb = edi_create_check_box(editor.gui.properties.handle, "ent_cb", 45, 26, "images/properties/edit/spr", false)

	elf.SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)

	-- setup the actor properties

	editor.gui.properties.edit.actor = {}

	editor.gui.properties.edit.actor.name_lab = edi_create_label(editor.gui.properties.handle, "name_lab", 4, 49, "Name", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.pos_lab = edi_create_label(editor.gui.properties.handle, "pos_lab", 4, 71, "Position", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.rot_lab = edi_create_label(editor.gui.properties.handle, "rot_lab", 4, 93, "Rotation", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.script_lab = edi_create_label(editor.gui.properties.handle, "script_lab", 4, 115, "Script", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.physics_lab = edi_create_label(editor.gui.properties.handle, "physics_lab", 4, 137, "---------- Physics ---------", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.physics_enb_lab = edi_create_label(editor.gui.properties.handle, "physics_enb_lab", 4, 159, "Enabled", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.lengths_lab = edi_create_label(editor.gui.properties.handle, "lengths_lab", 4, 181, "Lengths", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.offset_lab = edi_create_label(editor.gui.properties.handle, "offset_lab", 4, 203, "Offset", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.mass_lab = edi_create_label(editor.gui.properties.handle, "mass_lab", 4, 225, "Mass", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.lin_damp_lab = edi_create_label(editor.gui.properties.handle, "lin_damp_lab", 4, 247, "Lin Damp", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.ang_damp_lab = edi_create_label(editor.gui.properties.handle, "ang_damp_lab", 4, 269, "Ang Damp", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.lin_sleep_lab = edi_create_label(editor.gui.properties.handle, "lin_sleep_lab", 4, 291, "Lin Sleep", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.ang_sleep_lab = edi_create_label(editor.gui.properties.handle, "ang_sleep_lab", 4, 313, "Ang Sleep", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.restitu_lab = edi_create_label(editor.gui.properties.handle, "restitu_lab", 4, 335, "Restitu.", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.anis_fric_lab = edi_create_label(editor.gui.properties.handle, "anis_fric_lab", 4, 357, "Anis Fric", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.lin_fac_lab = edi_create_label(editor.gui.properties.handle, "lin_frac_lab", 4, 379, "Lin Factor", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.ang_fac_lab = edi_create_label(editor.gui.properties.handle, "ang_frac_lab", 4, 401, "Ang Factor", editor.gui.fonts.normal)
	editor.gui.properties.edit.actor.shape_lab = edi_create_label(editor.gui.properties.handle, "physics_lab", 4, 425, "Shape", editor.gui.fonts.normal)

	editor.gui.properties.edit.actor.name_txf = edi_create_text_field(editor.gui.properties.handle, "name_txf", 99, 48, "images/text_field128", editor.gui.fonts.normal, "Object")

	editor.gui.properties.edit.actor.pos_x_txf = edi_create_text_field(editor.gui.properties.handle, "pos_x_txf", 99, 70, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.pos_y_txf = edi_create_text_field(editor.gui.properties.handle, "pos_y_txf", 151, 70, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.pos_z_txf = edi_create_text_field(editor.gui.properties.handle, "pos_z_txf", 203, 70, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.rot_x_txf = edi_create_text_field(editor.gui.properties.handle, "rot_x_txf", 99, 92, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.rot_y_txf = edi_create_text_field(editor.gui.properties.handle, "rot_y_txf", 151, 92, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.rot_z_txf = edi_create_text_field(editor.gui.properties.handle, "rot_z_txf", 203, 92, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.script_txf = edi_create_text_field(editor.gui.properties.handle, "script_txf", 99, 114, "images/text_field128", editor.gui.fonts.normal, "")
	editor.gui.properties.edit.actor.script_open = edi_create_button(editor.gui.properties.handle, "script_open", 231, 114, "images/mini_open")

	editor.gui.properties.edit.actor.physics_enb_cb = edi_create_check_box(editor.gui.properties.handle, "physics_enb_cb", 99, 158, "images/check_box", false)

	editor.gui.properties.edit.actor.lengths_x_txf = edi_create_text_field(editor.gui.properties.handle, "lengths_x_txf", 99, 180, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.lengths_y_txf = edi_create_text_field(editor.gui.properties.handle, "lengths_y_txf", 151, 180, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.lengths_z_txf = edi_create_text_field(editor.gui.properties.handle, "lengths_z_txf", 203, 180, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.offset_x_txf = edi_create_text_field(editor.gui.properties.handle, "offset_x_txf", 99, 202, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.offset_y_txf = edi_create_text_field(editor.gui.properties.handle, "offset_y_txf", 151, 202, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.offset_z_txf = edi_create_text_field(editor.gui.properties.handle, "offset_z_txf", 203, 202, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.mass_txf = edi_create_text_field(editor.gui.properties.handle, "mass_txf", 99, 224, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.lin_damp_txf = edi_create_text_field(editor.gui.properties.handle, "lin_damp_txf", 99, 246, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.ang_damp_txf = edi_create_text_field(editor.gui.properties.handle, "ang_damp_txf", 99, 268, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.lin_sleep_txf = edi_create_text_field(editor.gui.properties.handle, "lin_sleep_txf", 99, 290, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.ang_sleep_txf = edi_create_text_field(editor.gui.properties.handle, "ang_sleep_txf", 99, 312, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.restitu_txf = edi_create_text_field(editor.gui.properties.handle, "restitu_txf", 99, 334, "images/text_field64", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.anis_fric_x_txf = edi_create_text_field(editor.gui.properties.handle, "anis_fric_x_txf", 99, 356, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.anis_fric_y_txf = edi_create_text_field(editor.gui.properties.handle, "anis_fric_y_txf", 151, 356, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.anis_fric_z_txf = edi_create_text_field(editor.gui.properties.handle, "anis_fric_z_txf", 203, 356, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.lin_factor_x_txf = edi_create_text_field(editor.gui.properties.handle, "lin_factor_z_txf", 99, 378, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.lin_factor_y_txf = edi_create_text_field(editor.gui.properties.handle, "lin_factor_y_txf", 151, 378, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.lin_factor_z_txf = edi_create_text_field(editor.gui.properties.handle, "lin_factor_z_txf", 203, 378, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.ang_factor_x_txf = edi_create_text_field(editor.gui.properties.handle, "ang_factor_x_txf", 99, 400, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.ang_factor_y_txf = edi_create_text_field(editor.gui.properties.handle, "ang_factor_y_txf", 151, 400, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.actor.ang_factor_z_txf = edi_create_text_field(editor.gui.properties.handle, "ang_factor_z_txf", 203, 400, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.actor.shape = elf.CreateTextList("file_list")
	elf.SetTextListFont(editor.gui.properties.edit.actor.shape, editor.gui.fonts.normal)
	elf.SetTextListSize(editor.gui.properties.edit.actor.shape, 4, 153)
	elf.SetGuiObjectPosition(editor.gui.properties.edit.actor.shape, 77, 424)
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Box")
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Sphere")
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Triangle Mesh")
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule X")
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule Y")
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule Z")
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone X")
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone Y")
	elf.AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone Z")
	elf.AddGuiObject(editor.gui.properties.handle, editor.gui.properties.edit.actor.shape)

	editor.gui.properties.edit.actor.shape_sb = elf.CreateSlider("scroll_bar")
	elf.SetSliderBackgroundTexture(editor.gui.properties.edit.actor.shape_sb, elf.CreateTextureFromFile("images/properties/edit/shape_scroll_bar.png"))
	elf.SetSliderSliderTexture(editor.gui.properties.edit.actor.shape_sb, elf.CreateTextureFromFile("images/properties/edit/shape_scroll_bar_slider.png"))
	elf.SetGuiObjectPosition(editor.gui.properties.edit.actor.shape_sb, 234, 424)
	elf.AddGuiObject(editor.gui.properties.handle, editor.gui.properties.edit.actor.shape_sb)

	-- setup the light properties

	editor.gui.properties.edit.light = {}

	editor.gui.properties.edit.light.type_lab = edi_create_label(editor.gui.properties.handle, "type_lab", 4, 49, "Type", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.color_lab = edi_create_label(editor.gui.properties.handle, "color_lab", 4, 115, "Color", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.distance_lab = edi_create_label(editor.gui.properties.handle, "distance_lab", 4, 137, "Distance", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.fade_speed_lab = edi_create_label(editor.gui.properties.handle, "fade_speed_lab", 4, 159, "Fade Speed", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.spot_cone_lab = edi_create_label(editor.gui.properties.handle, "spot_cone_lab", 4, 181, "Spot Cone", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.shadows_lab = edi_create_label(editor.gui.properties.handle, "shadows_lab", 4, 203, "Shadows", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.light_shafts_lab = edi_create_label(editor.gui.properties.handle, "light_shafts_lab", 4, 225, "----------- Shaft ----------", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.ls_enabled_lab = edi_create_label(editor.gui.properties.handle, "ls_enabled_lab", 4, 247, "Enabled", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.size_lab = edi_create_label(editor.gui.properties.handle, "size_lab", 4, 269, "Size", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.intensity_lab = edi_create_label(editor.gui.properties.handle, "intensity_lab", 4, 291, "Intensity", editor.gui.fonts.normal)
	editor.gui.properties.edit.light.fadeoff_lab = edi_create_label(editor.gui.properties.handle, "fadeoff_lab", 4, 313, "Fadeoff", editor.gui.fonts.normal)

	editor.gui.properties.edit.light.type_txl = elf.CreateTextList("type_list")
	elf.SetTextListFont(editor.gui.properties.edit.light.type_txl, editor.gui.fonts.normal)
	elf.SetTextListSize(editor.gui.properties.edit.light.type_txl, 3, 202)
	elf.SetGuiObjectPosition(editor.gui.properties.edit.light.type_txl, 50, 48)
	elf.AddTextListItem(editor.gui.properties.edit.light.type_txl, " Point")
	elf.AddTextListItem(editor.gui.properties.edit.light.type_txl, " Sun")
	elf.AddTextListItem(editor.gui.properties.edit.light.type_txl, " Spot")
	elf.AddGuiObject(editor.gui.properties.handle, editor.gui.properties.edit.light.type_txl)

	editor.gui.properties.edit.light.color_r_txf = edi_create_text_field(editor.gui.properties.handle, "color_r_txf", 99, 114, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.light.color_g_txf = edi_create_text_field(editor.gui.properties.handle, "color_g_txf", 151, 114, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.light.color_b_txf = edi_create_text_field(editor.gui.properties.handle, "color_b_txf", 203, 114, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.light.distance_txf = edi_create_text_field(editor.gui.properties.handle, "distance_txf", 99, 136, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.light.fade_speed_txf = edi_create_text_field(editor.gui.properties.handle, "fade_speed_txf", 99, 158, "images/text_field64", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.light.inner_cone_txf = edi_create_text_field(editor.gui.properties.handle, "inner_cone_txf", 99, 180, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.light.outer_cone_txf = edi_create_text_field(editor.gui.properties.handle, "outer_cone_txf", 151, 180, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.light.shadows_cb = edi_create_check_box(editor.gui.properties.handle, "shadows_cb", 99, 202, "images/check_box", false)

	editor.gui.properties.edit.light.ls_enabled_cb = edi_create_check_box(editor.gui.properties.handle, "ls_enabled_cb", 99, 246, "images/check_box", false)
	editor.gui.properties.edit.light.size_txf = edi_create_text_field(editor.gui.properties.handle, "size_txf", 99, 268, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.light.intensity_txf = edi_create_text_field(editor.gui.properties.handle, "intensity_txf", 99, 290, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.light.fade_off_txf = edi_create_text_field(editor.gui.properties.handle, "fade_off_txf", 99, 312, "images/text_field64", editor.gui.fonts.normal, "0")

	-- setup the camera properties

	editor.gui.properties.edit.camera = {}

	editor.gui.properties.edit.camera.fov_lab = edi_create_label(editor.gui.properties.handle, "fov_lab", 4, 49, "Fov", editor.gui.fonts.normal)
	editor.gui.properties.edit.camera.clip_lab = edi_create_label(editor.gui.properties.handle, "clip_lab", 4, 71, "Clip", editor.gui.fonts.normal)

	editor.gui.properties.edit.camera.fov_txf = edi_create_text_field(editor.gui.properties.handle, "fov_txf", 99, 48, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.camera.clip_near_txf = edi_create_text_field(editor.gui.properties.handle, "clip_near_txf", 99, 70, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.camera.clip_far_txf = edi_create_text_field(editor.gui.properties.handle, "clip_far_txf", 151, 70, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.camera.copy_but = edi_create_button(editor.gui.properties.handle, "copy_but", 4, 92, "images/properties/edit/copy_specs_to_view")

	-- setup the entity properties

	editor.gui.properties.edit.entity = {}

	editor.gui.properties.edit.entity.model_lab = edi_create_label(editor.gui.properties.handle, "model_lab", 4, 49, "Model", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.scale_lab = edi_create_label(editor.gui.properties.handle, "scale_lab", 4, 71, "Scale", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.materials_lab = edi_create_label(editor.gui.properties.handle, "materials_lab", 4, 93, "--------- Materials --------", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_name_lab = edi_create_label(editor.gui.properties.handle, "mat_name_lab", 4, 261, "Name", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_diffuse_lab = edi_create_label(editor.gui.properties.handle, "mat_diffuse_lab", 4, 283, "Diffuse", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_specular_lab = edi_create_label(editor.gui.properties.handle, "mat_specular_lab", 4, 327, "Specular", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_ambient_lab = edi_create_label(editor.gui.properties.handle, "mat_ambient_lab", 4, 349, "Ambient", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_spec_power_lab = edi_create_label(editor.gui.properties.handle, "mat_spec_power_lab", 4, 371, "Spec Power", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_lighting_lab = edi_create_label(editor.gui.properties.handle, "mat_lighting_lab", 4, 393, "Lighting", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_prlx_scale_lab = edi_create_label(editor.gui.properties.handle, "prlx_scale_lab", 4, 415, "Prlx Scale", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_alpha_test_lab = edi_create_label(editor.gui.properties.handle, "alpha_test_lab", 4, 437, "Alpha Test", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_alpha_thrs_lab = edi_create_label(editor.gui.properties.handle, "alpha_thrs_lab", 4, 459, "Alpha Thrs", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_diffuse_map_lab = edi_create_label(editor.gui.properties.handle, "diffuse_map_lab", 4, 481, "Diffu. Map", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_normal_map_lab = edi_create_label(editor.gui.properties.handle, "normal_map_lab", 4, 503, "Normal Map", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_height_map_lab = edi_create_label(editor.gui.properties.handle, "height_map_lab", 4, 525, "Height Map", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_spec_map_lab = edi_create_label(editor.gui.properties.handle, "spec_map_lab", 4, 547, "Spec Map", editor.gui.fonts.normal)
	editor.gui.properties.edit.entity.mat_light_map_lab = edi_create_label(editor.gui.properties.handle, "light_map_lab", 4, 569, "Light Map", editor.gui.fonts.normal)

	editor.gui.properties.edit.entity.model_txf = edi_create_text_field(editor.gui.properties.handle, "model_txf", 99, 48, "images/text_field128", editor.gui.fonts.normal, "")

	editor.gui.properties.edit.entity.scale_x_txf = edi_create_text_field(editor.gui.properties.handle, "scale_x_txf", 99, 70, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.scale_y_txf = edi_create_text_field(editor.gui.properties.handle, "scale_y_txf", 151, 70, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.scale_z_txf = edi_create_text_field(editor.gui.properties.handle, "scale_z_txf", 203, 70, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.entity.add_material_but = edi_create_button(editor.gui.properties.handle, "add_material_but", 4, 114, "images/properties/edit/add_material")
	editor.gui.properties.edit.entity.replace_material_but = edi_create_button(editor.gui.properties.handle, "replace_material_but", 4, 136, "images/properties/edit/replace_material")
	editor.gui.properties.edit.entity.remove_material_but = edi_create_button(editor.gui.properties.handle, "remove_material_but", 4, 158, "images/properties/edit/remove_material")

	editor.gui.properties.edit.entity.materials_txl = elf.CreateTextList("materials_txl")
	elf.SetTextListFont(editor.gui.properties.edit.entity.materials_txl, editor.gui.fonts.normal)
	elf.SetTextListSize(editor.gui.properties.edit.entity.materials_txl, 4, 226)
	elf.SetGuiObjectPosition(editor.gui.properties.edit.entity.materials_txl, 4, 180)
	elf.AddTextListItem(editor.gui.properties.edit.entity.materials_txl, " Empty 1")
	elf.AddTextListItem(editor.gui.properties.edit.entity.materials_txl, " Empty 2")
	elf.AddTextListItem(editor.gui.properties.edit.entity.materials_txl, " Empty 3")
	elf.AddTextListItem(editor.gui.properties.edit.entity.materials_txl, " Empty 4")
	elf.AddGuiObject(editor.gui.properties.handle, editor.gui.properties.edit.entity.materials_txl)

	editor.gui.properties.edit.entity.materials_sb = elf.CreateSlider("scroll_bar")
	elf.SetSliderBackgroundTexture(editor.gui.properties.edit.entity.materials_sb, elf.CreateTextureFromFile("images/properties/edit/shape_scroll_bar.png"))
	elf.SetSliderSliderTexture(editor.gui.properties.edit.entity.materials_sb, elf.CreateTextureFromFile("images/properties/edit/shape_scroll_bar_slider.png"))
	elf.SetGuiObjectPosition(editor.gui.properties.edit.entity.materials_sb, 230, 180)
	elf.AddGuiObject(editor.gui.properties.handle, editor.gui.properties.edit.entity.materials_sb)

	editor.gui.properties.edit.entity.mat_name_txf = edi_create_text_field(editor.gui.properties.handle, "mat_name_txf", 99, 260, "images/text_field128", editor.gui.fonts.normal, "")

	editor.gui.properties.edit.entity.mat_diffuse_r_txf = edi_create_text_field(editor.gui.properties.handle, "mat_diffuse_r_txf", 4, 304, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.mat_diffuse_g_txf = edi_create_text_field(editor.gui.properties.handle, "mat_diffuse_g_txf", 56, 304, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.mat_diffuse_b_txf = edi_create_text_field(editor.gui.properties.handle, "mat_diffuse_b_txf", 108, 304, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.mat_diffuse_a_txf = edi_create_text_field(editor.gui.properties.handle, "mat_diffuse_a_txf", 160, 304, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.entity.mat_specular_r_txf = edi_create_text_field(editor.gui.properties.handle, "mat_specular_r_txf", 99, 326, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.mat_specular_g_txf = edi_create_text_field(editor.gui.properties.handle, "mat_specular_g_txf", 151, 326, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.mat_specular_b_txf = edi_create_text_field(editor.gui.properties.handle, "mat_specular_b_txf", 203, 326, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.entity.mat_ambient_r_txf = edi_create_text_field(editor.gui.properties.handle, "mat_ambient_r_txf", 99, 348, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.mat_ambient_g_txf = edi_create_text_field(editor.gui.properties.handle, "mat_ambient_g_txf", 151, 348, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.mat_ambient_b_txf = edi_create_text_field(editor.gui.properties.handle, "mat_ambient_b_txf", 203, 348, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.entity.mat_spec_power_txf = edi_create_text_field(editor.gui.properties.handle, "mat_spec_power_txf", 99, 370, "images/text_field64", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.entity.mat_lighting_cb = edi_create_check_box(editor.gui.properties.handle, "mat_lighting_cb", 99, 392, "images/check_box", false)

	editor.gui.properties.edit.entity.mat_prlx_scale_txf = edi_create_text_field(editor.gui.properties.handle, "mat_prlx_scale_txf", 99, 414, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.entity.mat_alpha_test_cb = edi_create_check_box(editor.gui.properties.handle, "mat_alpha_test_cb", 99, 436, "images/check_box", false)
	editor.gui.properties.edit.entity.mat_alpha_thrs_txf = edi_create_text_field(editor.gui.properties.handle, "mat_alpha_thrs_txf", 99, 458, "images/text_field64", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.entity.mat_diffuse_map_txf = edi_create_text_field(editor.gui.properties.handle, "mat_diffuse_map_txf", 99, 480, "images/text_field128", editor.gui.fonts.normal, "")
	editor.gui.properties.edit.entity.mat_normal_map_txf = edi_create_text_field(editor.gui.properties.handle, "mat_normal_map_txf", 99, 502, "images/text_field128", editor.gui.fonts.normal, "")
	editor.gui.properties.edit.entity.mat_height_map_txf = edi_create_text_field(editor.gui.properties.handle, "mat_height_map_txf", 99, 524, "images/text_field128", editor.gui.fonts.normal, "")
	editor.gui.properties.edit.entity.mat_spec_map_txf = edi_create_text_field(editor.gui.properties.handle, "mat_spec_map_txf", 99, 546, "images/text_field128", editor.gui.fonts.normal, "")
	editor.gui.properties.edit.entity.mat_light_map_txf = edi_create_text_field(editor.gui.properties.handle, "mat_light_map_txf", 99, 568, "images/text_field128", editor.gui.fonts.normal, "")

	editor.gui.properties.edit.entity.mat_diffuse_map_open = edi_create_button(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 480, "images/mini_open")
	editor.gui.properties.edit.entity.mat_normal_map_open = edi_create_button(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 502, "images/mini_open")
	editor.gui.properties.edit.entity.mat_height_map_open = edi_create_button(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 524, "images/mini_open")
	editor.gui.properties.edit.entity.mat_spec_map_open = edi_create_button(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 546, "images/mini_open")
	editor.gui.properties.edit.entity.mat_light_map_open = edi_create_button(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 568, "images/mini_open")


	-- setup the particles properties

	editor.gui.properties.edit.particles = {}

	editor.gui.properties.edit.particles.max_count_lab = edi_create_label(editor.gui.properties.handle, "max_count_lab", 4, 49, "Max Count", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.draw_mode_lab = edi_create_label(editor.gui.properties.handle, "draw_mode_lab", 4, 71, "Draw Mode", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.texture_lab = edi_create_label(editor.gui.properties.handle, "texture_lab", 4, 93, "Texture", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.model_lab = edi_create_label(editor.gui.properties.handle, "model_lab", 4, 115, "Model", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.entity_lab = edi_create_label(editor.gui.properties.handle, "entity_lab", 4, 137, "Entity", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.gravity_lab = edi_create_label(editor.gui.properties.handle, "gravity_lab", 4, 159, "Gravity", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.spawn_delay_lab = edi_create_label(editor.gui.properties.handle, "spawn_delay_lab", 4, 181, "Spn Delay", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.spawn_lab = edi_create_label(editor.gui.properties.handle, "spawn_lab", 4, 203, "Spawn", editor.gui.fonts.normal)

	editor.gui.properties.edit.particles.size_lab = edi_create_label(editor.gui.properties.handle, "size_lab", 4, 225, "Size", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.size_grow_lab = edi_create_label(editor.gui.properties.handle, "size_grow_lab", 4, 247, "Size Grow", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.rotation_lab = edi_create_label(editor.gui.properties.handle, "rotation_lab", 4, 269, "Rotation", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.rot_grow_lab = edi_create_label(editor.gui.properties.handle, "rot_grow_lab", 4, 291, "Rot. Grow", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.life_span_lab = edi_create_label(editor.gui.properties.handle, "life_span_lab", 4, 313, "Life Span", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.fade_speed_lab = edi_create_label(editor.gui.properties.handle, "fade_speed_lab", 4, 335, "Fade Speed", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.pos_min_lab = edi_create_label(editor.gui.properties.handle, "pos_min_lab", 4, 357, "Pos. Min", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.pos_max_lab = edi_create_label(editor.gui.properties.handle, "pos_max_lab", 4, 379, "Pos. Max", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.vel_min_lab = edi_create_label(editor.gui.properties.handle, "vel_min_lab", 4, 401, "Vel. Min", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.vel_max_lab = edi_create_label(editor.gui.properties.handle, "vel_max_lab", 4, 423, "Vel. Max", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.color_min_lab = edi_create_label(editor.gui.properties.handle, "color_min_lab", 4, 445, "Color Min", editor.gui.fonts.normal)
	editor.gui.properties.edit.particles.color_max_lab = edi_create_label(editor.gui.properties.handle, "color_max_lab", 4, 489, "Color Max", editor.gui.fonts.normal)

	editor.gui.properties.edit.particles.max_count_txf = edi_create_text_field(editor.gui.properties.handle, "max_count_txf", 99, 48, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.trs_cb = edi_create_check_box(editor.gui.properties.handle, "trs_cb", 99, 70, "images/properties/edit/trs", false)
	editor.gui.properties.edit.particles.add_cb = edi_create_check_box(editor.gui.properties.handle, "add_cb", 140, 70, "images/properties/edit/add", false)
	editor.gui.properties.edit.particles.texture_txf = edi_create_text_field(editor.gui.properties.handle, "texture_txf", 99, 92, "images/text_field128", editor.gui.fonts.normal, "")
	editor.gui.properties.edit.particles.texture_open = edi_create_button(editor.gui.properties.handle, "texture_open", 231, 92, "images/mini_open")
	editor.gui.properties.edit.particles.model_txf = edi_create_text_field(editor.gui.properties.handle, "model_txf", 99, 114, "images/text_field128", editor.gui.fonts.normal, "")
	editor.gui.properties.edit.particles.entity_txf = edi_create_text_field(editor.gui.properties.handle, "entity_txf", 99, 136, "images/text_field128", editor.gui.fonts.normal, "")

	editor.gui.properties.edit.particles.gravity_x_txf = edi_create_text_field(editor.gui.properties.handle, "gravity_x_txf", 99, 158, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.gravity_y_txf = edi_create_text_field(editor.gui.properties.handle, "gravity_y_txf", 151, 158, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.gravity_z_txf = edi_create_text_field(editor.gui.properties.handle, "gravity_z_txf", 203, 158, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.spawn_delay_txf = edi_create_text_field(editor.gui.properties.handle, "spawn_delay_txf", 99, 180, "images/text_field64", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.spawn_cb = edi_create_check_box(editor.gui.properties.handle, "spawn_cb", 99, 202, "images/check_box", false)

	editor.gui.properties.edit.particles.size_min_txf = edi_create_text_field(editor.gui.properties.handle, "size_min_txf", 99, 224, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.size_max_txf = edi_create_text_field(editor.gui.properties.handle, "size_max_txf", 151, 224, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.size_grow_min_txf = edi_create_text_field(editor.gui.properties.handle, "size_grow_min_txf", 99, 246, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.size_grow_max_txf = edi_create_text_field(editor.gui.properties.handle, "size_grow_max_txf", 151, 246, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.rotation_min_txf = edi_create_text_field(editor.gui.properties.handle, "rotation_min_txf", 99, 268, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.rotation_max_txf = edi_create_text_field(editor.gui.properties.handle, "rotation_max_txf", 151, 268, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.rot_grow_min_txf = edi_create_text_field(editor.gui.properties.handle, "rot_grow_min_txf", 99, 290, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.rot_grow_max_txf = edi_create_text_field(editor.gui.properties.handle, "rot_grow_max_txf", 151, 290, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.life_span_min_txf = edi_create_text_field(editor.gui.properties.handle, "life_span_min_txf", 99, 312, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.life_span_max_txf = edi_create_text_field(editor.gui.properties.handle, "life_span_max_txf", 151, 312, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.fade_speed_min_txf = edi_create_text_field(editor.gui.properties.handle, "fade_speed_min_txf", 99, 334, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.fade_speed_max_txf = edi_create_text_field(editor.gui.properties.handle, "fade_speed_max_txf", 151, 334, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.pos_min_x_txf = edi_create_text_field(editor.gui.properties.handle, "pos_min_txf", 99, 356, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.pos_min_y_txf = edi_create_text_field(editor.gui.properties.handle, "pos_min_txf", 151, 356, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.pos_min_z_txf = edi_create_text_field(editor.gui.properties.handle, "pos_min_txf", 203, 356, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.pos_max_x_txf = edi_create_text_field(editor.gui.properties.handle, "pos_max_txf", 99, 378, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.pos_max_y_txf = edi_create_text_field(editor.gui.properties.handle, "pos_max_txf", 151, 378, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.pos_max_z_txf = edi_create_text_field(editor.gui.properties.handle, "pos_max_txf", 203, 378, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.vel_min_x_txf = edi_create_text_field(editor.gui.properties.handle, "vel_min_txf", 99, 400, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.vel_min_y_txf = edi_create_text_field(editor.gui.properties.handle, "vel_min_txf", 151, 400, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.vel_min_z_txf = edi_create_text_field(editor.gui.properties.handle, "vel_min_txf", 203, 400, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.vel_max_x_txf = edi_create_text_field(editor.gui.properties.handle, "vel_max_txf", 99, 422, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.vel_max_y_txf = edi_create_text_field(editor.gui.properties.handle, "vel_max_txf", 151, 422, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.vel_max_z_txf = edi_create_text_field(editor.gui.properties.handle, "vel_max_txf", 203, 422, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.color_min_r_txf = edi_create_text_field(editor.gui.properties.handle, "color_min_r_txf", 4, 466, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.color_min_g_txf = edi_create_text_field(editor.gui.properties.handle, "color_min_g_txf", 56, 466, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.color_min_b_txf = edi_create_text_field(editor.gui.properties.handle, "color_min_b_txf", 108, 466, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.color_min_a_txf = edi_create_text_field(editor.gui.properties.handle, "color_min_a_txf", 160, 466, "images/text_field48", editor.gui.fonts.normal, "0")

	editor.gui.properties.edit.particles.color_max_r_txf = edi_create_text_field(editor.gui.properties.handle, "color_max_r_txf", 4, 510, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.color_max_g_txf = edi_create_text_field(editor.gui.properties.handle, "color_max_g_txf", 56, 510, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.color_max_b_txf = edi_create_text_field(editor.gui.properties.handle, "color_max_b_txf", 108, 510, "images/text_field48", editor.gui.fonts.normal, "0")
	editor.gui.properties.edit.particles.color_max_a_txf = edi_create_text_field(editor.gui.properties.handle, "color_max_a_txf", 160, 510, "images/text_field48", editor.gui.fonts.normal, "0")

	-- setup the sprite properties

	editor.gui.properties.edit.sprite = {}

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

	edi_hide_edit_tab(EDI_EDIT_CAMERA)
	edi_hide_edit_tab(EDI_EDIT_LIGHT)
	edi_hide_edit_tab(EDI_EDIT_ENTITY)
	edi_hide_edit_tab(EDI_EDIT_PARTICLES)
	edi_hide_edit_tab(EDI_EDIT_SPRITES)
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
	if tab == EDI_EDIT_CAMERA then
		elf.SetCheckBoxState(editor.gui.properties.edit.cam_cb, false)
		for k, v in pairs(editor.gui.properties.edit.camera) do elf.SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_LIGHT then
		elf.SetCheckBoxState(editor.gui.properties.edit.lig_cb, false)
		for k, v in pairs(editor.gui.properties.edit.light) do elf.SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_ENTITY then
		elf.SetCheckBoxState(editor.gui.properties.edit.ent_cb, false)
		for k, v in pairs(editor.gui.properties.edit.entity) do elf.SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_PARTICLES then
		elf.SetCheckBoxState(editor.gui.properties.edit.par_cb, false)
		for k, v in pairs(editor.gui.properties.edit.particles) do elf.SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_SPRITE then
		elf.SetCheckBoxState(editor.gui.properties.edit.spr_cb, false)
		for k, v in pairs(editor.gui.properties.edit.sprite) do elf.SetGuiObjectVisible(v, false) end
	end
end

function edi_show_edit_tab(tab)
	elf.SetCheckBoxState(editor.gui.properties.edit.act_cb, false)
	elf.SetCheckBoxState(editor.gui.properties.edit.cam_cb, false)
	elf.SetCheckBoxState(editor.gui.properties.edit.lig_cb, false)
	elf.SetCheckBoxState(editor.gui.properties.edit.ent_cb, false)
	elf.SetCheckBoxState(editor.gui.properties.edit.par_cb, false)
	elf.SetCheckBoxState(editor.gui.properties.edit.spr_cb, false)

	if tab == EDI_EDIT_ACTOR then
		elf.SetCheckBoxState(editor.gui.properties.edit.act_cb, true)
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.actor) do elf.SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_CAMERA then
		elf.SetCheckBoxState(editor.gui.properties.edit.cam_cb, true)
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.camera) do elf.SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_LIGHT then
		elf.SetCheckBoxState(editor.gui.properties.edit.lig_cb, true)
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.light) do elf.SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_ENTITY then
		elf.SetCheckBoxState(editor.gui.properties.edit.ent_cb, true)
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.entity) do elf.SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_PARTICLES then
		elf.SetCheckBoxState(editor.gui.properties.edit.par_cb, true)
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.particles) do elf.SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_SPRITE then
		elf.SetCheckBoxState(editor.gui.properties.edit.spr_cb, true)
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.sprite) do elf.SetGuiObjectVisible(v, true) end
		end
	end

	if editor.scene.selection ~= nil then
		if elf.GetObjectType(editor.scene.selection) == elf.CAMERA then
			elf.SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, true)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		elseif elf.GetObjectType(editor.scene.selection) == elf.LIGHT then
			elf.SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, true)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		elseif elf.GetObjectType(editor.scene.selection) == elf.ENTITY then
			elf.SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, true)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		elseif elf.GetObjectType(editor.scene.selection) == elf.PARTICLES then
			elf.SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.par_cb, true)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		elseif elf.GetObjectType(editor.scene.selection) == elf.SPRITE then
			elf.SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
			elf.SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, true)
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
		elf.SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
		elf.SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
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
		edi_switch_edit_tab(EDI_EDIT_ACTOR)
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

function edi_update_edit_selection()
	if editor.scene.selection == nil then
		if editor.gui.properties.curren_tab == EDI_PROPERTIES_EDIT then
			edi_hide_edit_tab(editor.gui.properties.edit.current_tab)
		end
		return
	end

	if editor.gui.properties.current_tab == EDI_PROPERTIES_EDIT then
		edi_switch_edit_tab(EDI_EDIT_ACTOR)
	end

	-- update actor properties

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
		elf.SetTextFieldText(editor.gui.properties.edit.actor.script_txf, elf.GetScriptName(scr))
	end

	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.name_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_z_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_z_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.script_txf, 0)

	if elf.IsActorPhysics(editor.scene.selection) == true then
		elf.SetCheckBoxState(editor.gui.properties.edit.actor.physics_enb_cb, true)
	else
		elf.SetCheckBoxState(editor.gui.properties.edit.actor.physics_enb_cb, false)
	end

	local lengths = elf.GetActorBoundingLengths(editor.scene.selection)
	elf.SetTextFieldText(editor.gui.properties.edit.actor.lengths_x_txf, tostring(lengths.x))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.lengths_y_txf, tostring(lengths.y))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.lengths_z_txf, tostring(lengths.z))
	local offset = elf.GetActorBoundingOffset(editor.scene.selection)
	elf.SetTextFieldText(editor.gui.properties.edit.actor.offset_x_txf, tostring(offset.x))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.offset_y_txf, tostring(offset.y))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.offset_z_txf, tostring(offset.z))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.mass_txf, tostring(elf.GetActorMass(editor.scene.selection)))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.lin_damp_txf, tostring(elf.GetActorLinearDamping(editor.scene.selection)))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.ang_damp_txf, tostring(elf.GetActorAngularDamping(editor.scene.selection)))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.lin_sleep_txf, tostring(elf.GetActorLinearSleepThreshold(editor.scene.selection)))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.ang_sleep_txf, tostring(elf.GetActorAngularSleepThreshold(editor.scene.selection)))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.restitu_txf, tostring(elf.GetActorRestitution(editor.scene.selection)))
	local anis_fric = elf.GetActorAnisotropicFriction(editor.scene.selection)
	elf.SetTextFieldText(editor.gui.properties.edit.actor.anis_fric_x_txf, tostring(anis_fric.x))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.anis_fric_y_txf, tostring(anis_fric.y))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.anis_fric_z_txf, tostring(anis_fric.z))
	local lin_factor = elf.GetActorLinearFactor(editor.scene.selection)
	elf.SetTextFieldText(editor.gui.properties.edit.actor.lin_factor_x_txf, tostring(lin_factor.x))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.lin_factor_y_txf, tostring(lin_factor.y))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.lin_factor_z_txf, tostring(lin_factor.z))
	local ang_factor = elf.GetActorAngularFactor(editor.scene.selection)
	elf.SetTextFieldText(editor.gui.properties.edit.actor.ang_factor_x_txf, tostring(ang_factor.x))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.ang_factor_y_txf, tostring(ang_factor.y))
	elf.SetTextFieldText(editor.gui.properties.edit.actor.ang_factor_z_txf, tostring(ang_factor.z))
	elf.SetTextListSelection(editor.gui.properties.edit.actor.shape, elf.GetActorShape(editor.scene.selection)-1)

	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengths_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengths_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengths_z_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offset_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offset_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offset_z_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.mass_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_damp_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_damp_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_sleep_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_sleep_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.restitu_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anis_fric_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anis_fric_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anis_fric_z_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_factor_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_factor_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_factor_z_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_factor_x_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_factor_y_txf, 0)
	elf.SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_factor_z_txf, 0)

	if elf.GetObjectType(editor.scene.selection) == elf.CAMERA then
		elf.SetTextFieldText(editor.gui.properties.edit.camera.fov_txf, elf.GetCameraFov(editor.scene.selection))
		local clip = elf.GetCameraClip(editor.scene.selection)
		elf.SetTextFieldText(editor.gui.properties.edit.camera.clip_near_txf, clip.x)
		elf.SetTextFieldText(editor.gui.properties.edit.camera.clip_far_txf, clip.y)

		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.camera.fov_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.camera.clip_near_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.camera.clip_far_txf, 0)
	elseif elf.GetObjectType(editor.scene.selection) == elf.LIGHT then
		local color = elf.GetLightColor(editor.scene.selection)
		elf.SetTextListSelection(editor.gui.properties.edit.light.type_txl, elf.GetLightType(editor.scene.selection)-1)

		elf.SetTextFieldText(editor.gui.properties.edit.light.color_r_txf, color.r)
		elf.SetTextFieldText(editor.gui.properties.edit.light.color_g_txf, color.g)
		elf.SetTextFieldText(editor.gui.properties.edit.light.color_b_txf, color.b)

		elf.SetTextFieldText(editor.gui.properties.edit.light.distance_txf, elf.GetLightDistance(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.light.fade_speed_txf, elf.GetLightFadeSpeed(editor.scene.selection))

		elf.SetTextFieldText(editor.gui.properties.edit.light.inner_cone_txf, elf.GetLightCone(editor.scene.selection).x)
		elf.SetTextFieldText(editor.gui.properties.edit.light.outer_cone_txf, elf.GetLightCone(editor.scene.selection).y)

		elf.SetCheckBoxState(editor.gui.properties.edit.light.shadows_cb, elf.GetLightShadowCaster(editor.scene.selection))

		elf.SetCheckBoxState(editor.gui.properties.edit.light.ls_enabled_cb, elf.IsLightShaft(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.light.size_txf, elf.GetLightShaftSize(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.light.intensity_txf, elf.GetLightShaftIntensity(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.light.fade_off_txf, elf.GetLightShaftFadeOff(editor.scene.selection))

		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.color_r_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.color_g_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.color_b_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.distance_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.fade_speed_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.inner_cone_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.outer_cone_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.size_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.intensity_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.light.fade_off_txf, 0)
	elseif elf.GetObjectType(editor.scene.selection) == elf.ENTITY then
	elseif elf.GetObjectType(editor.scene.selection) == elf.PARTICLES then
		elf.SetTextFieldText(editor.gui.properties.edit.particles.max_count_txf, elf.GetParticlesMaxCount(editor.scene.selection))

		if elf.GetParticlesDrawMode(editor.scene.selection) == elf.TRANSPARENT then
			elf.SetCheckBoxState(editor.gui.properties.edit.particles.trs_cb, true)
			elf.SetCheckBoxState(editor.gui.properties.edit.particles.add_cb, false)
		elseif elf.GetParticlesDrawMode(editor.scene.selection) == elf.ADD then
			elf.SetCheckBoxState(editor.gui.properties.edit.particles.trs_cb, false)
			elf.SetCheckBoxState(editor.gui.properties.edit.particles.add_cb, true)
		end

		local tex = elf.GetParticlesTexture(editor.scene.selection)
		if elf.IsObject(tex) == true then
			elf.SetTextFieldText(editor.gui.properties.edit.particles.texture_txf, elf.GetTextureName(tex))
		else
			elf.SetTextFieldText(editor.gui.properties.edit.particles.texture_txf, "")
		end

		local mdl = elf.GetParticlesModel(editor.scene.selection)
		if elf.IsObject(mdl) == true then
			elf.SetTextFieldText(editor.gui.properties.edit.particles.model_txf, elf.GetModelName(mdl))
		else
			elf.SetTextFieldText(editor.gui.properties.edit.particles.model_txf, "")
		end

		local ent = elf.GetParticlesEntity(editor.scene.selection)
		if elf.IsObject(ent) == true then
			elf.SetTextFieldText(editor.gui.properties.edit.particles.entity_txf, elf.GetActorName(ent))
		else
			elf.SetTextFieldText(editor.gui.properties.edit.particles.entity_txf, "")
		end

		local gravity = elf.GetParticlesGravity(editor.scene.selection)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.gravity_x_txf, gravity.x)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.gravity_y_txf, gravity.y)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.gravity_z_txf, gravity.z)

		elf.SetTextFieldText(editor.gui.properties.edit.particles.spawn_delay_txf, elf.GetParticlesSpawnDelay(editor.scene.selection))
		elf.SetCheckBoxState(editor.gui.properties.edit.particles.spawn_cb, elf.GetParticlesSpawn(editor.scene.selection))

		elf.SetTextFieldText(editor.gui.properties.edit.particles.size_min_txf, elf.GetParticlesSizeMin(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.size_max_txf, elf.GetParticlesSizeMax(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.size_grow_min_txf, elf.GetParticlesSizeGrowthMin(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.size_grow_max_txf, elf.GetParticlesSizeGrowthMax(editor.scene.selection))

		elf.SetTextFieldText(editor.gui.properties.edit.particles.rotation_min_txf, elf.GetParticlesRotationMin(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.rotation_max_txf, elf.GetParticlesRotationMin(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.rot_grow_min_txf, elf.GetParticlesRotationGrowthMin(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.rot_grow_max_txf, elf.GetParticlesRotationGrowthMin(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.life_span_min_txf, elf.GetParticlesLifeSpanMin(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.life_span_max_txf, elf.GetParticlesLifeSpanMax(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.fade_speed_min_txf, elf.GetParticlesFadeSpeedMin(editor.scene.selection))
		elf.SetTextFieldText(editor.gui.properties.edit.particles.fade_speed_max_txf, elf.GetParticlesFadeSpeedMax(editor.scene.selection))

		local pos = elf.GetParticlesPositionMin(editor.scene.selection)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.pos_min_x_txf, pos.x)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.pos_min_y_txf, pos.y)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.pos_min_z_txf, pos.z)

		local pos = elf.GetParticlesPositionMax(editor.scene.selection)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.pos_max_x_txf, pos.x)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.pos_max_y_txf, pos.y)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.pos_max_z_txf, pos.z)

		local vel = elf.GetParticlesVelocityMin(editor.scene.selection)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.vel_min_x_txf, vel.x)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.vel_min_y_txf, vel.y)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.vel_min_z_txf, vel.z)

		local vel = elf.GetParticlesVelocityMax(editor.scene.selection)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.vel_max_x_txf, vel.x)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.vel_max_y_txf, vel.y)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.vel_max_z_txf, vel.z)

		local color = elf.GetParticlesColorMin(editor.scene.selection)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf, color.r)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf, color.g)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf, color.b)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf, color.a)

		local color = elf.GetParticlesColorMax(editor.scene.selection)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf, color.r)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf, color.g)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf, color.b)
		elf.SetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf, color.a)

		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.max_count_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.texture_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.model_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.entity_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravity_x_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravity_y_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravity_z_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.spawn_delay_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.size_min_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.size_max_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.size_grow_min_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.size_grow_max_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rotation_min_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rotation_max_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rot_grow_min_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rot_grow_max_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.life_span_min_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.life_span_max_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.fade_speed_min_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.fade_speed_max_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_min_x_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_min_y_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_min_z_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_max_x_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_max_y_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_max_z_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_min_x_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_min_y_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_min_z_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_max_x_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_max_y_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_max_z_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_min_r_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_min_g_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_min_b_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_min_a_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_max_r_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_max_g_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_max_b_txf, 0)
		elf.SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_max_a_txf, 0)
	elseif elf.GetObjectType(editor.scene.selection) == elf.SPRITE then
	end
end

function edi_update_properties_selection()
	edi_update_edit_selection()
end

function edi_properties_menu_open(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	if edi_load_scene(path) == true then
		edi_open_properties()
	end
end

function edi_properties_menu_save(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	if edi_save_scene(path) == true then
		edi_open_properties()
	end
end

function edi_properties_menu_import_scene(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	local scn = elf.CreateSceneFromFile(path)
	if elf.IsObject(scn) == true then

		print("importing scene \"" .. path .. "\"")
		print("  cameras: " .. elf.GetSceneCameraCount(scn))
		print("  entities: " .. elf.GetSceneEntityCount(scn))
		print("  lights: " .. elf.GetSceneLightCount(scn))
		print("  sprites: " .. elf.GetSceneSpriteCount(scn))
		print("  particles: " .. elf.GetSceneParticlesCount(scn))

		while elf.IsObject(elf.GetCameraByIndex(scn, 0)) do
			local cam = elf.GetCameraByIndex(scn, 0)
			elf.AddCameraToScene(editor.scene.handle, cam)
		end
		while elf.IsObject(elf.GetEntityByIndex(scn, 0)) do
			local ent = elf.GetEntityByIndex(scn, 0)
			elf.AddEntityToScene(editor.scene.handle, ent)
		end
		while elf.IsObject(elf.GetLightByIndex(scn, 0)) do
			local lig = elf.GetLightByIndex(scn, 0)
			elf.AddLightToScene(editor.scene.handle, lig)
		end
		while elf.IsObject(elf.GetSpriteByIndex(scn, 0)) do
			local spr = elf.GetSpriteByIndex(scn, 0)
			elf.AddSpriteToScene(editor.scene.handle, spr)
		end
		while elf.IsObject(elf.GetParticlesByIndex(scn, 0)) do
			local par = elf.GetParticlesByIndex(scn, 0)
			elf.AddParticlesToScene(editor.scene.handle, par)
		end
		edi_open_properties()
	end
end

function edi_update_menu()
	if elf.GetGuiObjectEvent(editor.gui.properties.menu.open) == elf.CLICKED then
		edi_open_file_dialog(elf.GetCurrentDirectory(), "Open PAK...", EDI_FILE_DIALOG_OPEN, edi_properties_menu_open)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.menu.save) == elf.CLICKED then
		local path = elf.GetSceneFilePath(editor.scene.handle)
		if path == nil or string.len(path) < 1 then
			path = elf.GetCurrentDirectory()
		else
			path = edi_get_parent_folder(path)
		end
		edi_open_file_dialog(path, "Save PAK...", EDI_FILE_DIALOG_SAVE, edi_properties_menu_save)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.menu.import_scene) == elf.CLICKED then
		edi_open_file_dialog(elf.GetCurrentDirectory(), "Import Scene (.pak/.dae/.3ds/.md2/...) ...", EDI_FILE_DIALOG_OPEN, edi_properties_menu_import_scene)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.menu.move) == elf.STATE_CHANGED then
		if editor.scene.selection ~= nil then
			editor.gui.action.move_orig_pos = elf.GetActorPosition(editor.scene.selection)
			editor.gui.action.move = true
			elf.SetCheckBoxState(editor.gui.properties.menu.move, true)
		else
			elf.SetCheckBoxState(editor.gui.properties.menu.move, false)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.menu.rotate) == elf.STATE_CHANGED then
		if editor.scene.selection ~= nil then
			editor.gui.action.rotate_orig_rot = elf.GetActorRotation(editor.scene.selection)
			editor.gui.action.rotate = true
			elf.SetCheckBoxState(editor.gui.properties.menu.rotate, true)
		else
			elf.SetCheckBoxState(editor.gui.properties.menu.rotate, false)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.menu.create_light) == elf.CLICKED then
		local lig = elf.CreateLight("Light")
		elf.AddLightToScene(editor.scene.handle, lig)

		edi_select_actor(lig)
		elf.SetCheckBoxState(editor.gui.properties.menu.move, true)
	end
end

function edi_properties_edit_actor_open_script(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	if string.find(path, ".lua") == nil then return end

	local scr = elf.CreateScriptFromFile(path)
	if elf.IsObject(scr) == true then
		elf.SetActorScript(editor.scene.selection, scr)
		edi_update_edit_selection()
		edi_open_properties()
	end
end

function edi_update_actor()
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.name_txf) == elf.LOSE_FOCUS then
		elf.SetActorName(editor.scene.selection, elf.GetTextFieldText(editor.gui.properties.edit.actor.name_txf))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.script_open) == elf.CLICKED then
		edi_open_file_dialog(elf.GetCurrentDirectory(), "Open Script (.lua)...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_actor_open_script)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.script_txf) == elf.LOSE_FOCUS then
		if string.len(elf.GetTextFieldText(editor.gui.properties.edit.actor.script_txf)) < 1 then
			elf.ClearActorScript(editor.scene.selection)
		else
			local scr = elf.GetActorScript(editor.scene.selection)
			if elf.IsObject(scr) == true then
				elf.SetScriptName(scr, elf.GetTextFieldText(editor.gui.properties.edit.actor.script_txf))
			end
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.pos_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.pos_x_txf, nil, nil)
		elf.SetActorPosition(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.pos_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.pos_y_txf, nil, nil)
		elf.SetActorPosition(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.pos_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.pos_z_txf, nil, nil)
		elf.SetActorPosition(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.pos_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.rot_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.rot_x_txf, nil, nil)
		elf.SetActorRotation(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.rot_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.rot_y_txf, nil, nil)
		elf.SetActorRotation(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.rot_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.rot_z_txf, nil, nil)
		elf.SetActorRotation(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.rot_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.physics_enb_cb) == elf.STATE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.edit.actor.physics_enb_cb) == true then
			local shape = elf.GetActorShape(editor.scene.selection)
			if shape == 0 then
				elf.SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
				shape = 1
			end
			elf.SetActorPhysics(editor.scene.selection, shape, elf.GetActorMass(editor.scene.selection))
		else
			elf.DisableActorPhysics(editor.scene.selection)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.lengths_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lengths_x_txf, 0.0, nil)
		elf.SetActorBoundingLengths(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.lengths_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lengths_y_txf, 0.0, nil)
		elf.SetActorBoundingLengths(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.lengths_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lengths_z_txf, 0.0, nil)
		elf.SetActorBoundingLengths(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lengths_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.offset_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.offset_x_txf, 0.0, nil)
		elf.SetActorBoundingOffset(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.offset_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.offset_y_txf, 0.0, nil)
		elf.SetActorBoundingOffset(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.offset_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.offset_z_txf, 0.0, nil)
		elf.SetActorBoundingOffset(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.offset_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.mass_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.mass_txf, 0.0, nil)
		local physics = elf.IsActorPhysics(editor.scene.selection)
		local shape = elf.GetActorShape(editor.scene.selection)
		if shape == 0 then
			elf.SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
			shape = 1
		end
		elf.SetActorPhysics(editor.scene.selection, shape,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.mass_txf)))
		if physics == false then elf.DisableActorPhysics(editor.scene.selection) end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_damp_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_damp_txf, 0.0, nil)
		elf.SetActorDamping(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_damp_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_damp_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_damp_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_damp_txf, 0.0, nil)
		elf.SetActorDamping(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_damp_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_damp_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_sleep_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_sleep_txf, 0.0, nil)
		elf.SetActorSleepThresholds(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_sleep_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_sleep_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_sleep_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_sleep_txf, 0.0, nil)
		elf.SetActorSleepThresholds(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_sleep_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_sleep_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.restitu_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.restitu_txf, 0.0, nil)
		elf.SetActorRestitution(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.restitu_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.anis_fric_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.anis_fric_x_txf, 0.0, nil)
		elf.SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.anis_fric_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.anis_fric_y_txf, 0.0, nil)
		elf.SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.anis_fric_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.anis_fric_z_txf, 0.0, nil)
		elf.SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_factor_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_factor_x_txf, 0.0, nil)
		elf.SetActorLinearFactor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_factor_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_factor_y_txf, 0.0, nil)
		elf.SetActorLinearFactor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_factor_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_factor_z_txf, 0.0, nil)
		elf.SetActorLinearFactor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_factor_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_factor_x_txf, 0.0, nil)
		elf.SetActorAngularFactor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_factor_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_factor_y_txf, 0.0, nil)
		elf.SetActorAngularFactor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_factor_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_factor_z_txf, 0.0, nil)
		elf.SetActorAngularFactor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.shape) == elf.SELECTION_CHANGED then
		local physics = elf.IsActorPhysics(editor.scene.selection)
		local shape = elf.GetTextListSelectionIndex(editor.gui.properties.edit.actor.shape)+1
		if shape == 0 then
			elf.SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
			shape = 1
		end
		elf.SetActorPhysics(editor.scene.selection, shape,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.actor.mass_txf)))
		if physics == false then elf.DisableActorPhysics(editor.scene.selection) end
	end

	local diff = elf.GetTextListItemCount(editor.gui.properties.edit.actor.shape)-
		elf.GetTextListRowCount(editor.gui.properties.edit.actor.shape)

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.actor.shape_sb) == elf.VALUE_CHANGED then
		if diff > 0 then
			elf.SetTextListOffset(editor.gui.properties.edit.actor.shape, diff*(1.0-elf.GetSliderValue(editor.gui.properties.edit.actor.shape_sb)))
		end
	end
end

function edi_update_camera()
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.camera.fov_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.camera.fov_txf, 0.0, 179.0)
		elf.SetCameraPerspective(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.fov_txf)),
			-1.0, tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.clip_near_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.clip_far_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.camera.clip_near_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.camera.clip_near_txf, 0.0, nil)
		elf.SetCameraPerspective(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.fov_txf)),
			-1.0, tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.clip_near_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.clip_far_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.camera.clip_far_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.camera.clip_far_txf, 0.0, nil)
		elf.SetCameraPerspective(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.fov_txf)),
			-1.0, tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.clip_near_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.camera.clip_far_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.camera.copy_but) == elf.CLICKED then
		local pos = elf.GetActorPosition(editor.scene.selection)
		local rot = elf.GetActorRotation(editor.scene.selection)
		local clip = elf.GetCameraClip(editor.scene.selection)
		elf.SetActorPosition(editor.scene.camera.handle, pos.x, pos.y, pos.z)
		elf.SetActorRotation(editor.scene.camera.handle, rot.x, rot.y, rot.z)
		elf.SetCameraPerspective(editor.scene.camera.handle,
			elf.GetCameraFov(editor.scene.selection), -1.0, clip.x, clip.y)
	end
end

function edi_update_light()
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.type_txl) == elf.SELECTION_CHANGED then
		elf.SetLightType(editor.scene.selection, elf.GetTextListSelectionIndex(editor.gui.properties.edit.light.type_txl)+1)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.color_r_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.color_r_txf, 0.0, nil)
		elf.SetLightColor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_b_txf)), 1.0)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.color_g_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.color_g_txf, 0.0, nil)
		elf.SetLightColor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_b_txf)), 1.0)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.color_b_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.color_b_txf, 0.0, nil)
		elf.SetLightColor(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.color_b_txf)), 1.0)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.distance_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.distance_txf, 0.0, nil)
		elf.SetLightDistance(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.distance_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.fade_speed_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.fade_speed_txf, 0.0, nil)
		elf.SetLightFadeSpeed(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.fade_speed_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.inner_cone_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.inner_cone_txf, 0.0, nil)
		elf.SetLightCone(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.inner_cone_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.outer_cone_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.outer_cone_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.outer_cone_txf, 0.0, nil)
		elf.SetLightCone(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.inner_cone_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.outer_cone_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.shadows_cb) == elf.STATE_CHANGED then
		elf.SetLightShadowCaster(editor.scene.selection, elf.GetCheckBoxState(editor.gui.properties.edit.light.shadows_cb))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.ls_enabled_cb) == elf.STATE_CHANGED then
		if elf.GetCheckBoxState(editor.gui.properties.edit.light.ls_enabled_cb) then
			elf.SetLightShaft(editor.scene.selection,
				tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.size_txf)),
				tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.intensity_txf)),
				tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.fade_off_txf)))
		else
			elf.DisableLightShaft(editor.scene.selection)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.size_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.size_txf, 0.0, nil)
		local enabled = elf.IsLightShaft(editor.scene.selection)
		elf.SetLightShaft(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.size_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.intensity_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.fade_off_txf)))
		if enabled == false then elf.DisableLightShaft(editor.scene.selection) end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.intensity_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.intensity_txf, 0.0, nil)
		local enabled = elf.IsLightShaft(editor.scene.selection)
		elf.SetLightShaft(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.size_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.intensity_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.fade_off_txf)))
		if enabled == false then elf.DisableLightShaft(editor.scene.selection) end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.light.fade_off_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.fade_off_txf, 0.0, nil)
		local enabled = elf.IsLightShaft(editor.scene.selection)
		elf.SetLightShaft(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.size_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.intensity_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.light.fade_off_txf)))
		if enabled == false then elf.DisableLightShaft(editor.scene.selection) end
	end
end

function edi_update_entity()
end

function edi_properties_edit_particles_open_texture(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	local tex = elf.CreateTextureFromFile(path)
	if elf.IsObject(tex) == true then
		elf.SetParticlesTexture(editor.scene.selection, tex)
		edi_update_edit_selection()
		edi_open_properties()
	end
end

function edi_update_particles()
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.max_count_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_int(editor.gui.properties.edit.particles.max_count_txf, 0, nil)
		elf.SetParticlesMaxCount(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.max_count_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.texture_open) == elf.CLICKED then
		edi_open_file_dialog(elf.GetCurrentDirectory(), "Open Particles Texture...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_particles_open_texture)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.texture_txf) == elf.LOSE_FOCUS then
		local name = elf.GetTextFieldText(editor.gui.properties.edit.particles.texture_txf)
		if string.len(name) > 0 then
			local tex = elf.GetParticlesTexture(editor.scene.selection)
			if elf.IsObject(tex) == true then
				elf.SetTextureName(tex, name)
			else
				local textures = elf.GetSceneTextures(editor.scene.handle)
				local tex = elf.BeginList(textures)
				while elf.IsObject(tex) == true do
					if elf.GetTextureName(tex) == name then
						elf.SetParticlesTexture(editor.scene.selection, tex)
						break
					end
					tex = elf.NextInList(textures)
				end
				if elf.IsObject(tex) == false then elf.SetTextFieldText(editor.gui.properties.edit.particles.texture_txf, "") end
			end
		else
			elf.ClearParticlesTexture(editor.scene.selection)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.trs_cb) == elf.STATE_CHANGED then
		elf.SetCheckBoxState(editor.gui.properties.edit.particles.trs_cb, true)
		elf.SetCheckBoxState(editor.gui.properties.edit.particles.add_cb, false)
		elf.SetParticlesDrawMode(editor.scene.selection, elf.TRANSPARENT)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.add_cb) == elf.STATE_CHANGED then
		elf.SetCheckBoxState(editor.gui.properties.edit.particles.trs_cb, false)
		elf.SetCheckBoxState(editor.gui.properties.edit.particles.add_cb, true)
		elf.SetParticlesDrawMode(editor.scene.selection, elf.ADD)
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.model_txf) == elf.LOSE_FOCUS then
		local name = elf.GetTextFieldText(editor.gui.properties.edit.particles.model_txf)
		if string.len(name) > 0 then
			local mdl = elf.GetParticlesModel(editor.scene.selection)
			if elf.IsObject(mdl) == true then
				elf.SetModelName(mdl, name)
			else
				local models = elf.GetSceneModels(editor.scene.handle)
				local mdl = elf.BeginList(models)
				while elf.IsObject(mdl) == true do
					if elf.GetModelName(mdl) == name then
						elf.SetTextFieldText(editor.gui.properties.edit.particles.entity_txf, "")
						elf.SetParticlesModel(editor.scene.selection, mdl)
						break
					end
					mdl = elf.NextInList(models)
				end
				if elf.IsObject(mdl) == false then elf.SetTextFieldText(editor.gui.properties.edit.particles.model_txf, "") end
			end
		else
			elf.ClearParticlesModel(editor.scene.selection)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.entity_txf) == elf.LOSE_FOCUS then
		local name = elf.GetTextFieldText(editor.gui.properties.edit.particles.entity_txf)
		if string.len(name) > 0 then
			local ent = elf.GetParticlesEntity(editor.scene.selection)
			if elf.IsObject(ent) == true then
				elf.SetActorName(ent, name)
			else
				local ent = nil
				for i=0, elf.GetSceneEntityCount(editor.scene.handle)-1 do
					ent = elf.GetEntityByIndex(editor.scene.handle, i)
					if elf.GetActorName(ent) == name then
						elf.SetTextFieldText(editor.gui.properties.edit.particles.model_txf, "")
						elf.SetParticlesEntity(editor.scene.selection, ent)
						break
					end
				end
				if elf.IsObject(ent) == false then elf.SetTextFieldText(editor.gui.properties.edit.particles.entity_txf, "") end
			end
		else
			elf.ClearParticlesEntity(editor.scene.selection)
		end
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.gravity_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.gravity_x_txf, nil, nil)
		elf.SetParticlesGravity(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.gravity_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.gravity_z_txf, nil, nil)
		elf.SetParticlesGravity(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.gravity_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.gravity_z_txf, nil, nil)
		elf.SetParticlesGravity(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.gravity_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.spawn_delay_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.spawn_delay_txf, 0.00001, nil)
		elf.SetParticlesSpawnDelay(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.spawn_delay_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.spawn_cb) == elf.STATE_CHANGED then
		elf.SetParticlesSpawn(editor.scene.selection,
			elf.GetCheckBoxState(editor.gui.properties.edit.particles.spawn_cb))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.size_min_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.size_min_txf, 0.0, nil)
		elf.SetParticlesSize(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.size_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.size_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.size_max_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.size_max_txf, 0.0, nil)
		elf.SetParticlesSize(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.size_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.size_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.size_grow_min_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.size_grow_min_txf, nil, nil)
		elf.SetParticlesSizeGrowth(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.size_grow_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.size_grow_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.size_grow_max_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.size_grow_max_txf, nil, nil)
		elf.SetParticlesSizeGrowth(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.size_grow_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.size_grow_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.rotation_min_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.rotation_min_txf, 0.0, nil)
		elf.SetParticlesRotation(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.rotation_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.rotation_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.rotation_max_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.rotation_max_txf, 0.0, nil)
		elf.SetParticlesRotation(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.rotation_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.rotation_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.rot_grow_min_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.rot_grow_min_txf, nil, nil)
		elf.SetParticlesRotation(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.rot_grow_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.rot_grow_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.rot_grow_max_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.rot_grow_max_txf, nil, nil)
		elf.SetParticlesRotation(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.rot_grow_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.rot_grow_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.life_span_min_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.life_span_min_txf, 0.0, nil)
		elf.SetParticlesLifeSpan(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.life_span_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.life_span_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.life_span_max_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.life_span_max_txf, 0.0, nil)
		elf.SetParticlesLifeSpan(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.life_span_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.life_span_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.fade_speed_min_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.fade_speed_min_txf, 0.0, nil)
		elf.SetParticlesFadeSpeed(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.fade_speed_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.fade_speed_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.fade_speed_max_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.fade_speed_max_txf, 0.0, nil)
		elf.SetParticlesFadeSpeed(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.fade_speed_min_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.fade_speed_max_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_min_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_min_x_txf, nil, nil)
		elf.SetParticlesPositionMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_min_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_min_y_txf, nil, nil)
		elf.SetParticlesPositionMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_min_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_min_z_txf, nil, nil)
		elf.SetParticlesPositionMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_min_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_max_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_max_x_txf, nil, nil)
		elf.SetParticlesPositionMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_max_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_max_y_txf, nil, nil)
		elf.SetParticlesPositionMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_max_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_max_z_txf, nil, nil)
		elf.SetParticlesPositionMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.pos_max_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_min_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_min_x_txf, nil, nil)
		elf.SetParticlesVelocityMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_min_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_min_y_txf, nil, nil)
		elf.SetParticlesVelocityMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_min_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_min_z_txf, nil, nil)
		elf.SetParticlesVelocityMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_min_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_max_x_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_max_x_txf, nil, nil)
		elf.SetParticlesVelocityMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_max_y_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_max_y_txf, nil, nil)
		elf.SetParticlesVelocityMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_max_z_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_max_z_txf, nil, nil)
		elf.SetParticlesVelocityMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_x_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_y_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.vel_max_z_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.color_min_r_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_min_r_txf, 0.0, 1.0)
		elf.SetParticlesColorMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.color_min_g_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_min_g_txf, 0.0, 1.0)
		elf.SetParticlesColorMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.color_min_b_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_min_b_txf, 0.0, 1.0)
		elf.SetParticlesColorMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.color_min_a_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_min_a_txf, 0.0, 1.0)
		elf.SetParticlesColorMin(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.color_max_r_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_max_r_txf, 0.0, 1.0)
		elf.SetParticlesColorMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.color_max_g_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_max_g_txf, 0.0, 1.0)
		elf.SetParticlesColorMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.color_max_b_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_max_b_txf, 0.0, 1.0)
		elf.SetParticlesColorMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf)))
	end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.particles.color_max_a_txf) == elf.LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_max_a_txf, 0.0, 1.0)
		elf.SetParticlesColorMax(editor.scene.selection,
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf)),
			tonumber(elf.GetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf)))
	end
end

function edi_update_sprite()
end

function edi_update_edit()
	if editor.scene.selection == nil then return end

	if elf.GetGuiObjectEvent(editor.gui.properties.edit.act_cb) == elf.STATE_CHANGED then
		edi_switch_edit_tab(EDI_EDIT_ACTOR)
	end
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.cam_cb) == elf.STATE_CHANGED then
		edi_switch_edit_tab(EDI_EDIT_CAMERA)
	end
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.lig_cb) == elf.STATE_CHANGED then
		edi_switch_edit_tab(EDI_EDIT_LIGHT)
	end
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.ent_cb) == elf.STATE_CHANGED then
		edi_switch_edit_tab(EDI_EDIT_ENTITY)
	end
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.par_cb) == elf.STATE_CHANGED then
		edi_switch_edit_tab(EDI_EDIT_PARTICLES)
	end
	if elf.GetGuiObjectEvent(editor.gui.properties.edit.spr_cb) == elf.STATE_CHANGED then
		edi_switch_edit_tab(EDI_EDIT_SPRITE)
	end

	if editor.gui.properties.edit.current_tab == EDI_EDIT_ACTOR then edi_update_actor()
	elseif editor.gui.properties.edit.current_tab == EDI_EDIT_CAMERA then edi_update_camera()
	elseif editor.gui.properties.edit.current_tab == EDI_EDIT_LIGHT then edi_update_light()
	elseif editor.gui.properties.edit.current_tab == EDI_EDIT_ENTITY then edi_update_entity()
	elseif editor.gui.properties.edit.current_tab == EDI_EDIT_PARTICLES then edi_update_particles()
	elseif editor.gui.properties.edit.current_tab == EDI_EDIT_SPRITE then edi_update_sprite() end
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

