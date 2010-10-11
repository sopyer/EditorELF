
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
	editor.gui.properties.handle = CreateScreen(editor.gui.handle, "edit_menu", GetWindowWidth()-256, 0, 256, 720)
	SetGuiObjectColor(editor.gui.properties.handle, 1.0, 1.0, 1.0, 0.75)

	-- setup the properties tab check boxes
	editor.gui.properties.menu_cb = CreateButton(editor.gui.properties.handle, "menu_cb", 4, 4, 82, 18, "Menu")
	editor.gui.properties.edit_cb = CreateButton(editor.gui.properties.handle, "edit_cb", 86, 4, 82, 18, "Edit")
	editor.gui.properties.pp_cb = CreateButton(editor.gui.properties.handle, "pp_cb", 168, 4, 82, 18, "PP")

	-- setup the menu tab

	editor.gui.properties.menu = {}

	editor.gui.properties.menu.open = CreateButton(editor.gui.properties.handle, "open", 4, 30, 248, 18, "Open...")
	editor.gui.properties.menu.save = CreateButton(editor.gui.properties.handle, "save", 4, 50, 248, 18, "Save...")
	editor.gui.properties.menu.import_scene = CreateButton(editor.gui.properties.handle, "import_scene", 4, 70, 248, 18, "Import Scene...")
	editor.gui.properties.menu.create_camera = CreateButton(editor.gui.properties.handle, "create_camera", 4, 108, 248, 18, "Create Camera")
	editor.gui.properties.menu.create_light = CreateButton(editor.gui.properties.handle, "create_light", 4, 128, 248, 18, "Create Light")
	editor.gui.properties.menu.create_entity = CreateButton(editor.gui.properties.handle, "create_entity", 4, 148, 248, 18, "Create Entity")
	editor.gui.properties.menu.create_particles = CreateButton(editor.gui.properties.handle, "create_particles", 4, 168, 248, 18, "Create Particles")
	editor.gui.properties.menu.ambient = CreateLabel(editor.gui.properties.handle, "ambient", 4, 196, "Ambient")
	editor.gui.properties.menu.ambient_r = CreateLabel(editor.gui.properties.handle, "ambient", 4, 215, "R")
	editor.gui.properties.menu.ambient_g = CreateLabel(editor.gui.properties.handle, "ambient", 78, 215, "G")
	editor.gui.properties.menu.ambient_b = CreateLabel(editor.gui.properties.handle, "ambient", 155, 215, "B")
	SetGuiObjectColor(editor.gui.properties.menu.ambient, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.menu.ambient_r, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.menu.ambient_g, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.menu.ambient_b, 1.0, 1.0, 1.0, 0.6)
	editor.gui.properties.menu.ambient_r_txf = CreateTextField(editor.gui.properties.handle, "ambient_r_txf", 18, 210, 56, "0")
	editor.gui.properties.menu.ambient_g_txf = CreateTextField(editor.gui.properties.handle, "ambient_g_txf", 94, 210, 56, "0")
	editor.gui.properties.menu.ambient_b_txf = CreateTextField(editor.gui.properties.handle, "ambient_b_txf", 169, 210, 56, "0")

	-- setup the edit tab

	editor.gui.properties.edit = {}

	-- setup the edit tab check boxes
	editor.gui.properties.edit.act_cb = CreateButton(editor.gui.properties.handle, "act_cb", 4, 26, 124, 18, "Actor")
	editor.gui.properties.edit.cam_cb = CreateButton(editor.gui.properties.handle, "cam_cb", 128, 26, 124, 18, "Camera")
	editor.gui.properties.edit.lig_cb = CreateButton(editor.gui.properties.handle, "lig_cb", 128, 26, 124, 18, "Light")
	editor.gui.properties.edit.ent_cb = CreateButton(editor.gui.properties.handle, "ent_cb", 128, 26, 124, 18, "Entity")
	editor.gui.properties.edit.par_cb = CreateButton(editor.gui.properties.handle, "ent_cb", 128, 26, 124, 18, "Particles")
	editor.gui.properties.edit.spr_cb = CreateButton(editor.gui.properties.handle, "ent_cb", 128, 26, 124, 18, "Sprite")

	-- setup the actor properties

	editor.gui.properties.edit.actor = {}

	editor.gui.properties.edit.actor.name_lab = CreateLabel(editor.gui.properties.handle, "name_lab", 4, 54, "Name")
	editor.gui.properties.edit.actor.pos_lab = CreateLabel(editor.gui.properties.handle, "pos_lab", 4, 75, "Position")
	editor.gui.properties.edit.actor.rot_lab = CreateLabel(editor.gui.properties.handle, "rot_lab", 4, 97, "Rotation")
	editor.gui.properties.edit.actor.script_lab = CreateLabel(editor.gui.properties.handle, "script_lab", 4, 118, "Script")
	editor.gui.properties.edit.actor.physics_enb_lab = CreateLabel(editor.gui.properties.handle, "physics_enb_lab", 4, 162, "Physics")
	editor.gui.properties.edit.actor.lengths_lab = CreateLabel(editor.gui.properties.handle, "lengths_lab", 4, 184, "Lengths")
	editor.gui.properties.edit.actor.offset_lab = CreateLabel(editor.gui.properties.handle, "offset_lab", 4, 206, "Offset")
	editor.gui.properties.edit.actor.mass_lab = CreateLabel(editor.gui.properties.handle, "mass_lab", 4, 228, "Mass")
	editor.gui.properties.edit.actor.lin_damp_lab = CreateLabel(editor.gui.properties.handle, "lin_damp_lab", 4, 250, "Lin Damp")
	editor.gui.properties.edit.actor.ang_damp_lab = CreateLabel(editor.gui.properties.handle, "ang_damp_lab", 4, 272, "Ang Damp")
	editor.gui.properties.edit.actor.lin_sleep_lab = CreateLabel(editor.gui.properties.handle, "lin_sleep_lab", 4, 294, "Lin Sleep")
	editor.gui.properties.edit.actor.ang_sleep_lab = CreateLabel(editor.gui.properties.handle, "ang_sleep_lab", 4, 316, "Ang Sleep")
	editor.gui.properties.edit.actor.restitu_lab = CreateLabel(editor.gui.properties.handle, "restitu_lab", 4, 337, "Restitu.")
	editor.gui.properties.edit.actor.anis_fric_lab = CreateLabel(editor.gui.properties.handle, "anis_fric_lab", 4, 360, "Anis Fric")
	editor.gui.properties.edit.actor.lin_fac_lab = CreateLabel(editor.gui.properties.handle, "lin_frac_lab", 4, 382, "Lin Factor")
	editor.gui.properties.edit.actor.ang_fac_lab = CreateLabel(editor.gui.properties.handle, "ang_frac_lab", 4, 404, "Ang Factor")
	editor.gui.properties.edit.actor.shape_lab = CreateLabel(editor.gui.properties.handle, "physics_lab", 4, 428, "Shape")

	SetGuiObjectColor(editor.gui.properties.edit.actor.name_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.pos_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.rot_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.script_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.physics_enb_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.lengths_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.offset_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.mass_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.lin_damp_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.ang_damp_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.lin_sleep_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.ang_sleep_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.restitu_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.anis_fric_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.lin_fac_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.ang_fac_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.actor.shape_lab, 1.0, 1.0, 1.0, 0.6)

	editor.gui.properties.edit.actor.name_txf = CreateTextField(editor.gui.properties.handle, "name_txf", 80, 48, 168, "Object")

	editor.gui.properties.edit.actor.pos_x_txf = CreateTextField(editor.gui.properties.handle, "pos_x_txf", 80, 70, 53, "0")
	editor.gui.properties.edit.actor.pos_y_txf = CreateTextField(editor.gui.properties.handle, "pos_y_txf", 137, 70, 53, "0")
	editor.gui.properties.edit.actor.pos_z_txf = CreateTextField(editor.gui.properties.handle, "pos_z_txf", 194, 70, 53, "0")

	editor.gui.properties.edit.actor.rot_x_txf = CreateTextField(editor.gui.properties.handle, "rot_x_txf", 80, 92, 53, "0")
	editor.gui.properties.edit.actor.rot_y_txf = CreateTextField(editor.gui.properties.handle, "rot_y_txf", 137, 92, 53, "0")
	editor.gui.properties.edit.actor.rot_z_txf = CreateTextField(editor.gui.properties.handle, "rot_z_txf", 194, 92, 53, "0")

	editor.gui.properties.edit.actor.script_txf = CreateTextField(editor.gui.properties.handle, "script_txf", 80, 114, 147, "")
	editor.gui.properties.edit.actor.script_open = CreateButton(editor.gui.properties.handle, "script_open", 231, 114, 18, 18, "...")

	editor.gui.properties.edit.actor.physics_enb_cb = CreateCheckBox(editor.gui.properties.handle, "physics_enb_cb", 80, 160, false)

	editor.gui.properties.edit.actor.lengths_x_txf = CreateTextField(editor.gui.properties.handle, "lengths_x_txf", 80, 180, 53, "0")
	editor.gui.properties.edit.actor.lengths_y_txf = CreateTextField(editor.gui.properties.handle, "lengths_y_txf", 137, 180, 53, "0")
	editor.gui.properties.edit.actor.lengths_z_txf = CreateTextField(editor.gui.properties.handle, "lengths_z_txf", 194, 180, 53, "0")

	editor.gui.properties.edit.actor.offset_x_txf = CreateTextField(editor.gui.properties.handle, "offset_x_txf", 80, 202, 53, "0")
	editor.gui.properties.edit.actor.offset_y_txf = CreateTextField(editor.gui.properties.handle, "offset_y_txf", 137, 202, 53, "0")
	editor.gui.properties.edit.actor.offset_z_txf = CreateTextField(editor.gui.properties.handle, "offset_z_txf", 194, 202, 53, "0")

	editor.gui.properties.edit.actor.mass_txf = CreateTextField(editor.gui.properties.handle, "mass_txf", 80, 224, 168, "0")
	editor.gui.properties.edit.actor.lin_damp_txf = CreateTextField(editor.gui.properties.handle, "lin_damp_txf", 80, 246, 168, "0")
	editor.gui.properties.edit.actor.ang_damp_txf = CreateTextField(editor.gui.properties.handle, "ang_damp_txf", 80, 268, 168, "0")
	editor.gui.properties.edit.actor.lin_sleep_txf = CreateTextField(editor.gui.properties.handle, "lin_sleep_txf", 80, 290, 168, "0")
	editor.gui.properties.edit.actor.ang_sleep_txf = CreateTextField(editor.gui.properties.handle, "ang_sleep_txf", 80, 312, 168, "0")
	editor.gui.properties.edit.actor.restitu_txf = CreateTextField(editor.gui.properties.handle, "restitu_txf", 80, 334, 168, "0")

	editor.gui.properties.edit.actor.anis_fric_x_txf = CreateTextField(editor.gui.properties.handle, "anis_fric_x_txf", 80, 356, 53, "0")
	editor.gui.properties.edit.actor.anis_fric_y_txf = CreateTextField(editor.gui.properties.handle, "anis_fric_y_txf", 137, 356, 53, "0")
	editor.gui.properties.edit.actor.anis_fric_z_txf = CreateTextField(editor.gui.properties.handle, "anis_fric_z_txf", 194, 356, 53, "0")

	editor.gui.properties.edit.actor.lin_factor_x_txf = CreateTextField(editor.gui.properties.handle, "lin_factor_z_txf", 80, 378, 53, "0")
	editor.gui.properties.edit.actor.lin_factor_y_txf = CreateTextField(editor.gui.properties.handle, "lin_factor_y_txf", 137, 378, 53, "0")
	editor.gui.properties.edit.actor.lin_factor_z_txf = CreateTextField(editor.gui.properties.handle, "lin_factor_z_txf", 194, 378, 53, "0")

	editor.gui.properties.edit.actor.ang_factor_x_txf = CreateTextField(editor.gui.properties.handle, "ang_factor_x_txf", 80, 400, 53, "0")
	editor.gui.properties.edit.actor.ang_factor_y_txf = CreateTextField(editor.gui.properties.handle, "ang_factor_y_txf", 137, 400, 53, "0")
	editor.gui.properties.edit.actor.ang_factor_z_txf = CreateTextField(editor.gui.properties.handle, "ang_factor_z_txf", 194, 400, 53, "0")

	editor.gui.properties.edit.actor.shape = CreateTextList(editor.gui.properties.handle, "file_list", 77, 424, 4, 157)
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Box")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Sphere")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Triangle Mesh")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule X")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule Y")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Capsule Z")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone X")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone Y")
	AddTextListItem(editor.gui.properties.edit.actor.shape, " Cone Z")
	AddGuiObject(editor.gui.properties.handle, editor.gui.properties.edit.actor.shape)

	editor.gui.properties.edit.actor.shape_sb = CreateSlider(editor.gui.properties.handle, "scroll_bar", 238, 428, 0, 54, 1.0)

	-- setup the light properties

	editor.gui.properties.edit.light = {}

	editor.gui.properties.edit.light.type_lab = CreateLabel(editor.gui.properties.handle, "type_lab", 4, 50, "Type")
	editor.gui.properties.edit.light.color_lab = CreateLabel(editor.gui.properties.handle, "color_lab", 4, 101, "Color")
	editor.gui.properties.edit.light.distance_lab = CreateLabel(editor.gui.properties.handle, "distance_lab", 4, 123, "Distance")
	editor.gui.properties.edit.light.fade_speed_lab = CreateLabel(editor.gui.properties.handle, "fade_speed_lab", 4, 145, "Fade Speed")
	editor.gui.properties.edit.light.spot_cone_lab = CreateLabel(editor.gui.properties.handle, "spot_cone_lab", 4, 167, "Spot Cone")
	editor.gui.properties.edit.light.shadows_lab = CreateLabel(editor.gui.properties.handle, "shadows_lab", 4, 189, "Shadows")
	editor.gui.properties.edit.light.ls_enabled_lab = CreateLabel(editor.gui.properties.handle, "ls_enabled_lab", 4, 226, "Shafts")
	editor.gui.properties.edit.light.size_lab = CreateLabel(editor.gui.properties.handle, "size_lab", 4, 248, "Size")
	editor.gui.properties.edit.light.intensity_lab = CreateLabel(editor.gui.properties.handle, "intensity_lab", 4, 270, "Intensity")
	editor.gui.properties.edit.light.fadeoff_lab = CreateLabel(editor.gui.properties.handle, "fadeoff_lab", 4, 292, "Fadeoff")

	SetGuiObjectColor(editor.gui.properties.edit.light.type_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.color_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.distance_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.fade_speed_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.spot_cone_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.shadows_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.ls_enabled_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.size_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.intensity_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.light.fadeoff_lab, 1.0, 1.0, 1.0, 0.6)

	editor.gui.properties.edit.light.type_txl = CreateTextList(editor.gui.properties.handle, "type_list", 50, 48, 3, 202)
	AddTextListItem(editor.gui.properties.edit.light.type_txl, " Point")
	AddTextListItem(editor.gui.properties.edit.light.type_txl, " Sun")
	AddTextListItem(editor.gui.properties.edit.light.type_txl, " Spot")

	editor.gui.properties.edit.light.color_r_txf = CreateTextField(editor.gui.properties.handle, "color_r_txf", 80, 97, 53, "0")
	editor.gui.properties.edit.light.color_g_txf = CreateTextField(editor.gui.properties.handle, "color_g_txf", 137, 97, 53, "0")
	editor.gui.properties.edit.light.color_b_txf = CreateTextField(editor.gui.properties.handle, "color_b_txf", 194, 97, 53, "0")

	editor.gui.properties.edit.light.distance_txf = CreateTextField(editor.gui.properties.handle, "distance_txf", 80, 119, 168, "0")
	editor.gui.properties.edit.light.fade_speed_txf = CreateTextField(editor.gui.properties.handle, "fade_speed_txf", 86, 141, 162, "0")

	editor.gui.properties.edit.light.inner_cone_txf = CreateTextField(editor.gui.properties.handle, "inner_cone_txf", 80, 163, 82, "0")
	editor.gui.properties.edit.light.outer_cone_txf = CreateTextField(editor.gui.properties.handle, "outer_cone_txf", 166, 163, 82, "0")

	editor.gui.properties.edit.light.shadows_cb = CreateCheckBox(editor.gui.properties.handle, "shadows_cb", 80, 187, false)

	editor.gui.properties.edit.light.ls_enabled_cb = CreateCheckBox(editor.gui.properties.handle, "ls_enabled_cb", 80, 224, false)
	editor.gui.properties.edit.light.size_txf = CreateTextField(editor.gui.properties.handle, "size_txf", 80, 244, 168, "0")
	editor.gui.properties.edit.light.intensity_txf = CreateTextField(editor.gui.properties.handle, "intensity_txf", 80, 266, 168, "0")
	editor.gui.properties.edit.light.fade_off_txf = CreateTextField(editor.gui.properties.handle, "fade_off_txf", 80, 288, 168, "0")

	-- setup the camera properties

	editor.gui.properties.edit.camera = {}

	editor.gui.properties.edit.camera.fov_lab = CreateLabel(editor.gui.properties.handle, "fov_lab", 4, 52, "Fov")
	editor.gui.properties.edit.camera.clip_lab = CreateLabel(editor.gui.properties.handle, "clip_lab", 4, 74, "Clip")
	editor.gui.properties.edit.camera.fov_txf = CreateTextField(editor.gui.properties.handle, "fov_txf", 80, 48, 168, "0")
	editor.gui.properties.edit.camera.clip_near_txf = CreateTextField(editor.gui.properties.handle, "clip_near_txf", 80, 70, 83, "0")
	editor.gui.properties.edit.camera.clip_far_txf = CreateTextField(editor.gui.properties.handle, "clip_far_txf", 166, 70, 83, "0")
	editor.gui.properties.edit.camera.copy_but = CreateButton(editor.gui.properties.handle, "copy_but", 4, 92, 248, 18, "Copy To View")

	SetGuiObjectColor(editor.gui.properties.edit.camera.fov_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.camera.clip_lab, 1.0, 1.0, 1.0, 0.6)

	-- setup the entity properties

	editor.gui.properties.edit.entity = {}

	editor.gui.properties.edit.entity.model_lab = CreateLabel(editor.gui.properties.handle, "model_lab", 4, 53, "Model")
	editor.gui.properties.edit.entity.scale_lab = CreateLabel(editor.gui.properties.handle, "scale_lab", 4, 74, "Scale")
	editor.gui.properties.edit.entity.mat_name_lab = CreateLabel(editor.gui.properties.handle, "mat_name_lab", 4, 264, "Name")
	editor.gui.properties.edit.entity.mat_diffuse_lab = CreateLabel(editor.gui.properties.handle, "mat_diffuse_lab", 4, 286, "Diffuse")
	editor.gui.properties.edit.entity.mat_specular_lab = CreateLabel(editor.gui.properties.handle, "mat_specular_lab", 4, 330, "Specular")
	editor.gui.properties.edit.entity.mat_ambient_lab = CreateLabel(editor.gui.properties.handle, "mat_ambient_lab", 4, 352, "Ambient")
	editor.gui.properties.edit.entity.mat_spec_power_lab = CreateLabel(editor.gui.properties.handle, "mat_spec_power_lab", 4, 374, "Shininess")
	editor.gui.properties.edit.entity.mat_lighting_lab = CreateLabel(editor.gui.properties.handle, "mat_lighting_lab", 4, 396, "Lighting")
	editor.gui.properties.edit.entity.mat_prlx_scale_lab = CreateLabel(editor.gui.properties.handle, "prlx_scale_lab", 4, 418, "Prlx Scale")
	editor.gui.properties.edit.entity.mat_alpha_test_lab = CreateLabel(editor.gui.properties.handle, "alpha_test_lab", 4, 440, "Alpha Test")
	editor.gui.properties.edit.entity.mat_alpha_thrs_lab = CreateLabel(editor.gui.properties.handle, "alpha_thrs_lab", 4, 462, "Alpha Thrs")
	editor.gui.properties.edit.entity.mat_diffuse_map_lab = CreateLabel(editor.gui.properties.handle, "diffuse_map_lab", 4, 484, "Diffu. Map")
	editor.gui.properties.edit.entity.mat_normal_map_lab = CreateLabel(editor.gui.properties.handle, "normal_map_lab", 4, 506, "Normal Map")
	editor.gui.properties.edit.entity.mat_height_map_lab = CreateLabel(editor.gui.properties.handle, "height_map_lab", 4, 528, "Height Map")
	editor.gui.properties.edit.entity.mat_spec_map_lab = CreateLabel(editor.gui.properties.handle, "spec_map_lab", 4, 550, "Spec Map")
	editor.gui.properties.edit.entity.mat_light_map_lab = CreateLabel(editor.gui.properties.handle, "light_map_lab", 4, 572, "Light Map")

	SetGuiObjectColor(editor.gui.properties.edit.entity.model_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.scale_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_name_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_diffuse_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_specular_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_ambient_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_spec_power_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_lighting_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_prlx_scale_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_alpha_test_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_alpha_thrs_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_diffuse_map_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_normal_map_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_height_map_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_spec_map_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.entity.mat_light_map_lab, 1.0, 1.0, 1.0, 0.6)

	editor.gui.properties.edit.entity.model_txf = CreateTextField(editor.gui.properties.handle, "model_txf", 80, 48, 168, "")

	editor.gui.properties.edit.entity.scale_x_txf = CreateTextField(editor.gui.properties.handle, "scale_x_txf", 80, 70, 53, "0")
	editor.gui.properties.edit.entity.scale_y_txf = CreateTextField(editor.gui.properties.handle, "scale_y_txf", 137, 70, 53, "0")
	editor.gui.properties.edit.entity.scale_z_txf = CreateTextField(editor.gui.properties.handle, "scale_z_txf", 194, 70, 53, "0")

	editor.gui.properties.edit.entity.add_material_but = CreateButton(editor.gui.properties.handle, "add_material_but", 4, 114, 248, 18, "Add Material")
	editor.gui.properties.edit.entity.replace_material_but = CreateButton(editor.gui.properties.handle, "replace_material_but", 4, 136, 248, 18, "Replace Material")
	editor.gui.properties.edit.entity.remove_material_but = CreateButton(editor.gui.properties.handle, "remove_material_but", 4, 158, 248, 18, "Remove Material")

	editor.gui.properties.edit.entity.materials_txl = CreateTextList(editor.gui.properties.handle, "materials_txl", 4, 180, 5, 238)
	AddTextListItem(editor.gui.properties.edit.entity.materials_txl, " Empty 1")
	AddTextListItem(editor.gui.properties.edit.entity.materials_txl, " Empty 2")
	AddTextListItem(editor.gui.properties.edit.entity.materials_txl, " Empty 3")
	AddTextListItem(editor.gui.properties.edit.entity.materials_txl, " Empty 4")

	editor.gui.properties.edit.entity.materials_sb = CreateSlider(editor.gui.properties.handle, "scroll_bar", 246, 184, 0, 68, 1.0)

	editor.gui.properties.edit.entity.mat_name_txf = CreateTextField(editor.gui.properties.handle, "mat_name_txf", 80, 260, 168, "")

	editor.gui.properties.edit.entity.mat_diffuse_r_txf = CreateTextField(editor.gui.properties.handle, "mat_diffuse_r_txf", 4, 304, 58, "0")
	editor.gui.properties.edit.entity.mat_diffuse_g_txf = CreateTextField(editor.gui.properties.handle, "mat_diffuse_g_txf", 66, 304, 58, "0")
	editor.gui.properties.edit.entity.mat_diffuse_b_txf = CreateTextField(editor.gui.properties.handle, "mat_diffuse_b_txf", 128, 304, 58, "0")
	editor.gui.properties.edit.entity.mat_diffuse_a_txf = CreateTextField(editor.gui.properties.handle, "mat_diffuse_a_txf", 190, 304, 58, "0")

	editor.gui.properties.edit.entity.mat_specular_r_txf = CreateTextField(editor.gui.properties.handle, "mat_specular_r_txf", 80, 326, 53, "0")
	editor.gui.properties.edit.entity.mat_specular_g_txf = CreateTextField(editor.gui.properties.handle, "mat_specular_g_txf", 137, 326, 53, "0")
	editor.gui.properties.edit.entity.mat_specular_b_txf = CreateTextField(editor.gui.properties.handle, "mat_specular_b_txf", 194, 326, 53, "0")

	editor.gui.properties.edit.entity.mat_ambient_r_txf = CreateTextField(editor.gui.properties.handle, "mat_ambient_r_txf", 80, 348, 53, "0")
	editor.gui.properties.edit.entity.mat_ambient_g_txf = CreateTextField(editor.gui.properties.handle, "mat_ambient_g_txf", 137, 348, 53, "0")
	editor.gui.properties.edit.entity.mat_ambient_b_txf = CreateTextField(editor.gui.properties.handle, "mat_ambient_b_txf", 194, 348, 53, "0")

	editor.gui.properties.edit.entity.mat_spec_power_txf = CreateTextField(editor.gui.properties.handle, "mat_spec_power_txf", 80, 370, 168, "0")

	editor.gui.properties.edit.entity.mat_lighting_cb = CreateCheckBox(editor.gui.properties.handle, "mat_lighting_cb", 80, 395, false)

	editor.gui.properties.edit.entity.mat_prlx_scale_txf = CreateTextField(editor.gui.properties.handle, "mat_prlx_scale_txf", 80, 414, 168, "0")
	editor.gui.properties.edit.entity.mat_alpha_test_cb = CreateCheckBox(editor.gui.properties.handle, "mat_alpha_test_cb", 80, 439, false)
	editor.gui.properties.edit.entity.mat_alpha_thrs_txf = CreateTextField(editor.gui.properties.handle, "mat_alpha_thrs_txf", 80, 458, 168, "0")

	editor.gui.properties.edit.entity.mat_diffuse_map_txf = CreateTextField(editor.gui.properties.handle, "mat_diffuse_map_txf", 80, 480, 147, "")
	editor.gui.properties.edit.entity.mat_normal_map_txf = CreateTextField(editor.gui.properties.handle, "mat_normal_map_txf", 80, 502, 147, "")
	editor.gui.properties.edit.entity.mat_height_map_txf = CreateTextField(editor.gui.properties.handle, "mat_height_map_txf", 80, 524, 147, "")
	editor.gui.properties.edit.entity.mat_spec_map_txf = CreateTextField(editor.gui.properties.handle, "mat_spec_map_txf", 80, 546, 147, "")
	editor.gui.properties.edit.entity.mat_light_map_txf = CreateTextField(editor.gui.properties.handle, "mat_light_map_txf", 80, 568, 147, "")

	editor.gui.properties.edit.entity.mat_diffuse_map_open = CreateButton(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 480, 18, 18, "...")
	editor.gui.properties.edit.entity.mat_normal_map_open = CreateButton(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 502, 18, 18, "...")
	editor.gui.properties.edit.entity.mat_height_map_open = CreateButton(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 524, 18, 18, "...")
	editor.gui.properties.edit.entity.mat_spec_map_open = CreateButton(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 546, 18, 18, "...")
	editor.gui.properties.edit.entity.mat_light_map_open = CreateButton(editor.gui.properties.handle, "mat_diffuse_map_open", 231, 568, 18, 18, "...")

	-- setup the particles properties

	editor.gui.properties.edit.particles = {}

	editor.gui.properties.edit.particles.max_count_lab = CreateLabel(editor.gui.properties.handle, "max_count_lab", 4, 52, "Max Count")
	editor.gui.properties.edit.particles.draw_mode_lab = CreateLabel(editor.gui.properties.handle, "draw_mode_lab", 4, 74, "Draw Mode")
	editor.gui.properties.edit.particles.texture_lab = CreateLabel(editor.gui.properties.handle, "texture_lab", 4, 96, "Texture")
	editor.gui.properties.edit.particles.model_lab = CreateLabel(editor.gui.properties.handle, "model_lab", 4, 118, "Model")
	editor.gui.properties.edit.particles.entity_lab = CreateLabel(editor.gui.properties.handle, "entity_lab", 4, 140, "Entity")
	editor.gui.properties.edit.particles.gravity_lab = CreateLabel(editor.gui.properties.handle, "gravity_lab", 4, 162, "Gravity")
	editor.gui.properties.edit.particles.spawn_delay_lab = CreateLabel(editor.gui.properties.handle, "spawn_delay_lab", 4, 184, "Spn Delay")
	editor.gui.properties.edit.particles.spawn_lab = CreateLabel(editor.gui.properties.handle, "spawn_lab", 4, 206, "Spawn")

	editor.gui.properties.edit.particles.size_lab = CreateLabel(editor.gui.properties.handle, "size_lab", 4, 228, "Size")
	editor.gui.properties.edit.particles.size_grow_lab = CreateLabel(editor.gui.properties.handle, "size_grow_lab", 4, 250, "Size Grow")
	editor.gui.properties.edit.particles.rotation_lab = CreateLabel(editor.gui.properties.handle, "rotation_lab", 4, 272, "Rotation")
	editor.gui.properties.edit.particles.rot_grow_lab = CreateLabel(editor.gui.properties.handle, "rot_grow_lab", 4, 294, "Rot. Grow")
	editor.gui.properties.edit.particles.life_span_lab = CreateLabel(editor.gui.properties.handle, "life_span_lab", 4, 316, "Life Span")
	editor.gui.properties.edit.particles.fade_speed_lab = CreateLabel(editor.gui.properties.handle, "fade_speed_lab", 4, 338, "Fade Speed")
	editor.gui.properties.edit.particles.pos_min_lab = CreateLabel(editor.gui.properties.handle, "pos_min_lab", 4, 360, "Pos. Min")
	editor.gui.properties.edit.particles.pos_max_lab = CreateLabel(editor.gui.properties.handle, "pos_max_lab", 4, 382, "Pos. Max")
	editor.gui.properties.edit.particles.vel_min_lab = CreateLabel(editor.gui.properties.handle, "vel_min_lab", 4, 404, "Vel. Min")
	editor.gui.properties.edit.particles.vel_max_lab = CreateLabel(editor.gui.properties.handle, "vel_max_lab", 4, 426, "Vel. Max")
	editor.gui.properties.edit.particles.color_min_lab = CreateLabel(editor.gui.properties.handle, "color_min_lab", 4, 448, "Color Min")
	editor.gui.properties.edit.particles.color_max_lab = CreateLabel(editor.gui.properties.handle, "color_max_lab", 4, 492, "Color Max")

	SetGuiObjectColor(editor.gui.properties.edit.particles.max_count_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.draw_mode_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.texture_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.model_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.entity_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.gravity_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.spawn_delay_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.spawn_lab, 1.0, 1.0, 1.0, 0.6)

	SetGuiObjectColor(editor.gui.properties.edit.particles.size_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.size_grow_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.rotation_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.rot_grow_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.life_span_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.fade_speed_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.pos_min_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.pos_max_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.vel_min_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.vel_max_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.color_min_lab, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.edit.particles.color_max_lab, 1.0, 1.0, 1.0, 0.6)

	editor.gui.properties.edit.particles.max_count_txf = CreateTextField(editor.gui.properties.handle, "max_count_txf", 80, 48, 168, "0")
	editor.gui.properties.edit.particles.trs_cb = CreateButton(editor.gui.properties.handle, "trs_cb", 80, 70, 82, 18, "Transparent")
	editor.gui.properties.edit.particles.add_cb = CreateButton(editor.gui.properties.handle, "add_cb", 166, 70, 82, 18, "Additive")
	editor.gui.properties.edit.particles.texture_txf = CreateTextField(editor.gui.properties.handle, "texture_txf", 80, 92, 147, "")
	editor.gui.properties.edit.particles.texture_open = CreateButton(editor.gui.properties.handle, "texture_open", 231, 92, 18, 18, "...")
	editor.gui.properties.edit.particles.model_txf = CreateTextField(editor.gui.properties.handle, "model_txf", 80, 114, 168, "")
	editor.gui.properties.edit.particles.entity_txf = CreateTextField(editor.gui.properties.handle, "entity_txf", 80, 136, 168, "")

	editor.gui.properties.edit.particles.gravity_x_txf = CreateTextField(editor.gui.properties.handle, "gravity_x_txf", 80, 158, 53, "0")
	editor.gui.properties.edit.particles.gravity_y_txf = CreateTextField(editor.gui.properties.handle, "gravity_y_txf", 137, 158, 53, "0")
	editor.gui.properties.edit.particles.gravity_z_txf = CreateTextField(editor.gui.properties.handle, "gravity_z_txf", 194, 158, 53, "0")

	editor.gui.properties.edit.particles.spawn_delay_txf = CreateTextField(editor.gui.properties.handle, "spawn_delay_txf", 80, 180, 168, "0")
	editor.gui.properties.edit.particles.spawn_cb = CreateCheckBox(editor.gui.properties.handle, "spawn_cb", 80, 205, false)

	editor.gui.properties.edit.particles.size_min_txf = CreateTextField(editor.gui.properties.handle, "size_min_txf", 80, 224, 82, "0")
	editor.gui.properties.edit.particles.size_max_txf = CreateTextField(editor.gui.properties.handle, "size_max_txf", 166, 224, 82, "0")

	editor.gui.properties.edit.particles.size_grow_min_txf = CreateTextField(editor.gui.properties.handle, "size_grow_min_txf", 80, 246, 82, "0")
	editor.gui.properties.edit.particles.size_grow_max_txf = CreateTextField(editor.gui.properties.handle, "size_grow_max_txf", 166, 246, 82, "0")

	editor.gui.properties.edit.particles.rotation_min_txf = CreateTextField(editor.gui.properties.handle, "rotation_min_txf", 80, 268, 82, "0")
	editor.gui.properties.edit.particles.rotation_max_txf = CreateTextField(editor.gui.properties.handle, "rotation_max_txf", 166, 268, 82, "0")

	editor.gui.properties.edit.particles.rot_grow_min_txf = CreateTextField(editor.gui.properties.handle, "rot_grow_min_txf", 80, 290, 82, "0")
	editor.gui.properties.edit.particles.rot_grow_max_txf = CreateTextField(editor.gui.properties.handle, "rot_grow_max_txf", 166, 290, 82, "0")

	editor.gui.properties.edit.particles.life_span_min_txf = CreateTextField(editor.gui.properties.handle, "life_span_min_txf", 80, 312, 82, "0")
	editor.gui.properties.edit.particles.life_span_max_txf = CreateTextField(editor.gui.properties.handle, "life_span_max_txf", 166, 312, 82, "0")

	editor.gui.properties.edit.particles.fade_speed_min_txf = CreateTextField(editor.gui.properties.handle, "fade_speed_min_txf", 80, 334, 82, "0")
	editor.gui.properties.edit.particles.fade_speed_max_txf = CreateTextField(editor.gui.properties.handle, "fade_speed_max_txf", 166, 334, 82, "0")

	editor.gui.properties.edit.particles.pos_min_x_txf = CreateTextField(editor.gui.properties.handle, "pos_min_txf", 80, 356, 53, "0")
	editor.gui.properties.edit.particles.pos_min_y_txf = CreateTextField(editor.gui.properties.handle, "pos_min_txf", 137, 356, 53, "0")
	editor.gui.properties.edit.particles.pos_min_z_txf = CreateTextField(editor.gui.properties.handle, "pos_min_txf", 194, 356, 53, "0")

	editor.gui.properties.edit.particles.pos_max_x_txf = CreateTextField(editor.gui.properties.handle, "pos_max_txf", 80, 378, 53, "0")
	editor.gui.properties.edit.particles.pos_max_y_txf = CreateTextField(editor.gui.properties.handle, "pos_max_txf", 137, 378, 53, "0")
	editor.gui.properties.edit.particles.pos_max_z_txf = CreateTextField(editor.gui.properties.handle, "pos_max_txf", 194, 378, 53, "0")

	editor.gui.properties.edit.particles.vel_min_x_txf = CreateTextField(editor.gui.properties.handle, "vel_min_txf", 80, 400, 53, "0")
	editor.gui.properties.edit.particles.vel_min_y_txf = CreateTextField(editor.gui.properties.handle, "vel_min_txf", 137, 400, 53, "0")
	editor.gui.properties.edit.particles.vel_min_z_txf = CreateTextField(editor.gui.properties.handle, "vel_min_txf", 194, 400, 53, "0")

	editor.gui.properties.edit.particles.vel_max_x_txf = CreateTextField(editor.gui.properties.handle, "vel_max_txf", 80, 422, 53, "0")
	editor.gui.properties.edit.particles.vel_max_y_txf = CreateTextField(editor.gui.properties.handle, "vel_max_txf", 137, 422, 53, "0")
	editor.gui.properties.edit.particles.vel_max_z_txf = CreateTextField(editor.gui.properties.handle, "vel_max_txf", 194, 422, 53, "0")

	editor.gui.properties.edit.particles.color_min_r_txf = CreateTextField(editor.gui.properties.handle, "color_min_r_txf", 4, 466, 58, "0")
	editor.gui.properties.edit.particles.color_min_g_txf = CreateTextField(editor.gui.properties.handle, "color_min_g_txf", 66, 466, 58, "0")
	editor.gui.properties.edit.particles.color_min_b_txf = CreateTextField(editor.gui.properties.handle, "color_min_b_txf", 128, 466, 58, "0")
	editor.gui.properties.edit.particles.color_min_a_txf = CreateTextField(editor.gui.properties.handle, "color_min_a_txf", 190, 466, 58, "0")

	editor.gui.properties.edit.particles.color_max_r_txf = CreateTextField(editor.gui.properties.handle, "color_max_r_txf", 4, 510, 58, "0")
	editor.gui.properties.edit.particles.color_max_g_txf = CreateTextField(editor.gui.properties.handle, "color_max_g_txf", 66, 510, 58, "0")
	editor.gui.properties.edit.particles.color_max_b_txf = CreateTextField(editor.gui.properties.handle, "color_max_b_txf", 128, 510, 58, "0")
	editor.gui.properties.edit.particles.color_max_a_txf = CreateTextField(editor.gui.properties.handle, "color_max_a_txf", 190, 510, 58, "0")

	-- setup the sprite properties

	editor.gui.properties.edit.sprite = {}

	-- setup the post processing tab

	editor.gui.properties.pp = {}

	-- setup the bloom settings

	editor.gui.properties.pp.bloom_enb = CreateLabel(editor.gui.properties.handle, "bloom_enb", 4, 32, "Bloom")
	editor.gui.properties.pp.bloom_str = CreateLabel(editor.gui.properties.handle, "bloom_thr", 4, 52, "Threshold")
	editor.gui.properties.pp.bloom_cb = CreateCheckBox(editor.gui.properties.handle, "bloom_cb", 100, 30, false)
	editor.gui.properties.pp.bloom_str_sli = CreateSlider(editor.gui.properties.handle, "bloom_str_sli", 100, 55, 148, 0, 0.5)

	SetGuiObjectColor(editor.gui.properties.pp.bloom_enb, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.pp.bloom_str, 1.0, 1.0, 1.0, 0.6)

	-- setup the DOF settings

	editor.gui.properties.pp.dof_enb = CreateLabel(editor.gui.properties.handle, "dof_enb", 4, 85, "Dof")
	editor.gui.properties.pp.dof_foc_rng = CreateLabel(editor.gui.properties.handle, "dof_foc_rng", 4, 107, "Focal Range")
	editor.gui.properties.pp.dof_foc_dst = CreateLabel(editor.gui.properties.handle, "dof_foc_dst", 4, 129, "Focal Dist")
	editor.gui.properties.pp.dof_enb_cb = CreateCheckBox(editor.gui.properties.handle, "dof_enb_cb", 100, 83, false)
	editor.gui.properties.pp.dof_foc_rng_txf = CreateTextField(editor.gui.properties.handle, "dof_foc_rng_txf", 100, 102, 148, "7.5")
	editor.gui.properties.pp.dof_foc_dst_txf = CreateTextField(editor.gui.properties.handle, "dof_foc_dst_txf", 100, 124, 148, "15")

	SetGuiObjectColor(editor.gui.properties.pp.dof_enb, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.pp.dof_foc_rng, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.pp.dof_foc_dst, 1.0, 1.0, 1.0, 0.6)

	-- setup the light shaft settings

	editor.gui.properties.pp.lsh_enb = CreateLabel(editor.gui.properties.handle, "lsh_enb", 4, 163, "Light Shafts")
	editor.gui.properties.pp.lsh_str = CreateLabel(editor.gui.properties.handle, "lsh_str", 4, 185, "Strength")
	editor.gui.properties.pp.lsh_enb_cb = CreateCheckBox(editor.gui.properties.handle, "lsh_enb_cb", 100, 161, false)
	editor.gui.properties.pp.lsh_str_sli = CreateSlider(editor.gui.properties.handle, "lsh_str_sli", 100, 188, 148, 0, 1.0)

	SetGuiObjectColor(editor.gui.properties.pp.lsh_enb, 1.0, 1.0, 1.0, 0.6)
	SetGuiObjectColor(editor.gui.properties.pp.lsh_str, 1.0, 1.0, 1.0, 0.6)

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
		for k, v in pairs(editor.gui.properties.edit.actor) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_CAMERA then
		for k, v in pairs(editor.gui.properties.edit.camera) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_LIGHT then
		for k, v in pairs(editor.gui.properties.edit.light) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_ENTITY then
		for k, v in pairs(editor.gui.properties.edit.entity) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_PARTICLES then
		for k, v in pairs(editor.gui.properties.edit.particles) do SetGuiObjectVisible(v, false) end
	end
	if tab == EDI_EDIT_SPRITE then
		for k, v in pairs(editor.gui.properties.edit.sprite) do SetGuiObjectVisible(v, false) end
	end
end

function edi_show_edit_tab(tab)
	if tab == EDI_EDIT_ACTOR then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.actor) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_CAMERA then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.camera) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_LIGHT then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.light) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_ENTITY then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.entity) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_PARTICLES then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.particles) do SetGuiObjectVisible(v, true) end
		end
	elseif tab == EDI_EDIT_SPRITE then
		if editor.scene.selection ~= nil then
			for k, v in pairs(editor.gui.properties.edit.sprite) do SetGuiObjectVisible(v, true) end
		end
	end

	if editor.scene.selection ~= nil then
		if GetObjectType(editor.scene.selection) == CAMERA then
			SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, true)
			SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		elseif GetObjectType(editor.scene.selection) == LIGHT then
			SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, true)
			SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		elseif GetObjectType(editor.scene.selection) == ENTITY then
			SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, true)
			SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		elseif GetObjectType(editor.scene.selection) == PARTICLES then
			SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.par_cb, true)
			SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		elseif GetObjectType(editor.scene.selection) == SPRITE then
			SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
			SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, true)
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
		for k, v in pairs(editor.gui.properties.menu) do SetGuiObjectVisible(v, false) end
	elseif tab == EDI_PROPERTIES_EDIT then
		SetGuiObjectVisible(editor.gui.properties.edit.act_cb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.cam_cb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.lig_cb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.ent_cb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.par_cb, false)
		SetGuiObjectVisible(editor.gui.properties.edit.spr_cb, false)
		edi_hide_edit_tab(editor.gui.properties.edit.current_tab)
	elseif tab == EDI_PROPERTIES_PP then
		for k, v in pairs(editor.gui.properties.pp) do SetGuiObjectVisible(v, false) end
	end
end

function edi_show_properties_tab(tab)
	if tab == EDI_PROPERTIES_MENU then
		for k, v in pairs(editor.gui.properties.menu) do SetGuiObjectVisible(v, true) end
	elseif tab == EDI_PROPERTIES_EDIT then
		SetGuiObjectVisible(editor.gui.properties.edit.act_cb, true)
		edi_switch_edit_tab(EDI_EDIT_ACTOR)
	elseif tab == EDI_PROPERTIES_PP then
		for k, v in pairs(editor.gui.properties.pp) do SetGuiObjectVisible(v, true) end
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

	SetGuiObjectVisible(editor.gui.properties.handle, true)
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

	SetTextFieldText(editor.gui.properties.edit.actor.name_txf, GetActorName(editor.scene.selection))
	local pos = GetActorPosition(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.pos_x_txf, tostring(pos.x))
	SetTextFieldText(editor.gui.properties.edit.actor.pos_y_txf, tostring(pos.y))
	SetTextFieldText(editor.gui.properties.edit.actor.pos_z_txf, tostring(pos.z))
	local rot = GetActorRotation(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.rot_x_txf, tostring(rot.x))
	SetTextFieldText(editor.gui.properties.edit.actor.rot_y_txf, tostring(rot.y))
	SetTextFieldText(editor.gui.properties.edit.actor.rot_z_txf, tostring(rot.z))
	local scr = GetActorScript(editor.scene.selection)
	if scr ~= nil then
		SetTextFieldText(editor.gui.properties.edit.actor.script_txf, GetScriptName(scr))
	else
		SetTextFieldText(editor.gui.properties.edit.actor.script_txf, "")
	end

	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.name_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_x_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_y_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.pos_z_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_x_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_y_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.rot_z_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.script_txf, 0)

	if IsActorPhysics(editor.scene.selection) == true then
		SetCheckBoxState(editor.gui.properties.edit.actor.physics_enb_cb, true)
	else
		SetCheckBoxState(editor.gui.properties.edit.actor.physics_enb_cb, false)
	end

	local lengths = GetActorBoundingLengths(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.lengths_x_txf, tostring(lengths.x))
	SetTextFieldText(editor.gui.properties.edit.actor.lengths_y_txf, tostring(lengths.y))
	SetTextFieldText(editor.gui.properties.edit.actor.lengths_z_txf, tostring(lengths.z))
	local offset = GetActorBoundingOffset(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.offset_x_txf, tostring(offset.x))
	SetTextFieldText(editor.gui.properties.edit.actor.offset_y_txf, tostring(offset.y))
	SetTextFieldText(editor.gui.properties.edit.actor.offset_z_txf, tostring(offset.z))
	SetTextFieldText(editor.gui.properties.edit.actor.mass_txf, tostring(GetActorMass(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.lin_damp_txf, tostring(GetActorLinearDamping(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.ang_damp_txf, tostring(GetActorAngularDamping(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.lin_sleep_txf, tostring(GetActorLinearSleepThreshold(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.ang_sleep_txf, tostring(GetActorAngularSleepThreshold(editor.scene.selection)))
	SetTextFieldText(editor.gui.properties.edit.actor.restitu_txf, tostring(GetActorRestitution(editor.scene.selection)))
	local anis_fric = GetActorAnisotropicFriction(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.anis_fric_x_txf, tostring(anis_fric.x))
	SetTextFieldText(editor.gui.properties.edit.actor.anis_fric_y_txf, tostring(anis_fric.y))
	SetTextFieldText(editor.gui.properties.edit.actor.anis_fric_z_txf, tostring(anis_fric.z))
	local lin_factor = GetActorLinearFactor(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.lin_factor_x_txf, tostring(lin_factor.x))
	SetTextFieldText(editor.gui.properties.edit.actor.lin_factor_y_txf, tostring(lin_factor.y))
	SetTextFieldText(editor.gui.properties.edit.actor.lin_factor_z_txf, tostring(lin_factor.z))
	local ang_factor = GetActorAngularFactor(editor.scene.selection)
	SetTextFieldText(editor.gui.properties.edit.actor.ang_factor_x_txf, tostring(ang_factor.x))
	SetTextFieldText(editor.gui.properties.edit.actor.ang_factor_y_txf, tostring(ang_factor.y))
	SetTextFieldText(editor.gui.properties.edit.actor.ang_factor_z_txf, tostring(ang_factor.z))
	SetTextListSelection(editor.gui.properties.edit.actor.shape, GetActorShape(editor.scene.selection)-1)

	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengths_x_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengths_y_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lengths_z_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offset_x_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offset_y_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.offset_z_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.mass_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_damp_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_damp_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_sleep_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_sleep_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.restitu_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anis_fric_x_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anis_fric_y_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.anis_fric_z_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_factor_x_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_factor_y_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.lin_factor_z_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_factor_x_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_factor_y_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.actor.ang_factor_z_txf, 0)

	if GetObjectType(editor.scene.selection) == CAMERA then
		SetTextFieldText(editor.gui.properties.edit.camera.fov_txf, GetCameraFov(editor.scene.selection))
		local clip = GetCameraClip(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.camera.clip_near_txf, clip.x)
		SetTextFieldText(editor.gui.properties.edit.camera.clip_far_txf, clip.y)

		SetTextFieldCursorPosition(editor.gui.properties.edit.camera.fov_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.camera.clip_near_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.camera.clip_far_txf, 0)
	elseif GetObjectType(editor.scene.selection) == LIGHT then
		local color = GetLightColor(editor.scene.selection)
		SetTextListSelection(editor.gui.properties.edit.light.type_txl, GetLightType(editor.scene.selection)-1)

		SetTextFieldText(editor.gui.properties.edit.light.color_r_txf, color.r)
		SetTextFieldText(editor.gui.properties.edit.light.color_g_txf, color.g)
		SetTextFieldText(editor.gui.properties.edit.light.color_b_txf, color.b)

		SetTextFieldText(editor.gui.properties.edit.light.distance_txf, GetLightDistance(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.light.fade_speed_txf, GetLightFadeSpeed(editor.scene.selection))

		SetTextFieldText(editor.gui.properties.edit.light.inner_cone_txf, GetLightCone(editor.scene.selection).x)
		SetTextFieldText(editor.gui.properties.edit.light.outer_cone_txf, GetLightCone(editor.scene.selection).y)

		SetCheckBoxState(editor.gui.properties.edit.light.shadows_cb, GetLightShadows(editor.scene.selection))

		SetCheckBoxState(editor.gui.properties.edit.light.ls_enabled_cb, IsLightShaft(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.light.size_txf, GetLightShaftSize(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.light.intensity_txf, GetLightShaftIntensity(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.light.fade_off_txf, GetLightShaftFadeOff(editor.scene.selection))

		SetTextFieldCursorPosition(editor.gui.properties.edit.light.color_r_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.color_g_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.color_b_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.distance_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.fade_speed_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.inner_cone_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.outer_cone_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.size_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.intensity_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.light.fade_off_txf, 0)
	elseif GetObjectType(editor.scene.selection) == ENTITY then
		local mdl = GetEntityModel(editor.scene.selection)
		if mdl ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.model_txf, GetModelName(mdl))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.model_txf, "")
		end

		local scale = GetEntityScale(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.entity.scale_x_txf, scale.x)
		SetTextFieldText(editor.gui.properties.edit.entity.scale_y_txf, scale.y)
		SetTextFieldText(editor.gui.properties.edit.entity.scale_z_txf, scale.z)

		RemoveTextListItems(editor.gui.properties.edit.entity.materials_txl)
		for i=0, GetEntityMaterialCount(editor.scene.selection)-1 do
			local mat = GetEntityMaterial(editor.scene.selection, i)
			AddTextListItem(editor.gui.properties.edit.entity.materials_txl, GetMaterialName(mat))
		end

		if GetEntityMaterialCount(editor.scene.selection) > 0 then
			SetTextListSelection(editor.gui.properties.edit.entity.materials_txl, 0)
			editor.scene.material = GetEntityMaterial(editor.scene.selection, 0)
		else
			SetTextListSelection(editor.gui.properties.edit.entity.materials_txl, -1)
		end

		edi_update_edit_selection_material()

		SetTextFieldCursorPosition(editor.gui.properties.edit.entity.model_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.entity.scale_x_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.entity.scale_y_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.entity.scale_z_txf, 0)
	elseif GetObjectType(editor.scene.selection) == PARTICLES then
		SetTextFieldText(editor.gui.properties.edit.particles.max_count_txf, GetParticlesMaxCount(editor.scene.selection))

		local tex = GetParticlesTexture(editor.scene.selection)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.particles.texture_txf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.particles.texture_txf, "")
		end

		local mdl = GetParticlesModel(editor.scene.selection)
		if mdl ~= nil then
			SetTextFieldText(editor.gui.properties.edit.particles.model_txf, GetModelName(mdl))
		else
			SetTextFieldText(editor.gui.properties.edit.particles.model_txf, "")
		end

		local ent = GetParticlesEntity(editor.scene.selection)
		if ent ~= nil then
			SetTextFieldText(editor.gui.properties.edit.particles.entity_txf, GetActorName(ent))
		else
			SetTextFieldText(editor.gui.properties.edit.particles.entity_txf, "")
		end

		local gravity = GetParticlesGravity(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.gravity_x_txf, gravity.x)
		SetTextFieldText(editor.gui.properties.edit.particles.gravity_y_txf, gravity.y)
		SetTextFieldText(editor.gui.properties.edit.particles.gravity_z_txf, gravity.z)

		SetTextFieldText(editor.gui.properties.edit.particles.spawn_delay_txf, GetParticlesSpawnDelay(editor.scene.selection))
		SetCheckBoxState(editor.gui.properties.edit.particles.spawn_cb, GetParticlesSpawn(editor.scene.selection))

		SetTextFieldText(editor.gui.properties.edit.particles.size_min_txf, GetParticlesSizeMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.size_max_txf, GetParticlesSizeMax(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.size_grow_min_txf, GetParticlesSizeGrowthMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.size_grow_max_txf, GetParticlesSizeGrowthMax(editor.scene.selection))

		SetTextFieldText(editor.gui.properties.edit.particles.rotation_min_txf, GetParticlesRotationMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.rotation_max_txf, GetParticlesRotationMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.rot_grow_min_txf, GetParticlesRotationGrowthMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.rot_grow_max_txf, GetParticlesRotationGrowthMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.life_span_min_txf, GetParticlesLifeSpanMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.life_span_max_txf, GetParticlesLifeSpanMax(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.fade_speed_min_txf, GetParticlesFadeSpeedMin(editor.scene.selection))
		SetTextFieldText(editor.gui.properties.edit.particles.fade_speed_max_txf, GetParticlesFadeSpeedMax(editor.scene.selection))

		local pos = GetParticlesPositionMin(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.pos_min_x_txf, pos.x)
		SetTextFieldText(editor.gui.properties.edit.particles.pos_min_y_txf, pos.y)
		SetTextFieldText(editor.gui.properties.edit.particles.pos_min_z_txf, pos.z)

		local pos = GetParticlesPositionMax(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.pos_max_x_txf, pos.x)
		SetTextFieldText(editor.gui.properties.edit.particles.pos_max_y_txf, pos.y)
		SetTextFieldText(editor.gui.properties.edit.particles.pos_max_z_txf, pos.z)

		local vel = GetParticlesVelocityMin(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.vel_min_x_txf, vel.x)
		SetTextFieldText(editor.gui.properties.edit.particles.vel_min_y_txf, vel.y)
		SetTextFieldText(editor.gui.properties.edit.particles.vel_min_z_txf, vel.z)

		local vel = GetParticlesVelocityMax(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.vel_max_x_txf, vel.x)
		SetTextFieldText(editor.gui.properties.edit.particles.vel_max_y_txf, vel.y)
		SetTextFieldText(editor.gui.properties.edit.particles.vel_max_z_txf, vel.z)

		local color = GetParticlesColorMin(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf, color.r)
		SetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf, color.g)
		SetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf, color.b)
		SetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf, color.a)

		local color = GetParticlesColorMax(editor.scene.selection)
		SetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf, color.r)
		SetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf, color.g)
		SetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf, color.b)
		SetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf, color.a)

		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.max_count_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.texture_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.model_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.entity_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravity_x_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravity_y_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.gravity_z_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.spawn_delay_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.size_min_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.size_max_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.size_grow_min_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.size_grow_max_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rotation_min_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rotation_max_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rot_grow_min_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.rot_grow_max_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.life_span_min_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.life_span_max_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.fade_speed_min_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.fade_speed_max_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_min_x_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_min_y_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_min_z_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_max_x_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_max_y_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.pos_max_z_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_min_x_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_min_y_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_min_z_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_max_x_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_max_y_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.vel_max_z_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_min_r_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_min_g_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_min_b_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_min_a_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_max_r_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_max_g_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_max_b_txf, 0)
		SetTextFieldCursorPosition(editor.gui.properties.edit.particles.color_max_a_txf, 0)
	elseif GetObjectType(editor.scene.selection) == SPRITE then
	end
end

function edi_update_edit_selection_material()
	local index = GetTextListSelectionIndex(editor.gui.properties.edit.entity.materials_txl)
	if index < 0 then
		SetTextFieldText(editor.gui.properties.edit.entity.mat_name_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_r_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_g_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_b_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_a_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_specular_r_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_specular_g_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_specular_b_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_r_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_g_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_b_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_spec_power_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_prlx_scale_txf, "")
		SetCheckBoxState(editor.gui.properties.edit.entity.mat_lighting_cb, false)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_alpha_thrs_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_map_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_normal_map_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_height_map_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_spec_map_txf, "")
		SetTextFieldText(editor.gui.properties.edit.entity.mat_light_map_txf, "")
	else
		local mat = GetEntityMaterial(editor.scene.selection, index)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_name_txf, GetMaterialName(mat))
		local col = GetMaterialDiffuseColor(mat)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_r_txf, col.r)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_g_txf, col.g)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_b_txf, col.b)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_a_txf, col.a)
		local col = GetMaterialSpecularColor(mat)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_specular_r_txf, col.r)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_specular_g_txf, col.g)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_specular_b_txf, col.b)
		local col = GetMaterialAmbientColor(mat)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_r_txf, col.r)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_g_txf, col.g)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_b_txf, col.b)
		SetTextFieldText(editor.gui.properties.edit.entity.mat_spec_power_txf, GetMaterialSpecularPower(mat))
		SetCheckBoxState(editor.gui.properties.edit.entity.mat_lighting_cb, GetMaterialLighting(mat))
		SetTextFieldText(editor.gui.properties.edit.entity.mat_prlx_scale_txf, GetMaterialParallaxScale(mat))
		SetCheckBoxState(editor.gui.properties.edit.entity.mat_alpha_test_cb, GetMaterialAlphaTest(mat))
		SetTextFieldText(editor.gui.properties.edit.entity.mat_alpha_thrs_txf, GetMaterialAlphaThreshold(mat))
		local tex = GetMaterialDiffuseMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_map_txf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_map_txf, "")
		end
		tex = GetMaterialNormalMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.mat_normal_map_txf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.mat_normal_map_txf, "")
		end
		tex = GetMaterialHeightMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.mat_height_map_txf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.mat_height_map_txf, "")
		end
		tex = GetMaterialSpecularMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.mat_spec_map_txf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.mat_spec_map_txf, "")
		end
		tex = GetMaterialLightMap(mat)
		if tex ~= nil then
			SetTextFieldText(editor.gui.properties.edit.entity.mat_light_map_txf, GetTextureName(tex))
		else
			SetTextFieldText(editor.gui.properties.edit.entity.mat_light_map_txf, "")
		end
	end

	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_name_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_diffuse_r_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_diffuse_g_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_diffuse_b_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_diffuse_a_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_specular_r_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_specular_g_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_specular_b_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_ambient_r_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_ambient_g_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_ambient_b_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_spec_power_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_prlx_scale_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_alpha_thrs_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_diffuse_map_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_normal_map_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_height_map_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_spec_map_txf, 0)
	SetTextFieldCursorPosition(editor.gui.properties.edit.entity.mat_light_map_txf, 0)
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

	local scn = CreateSceneFromFile(path)
	if scn ~= nil then

		print("importing scene \"" .. path .. "\"")
		print("  cameras: " .. GetSceneCameraCount(scn))
		print("  entities: " .. GetSceneEntityCount(scn))
		print("  lights: " .. GetSceneLightCount(scn))
		print("  sprites: " .. GetSceneSpriteCount(scn))
		print("  particles: " .. GetSceneParticlesCount(scn))

		while GetSceneCameraByIndex(scn, 0) ~= nil do
			local cam = GetSceneCameraByIndex(scn, 0)
			AddSceneCamera(editor.scene.handle, cam)
		end
		while GetSceneEntityByIndex(scn, 0) ~= nil do
			local ent = GetSceneEntityByIndex(scn, 0)
			AddSceneEntity(editor.scene.handle, ent)
		end
		while GetSceneLightByIndex(scn, 0) ~= nil do
			local lig = GetSceneLightByIndex(scn, 0)
			AddSceneLight(editor.scene.handle, lig)
		end
		while GetSceneSpriteByIndex(scn, 0) ~= nil do
			local spr = GetSceneSpriteByIndex(scn, 0)
			AddSceneSprite(editor.scene.handle, spr)
		end
		while GetSceneParticlesByIndex(scn, 0) ~= nil do
			local par = GetSceneParticlesByIndex(scn, 0)
			AddSceneParticles(editor.scene.handle, par)
		end
		edi_open_properties()
	end
end

function edi_update_menu()
	if GetGuiObjectEvent(editor.gui.properties.menu.open) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Open PAK...", EDI_FILE_DIALOG_OPEN, edi_properties_menu_open)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.save) == CLICKED then
		local path = GetSceneFilePath(editor.scene.handle)
		if path == nil or string.len(path) < 1 then
			path = GetCurrentDirectory()
		else
			path = edi_get_parent_folder(path)
		end
		edi_open_file_dialog(path, "Save PAK...", EDI_FILE_DIALOG_SAVE, edi_properties_menu_save)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.import_scene) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Import Scene (.pak/.dae/.3ds/.md2/...) ...", EDI_FILE_DIALOG_OPEN, edi_properties_menu_import_scene)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.create_camera) == CLICKED then
		local cam = CreateCamera("Camera")
		AddSceneCamera(editor.scene.handle, cam)

		edi_select_actor(cam)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.create_light) == CLICKED then
		local lig = CreateLight("Light")
		AddSceneLight(editor.scene.handle, lig)

		edi_select_actor(lig)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.create_entity) == CLICKED then
		local ent = CreateEntity("Entity")
		AddSceneEntity(editor.scene.handle, ent)

		edi_select_actor(ent)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.create_particles) == CLICKED then
		local par = CreateParticles("Particles", 25)
		AddSceneParticles(editor.scene.handle, par)

		edi_select_actor(par)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.ambient_r_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.menu.ambient_r_txf, 0.0, nil)
		SetSceneAmbientColor(editor.scene.handle,
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.ambient_g_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.menu.ambient_g_txf, 0.0, nil)
		SetSceneAmbientColor(editor.scene.handle,
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.menu.ambient_b_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.menu.ambient_b_txf, 0.0, nil)
		SetSceneAmbientColor(editor.scene.handle,
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.menu.ambient_b_txf)), 1.0)
	end
end

function edi_properties_edit_actor_open_script(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	if string.find(path, ".lua") == nil then return end

	local scr = CreateScriptFromFile(path)
	if scr ~= nil then
		SetActorScript(editor.scene.selection, scr)
		edi_update_edit_selection()
		edi_open_properties()
	end
end

function edi_update_actor()
	if GetGuiObjectEvent(editor.gui.properties.edit.actor.name_txf) == LOSE_FOCUS then
		SetActorName(editor.scene.selection, GetTextFieldText(editor.gui.properties.edit.actor.name_txf))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.script_open) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Open Script (.lua)...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_actor_open_script)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.script_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.actor.script_txf)
		if string.len(name) > 0 then
			local scr = GetActorScript(editor.scene.selection)
			if scr ~= nil then
				SetScriptName(scr, name)
			else
				local scripts = GetSceneScripts(editor.scene.handle)
				scr = BeginList(scripts)
				while scr ~= nil do
					if GetScriptName(scr) == name then
						SetActorScript(editor.scene.selection, scr)
						break
					end
					scr = NextInList(scripts)
				end
				if scr ~= nil then SetTextFieldText(editor.gui.properties.edit.actor.script_txf, "") end
			end
		else
			ClearActorScript(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.pos_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.pos_x_txf, nil, nil)
		SetActorPosition(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.pos_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.pos_y_txf, nil, nil)
		SetActorPosition(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.pos_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.pos_z_txf, nil, nil)
		SetActorPosition(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.pos_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.rot_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.rot_x_txf, nil, nil)
		SetActorRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.rot_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.rot_y_txf, nil, nil)
		SetActorRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.rot_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.rot_z_txf, nil, nil)
		SetActorRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.rot_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.physics_enb_cb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.edit.actor.physics_enb_cb) == true then
			local shape = GetActorShape(editor.scene.selection)
			if shape == 0 then
				SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
				shape = 1
			end
			SetActorPhysics(editor.scene.selection, shape, GetActorMass(editor.scene.selection))
		else
			DisableActorPhysics(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lengths_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lengths_x_txf, 0.0, nil)
		SetActorBoundingLengths(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lengths_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lengths_y_txf, 0.0, nil)
		SetActorBoundingLengths(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lengths_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lengths_z_txf, 0.0, nil)
		SetActorBoundingLengths(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lengths_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.offset_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.offset_x_txf, 0.0, nil)
		SetActorBoundingOffset(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.offset_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.offset_y_txf, 0.0, nil)
		SetActorBoundingOffset(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.offset_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.offset_z_txf, 0.0, nil)
		SetActorBoundingOffset(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.offset_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.mass_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.mass_txf, 0.0, nil)
		local physics = IsActorPhysics(editor.scene.selection)
		local shape = GetActorShape(editor.scene.selection)
		if shape == 0 then
			SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
			shape = 1
		end
		SetActorPhysics(editor.scene.selection, shape,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.mass_txf)))
		if physics == false then DisableActorPhysics(editor.scene.selection) end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_damp_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_damp_txf, 0.0, nil)
		SetActorDamping(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_damp_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_damp_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_damp_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_damp_txf, 0.0, nil)
		SetActorDamping(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_damp_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_damp_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_sleep_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_sleep_txf, 0.0, nil)
		SetActorSleepThresholds(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_sleep_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_sleep_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_sleep_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_sleep_txf, 0.0, nil)
		SetActorSleepThresholds(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_sleep_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_sleep_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.restitu_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.restitu_txf, 0.0, nil)
		SetActorRestitution(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.restitu_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.anis_fric_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.anis_fric_x_txf, 0.0, nil)
		SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.anis_fric_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.anis_fric_y_txf, 0.0, nil)
		SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.anis_fric_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.anis_fric_z_txf, 0.0, nil)
		SetActorAnisotropicFriction(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.anis_fric_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_factor_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_factor_x_txf, 0.0, nil)
		SetActorLinearFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_factor_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_factor_y_txf, 0.0, nil)
		SetActorLinearFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.lin_factor_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.lin_factor_z_txf, 0.0, nil)
		SetActorLinearFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.lin_factor_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_factor_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_factor_x_txf, 0.0, nil)
		SetActorAngularFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_factor_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_factor_y_txf, 0.0, nil)
		SetActorAngularFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.ang_factor_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.actor.ang_factor_z_txf, 0.0, nil)
		SetActorAngularFactor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.ang_factor_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.shape) == SELECTION_CHANGED then
		local physics = IsActorPhysics(editor.scene.selection)
		local shape = GetTextListSelectionIndex(editor.gui.properties.edit.actor.shape)+1
		if shape == 0 then
			SetTextListSelection(editor.gui.properties.edit.actor.shape, 0)
			shape = 1
		end
		SetActorPhysics(editor.scene.selection, shape,
			tonumber(GetTextFieldText(editor.gui.properties.edit.actor.mass_txf)))
		if physics == false then DisableActorPhysics(editor.scene.selection) end
	end

	local diff = GetTextListItemCount(editor.gui.properties.edit.actor.shape)-
		GetTextListRowCount(editor.gui.properties.edit.actor.shape)

	if GetGuiObjectEvent(editor.gui.properties.edit.actor.shape_sb) == VALUE_CHANGED then
		if diff > 0 then
			SetTextListOffset(editor.gui.properties.edit.actor.shape, diff*(1.0-GetSliderValue(editor.gui.properties.edit.actor.shape_sb)))
		end
	end
end

function edi_update_camera()
	if GetGuiObjectEvent(editor.gui.properties.edit.camera.fov_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.camera.fov_txf, 0.0, 179.0)
		SetCameraPerspective(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.fov_txf)),
			-1.0, tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clip_near_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clip_far_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.camera.clip_near_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.camera.clip_near_txf, 0.0, nil)
		SetCameraPerspective(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.fov_txf)),
			-1.0, tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clip_near_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clip_far_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.camera.clip_far_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.camera.clip_far_txf, 0.0, nil)
		SetCameraPerspective(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.fov_txf)),
			-1.0, tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clip_near_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.camera.clip_far_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.camera.copy_but) == CLICKED then
		local pos = GetActorPosition(editor.scene.selection)
		local rot = GetActorRotation(editor.scene.selection)
		local clip = GetCameraClip(editor.scene.selection)
		SetActorPosition(editor.scene.camera.handle, pos.x, pos.y, pos.z)
		SetActorRotation(editor.scene.camera.handle, rot.x, rot.y, rot.z)
		SetCameraPerspective(editor.scene.camera.handle,
			GetCameraFov(editor.scene.selection), -1.0, clip.x, clip.y)
	end
end

function edi_update_light()
	if GetGuiObjectEvent(editor.gui.properties.edit.light.type_txl) == SELECTION_CHANGED then
		SetLightType(editor.scene.selection, GetTextListSelectionIndex(editor.gui.properties.edit.light.type_txl)+1)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.color_r_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.color_r_txf, 0.0, nil)
		SetLightColor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.color_g_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.color_g_txf, 0.0, nil)
		SetLightColor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.color_b_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.color_b_txf, 0.0, nil)
		SetLightColor(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.color_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.distance_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.distance_txf, 0.0, nil)
		SetLightDistance(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.distance_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.fade_speed_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.fade_speed_txf, 0.0, nil)
		SetLightFadeSpeed(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.fade_speed_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.inner_cone_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.inner_cone_txf, 0.0, nil)
		SetLightCone(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.inner_cone_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.outer_cone_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.outer_cone_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.outer_cone_txf, 0.0, nil)
		SetLightCone(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.inner_cone_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.outer_cone_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.shadows_cb) == STATE_CHANGED then
		SetLightShadows(editor.scene.selection, GetCheckBoxState(editor.gui.properties.edit.light.shadows_cb))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.ls_enabled_cb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.edit.light.ls_enabled_cb) then
			SetLightShaft(editor.scene.selection,
				tonumber(GetTextFieldText(editor.gui.properties.edit.light.size_txf)),
				tonumber(GetTextFieldText(editor.gui.properties.edit.light.intensity_txf)),
				tonumber(GetTextFieldText(editor.gui.properties.edit.light.fade_off_txf)))
		else
			DisableLightShaft(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.size_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.size_txf, 0.0, nil)
		local enabled = IsLightShaft(editor.scene.selection)
		SetLightShaft(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.size_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.intensity_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.fade_off_txf)))
		if enabled == false then DisableLightShaft(editor.scene.selection) end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.intensity_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.intensity_txf, 0.0, nil)
		local enabled = IsLightShaft(editor.scene.selection)
		SetLightShaft(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.size_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.intensity_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.fade_off_txf)))
		if enabled == false then DisableLightShaft(editor.scene.selection) end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.light.fade_off_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.light.fade_off_txf, 0.0, nil)
		local enabled = IsLightShaft(editor.scene.selection)
		SetLightShaft(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.size_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.intensity_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.light.fade_off_txf)))
		if enabled == false then DisableLightShaft(editor.scene.selection) end
	end
end

function edi_properties_edit_entity_open_diffuse_map(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialDiffuseMap(editor.scene.material, tex)
		edi_update_edit_selection_material()
		edi_open_properties()
	end
end

function edi_properties_edit_entity_open_normal_map(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialNormalMap(editor.scene.material, tex)
		GenerateEntityTangents(editor.scene.selection)
		edi_update_edit_selection_material()
		edi_open_properties()
	end
end

function edi_properties_edit_entity_open_height_map(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialHeightMap(editor.scene.material, tex)
		GenerateEntityTangents(editor.scene.selection)
		edi_update_edit_selection_material()
		edi_open_properties()
	end
end

function edi_properties_edit_entity_open_spec_map(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialSpecularMap(editor.scene.material, tex)
		edi_update_edit_selection_material()
		edi_open_properties()
	end
end

function edi_properties_edit_entity_open_light_map(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetMaterialLightMap(editor.scene.material, tex)
		edi_update_edit_selection_material()
		edi_open_properties()
	end
end

function edi_update_entity()
	if GetGuiObjectEvent(editor.gui.properties.edit.entity.model_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.model_txf)
		if string.len(name) > 0 then
			local mdl = GetEntityModel(editor.scene.selection)
			if mdl ~= nil then
				SetModelName(mdl, name)
			else
				local models = GetSceneModels(editor.scene.handle)
				local mdl = BeginList(models)
				while mdl ~= nil do
					if GetModelName(mdl) == name then
						SetEntityModel(editor.scene.selection, mdl)

						RemoveTextListItems(editor.gui.properties.edit.entity.materials_txl)
						for i=0, GetEntityMaterialCount(editor.scene.selection)-1 do
							local mat = GetEntityMaterial(editor.scene.selection, i)
							AddTextListItem(editor.gui.properties.edit.entity.materials_txl, GetMaterialName(mat))
						end

						if GetEntityMaterialCount(editor.scene.selection) > 0 then
							SetTextListSelection(editor.gui.properties.edit.entity.materials_txl, 0)
							editor.scene.material = GetEntityMaterial(editor.scene.selection, 0)
						else
							SetTextListSelection(editor.gui.properties.edit.entity.materials_txl, -1)
						end

						edi_update_edit_selection_material()

						break
					end
					mdl = NextInList(models)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.model_txf, "") end
			end
		else
			ClearEntityModel(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.scale_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.scale_x_txf, nil, nil)
		SetEntityScale(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.scale_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.scale_y_txf, nil, nil)
		SetEntityScale(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.scale_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.scale_z_txf, nil, nil)
		SetEntityScale(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.scale_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.materials_txl) == SELECTION_CHANGED then
		edi_update_edit_selection_material()
	end

	local diff = GetTextListItemCount(editor.gui.properties.edit.entity.materials_txl)-
		GetTextListRowCount(editor.gui.properties.edit.entity.materials_txl)

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.materials_sb) == VALUE_CHANGED then
		if diff > 0 then
			SetTextListOffset(editor.gui.properties.edit.entity.materials_txl,
				diff*(1.0-GetSliderValue(editor.gui.properties.edit.entity.materials_sb)))
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.add_material_but) == CLICKED then
		local new_mat = CreateMaterial("Material")
		AddEntityMaterial(editor.scene.selection, new_mat)
		AddTextListItem(editor.gui.properties.edit.entity.materials_txl, "Material")
	end

	local index = GetTextListSelectionIndex(editor.gui.properties.edit.entity.materials_txl)

	if index < 0 then return end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.replace_material_but) == CLICKED then
		local new_mat = CreateMaterial("Material")
		SetEntityMaterial(editor.scene.selection, index, new_mat)
		SetTextListItem(editor.gui.properties.edit.entity.materials_txl, index, "Material")
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.remove_material_but) == CLICKED then
		RemoveEntityMaterial(editor.scene.selection, index)

		RemoveTextListItems(editor.gui.properties.edit.entity.materials_txl)
		for i=0, GetEntityMaterialCount(editor.scene.selection)-1 do
			local mat = GetEntityMaterial(editor.scene.selection, i)
			AddTextListItem(editor.gui.properties.edit.entity.materials_txl, GetMaterialName(mat))
		end

		if GetEntityMaterialCount(editor.scene.selection) > 0 then
			SetTextListSelection(editor.gui.properties.edit.entity.materials_txl, 0)
			editor.scene.material = GetEntityMaterial(editor.scene.selection, 0)
		else
			SetTextListSelection(editor.gui.properties.edit.entity.materials_txl, -1)
		end

		edi_update_edit_selection_material()
	end

	local mat = GetEntityMaterial(editor.scene.selection, index)
	if mat == nil then return end

	editor.scene.material = mat

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_name_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.mat_name_txf)
		if string.len(name) < 1 then
			SetTextFieldText(editor.gui.properties.edit.entity.mat_name_txf, GetMaterialName(mat))
		else
			SetMaterialName(mat, name)
			SetTextListItem(editor.gui.properties.edit.entity.materials_txl, index, name)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_diffuse_r_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_diffuse_r_txf, 0.0, nil)
		SetMaterialDiffuseColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_diffuse_g_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_diffuse_g_txf, 0.0, nil)
		SetMaterialDiffuseColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_diffuse_b_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_diffuse_b_txf, 0.0, nil)
		SetMaterialDiffuseColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_diffuse_a_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_diffuse_a_txf, 0.0, nil)
		SetMaterialDiffuseColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_specular_r_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_specular_r_txf, 0.0, nil)
		SetMaterialSpecularColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_specular_g_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_specular_g_txf, 0.0, nil)
		SetMaterialSpecularColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_specular_b_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_specular_b_txf, 0.0, nil)
		SetMaterialSpecularColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_specular_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_ambient_r_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_ambient_r_txf, 0.0, nil)
		SetMaterialAmbientColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_ambient_g_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_ambient_g_txf, 0.0, nil)
		SetMaterialAmbientColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_ambient_b_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_ambient_b_txf, 0.0, nil)
		SetMaterialAmbientColor(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_ambient_b_txf)), 1.0)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_spec_power_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_spec_power_txf, 0.0, nil)
		SetMaterialSpecularPower(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_spec_power_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_lighting_cb) == STATE_CHANGED then
		SetMaterialLighting(mat, GetCheckBoxState(editor.gui.properties.edit.entity.mat_lighting_cb))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_prlx_scale_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_prlx_scale_txf, 0.0, nil)
		SetMaterialParallaxScale(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_prlx_scale_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_alpha_test_cb) == STATE_CHANGED then
		SetMaterialAlphaTest(mat, GetCheckBoxState(editor.gui.properties.edit.entity.mat_alpha_test_cb))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_alpha_thrs_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.entity.mat_alpha_thrs_txf, 0.0, 1.0)
		SetMaterialAlphaThreshold(mat,
			tonumber(GetTextFieldText(editor.gui.properties.edit.entity.mat_alpha_thrs_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_diffuse_map_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_map_txf)
		if string.len(name) > 0 then
			local tex = GetMaterialDiffuseMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialDiffuseMap(mat, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.mat_diffuse_map_txf, "") end
			end
		else
			ClearMaterialDiffuseMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_normal_map_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.mat_normal_map_txf)
		if string.len(name) > 0 then
			local tex = GetMaterialNormalMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialNormalMap(mat, tex)
						GenerateEntityTangents(editor.scene.selection)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.mat_normal_map_txf, "") end
			end
		else
			ClearMaterialNormalMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_height_map_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.mat_height_map_txf)
		if string.len(name) > 0 then
			local tex = GetMaterialHeightMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialHeightMap(mat, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.mat_height_map_txf, "") end
			end
		else
			ClearMaterialHeightMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_spec_map_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.mat_spec_map_txf)
		if string.len(name) > 0 then
			local tex = GetMaterialSpecularMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialSpecularMap(mat, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.mat_spec_map_txf, "") end
			end
		else
			ClearMaterialSpecularMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_light_map_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.entity.mat_light_map_txf)
		if string.len(name) > 0 then
			local tex = GetMaterialLightMap(mat)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetMaterialLightMap(mat, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.entity.mat_light_map_txf, "") end
			end
		else
			ClearMaterialLightMap(mat)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_diffuse_map_open) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Open Diffuse Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_entity_open_diffuse_map)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_normal_map_open) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Open Normal Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_entity_open_normal_map)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_height_map_open) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Open Height Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_entity_open_height_map)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_spec_map_open) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Open Specular Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_entity_open_spec_map)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.entity.mat_light_map_open) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Open Light Map (.jpg/.png/.tga/etc)...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_entity_open_light_map)
	end
end

function edi_properties_edit_particles_open_texture(path)
	if string.len(path) < 1 then
		edi_open_properties()
		return
	end

	local tex = CreateTextureFromFile(path)
	if tex ~= nil then
		SetParticlesTexture(editor.scene.selection, tex)
		edi_update_edit_selection()
		edi_open_properties()
	end
end

function edi_update_particles()
	if GetGuiObjectEvent(editor.gui.properties.edit.particles.max_count_txf) == LOSE_FOCUS then
		edi_check_text_field_int(editor.gui.properties.edit.particles.max_count_txf, 0, nil)
		SetParticlesMaxCount(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.max_count_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.texture_open) == CLICKED then
		edi_open_file_dialog(GetCurrentDirectory(), "Open Particles Texture...", EDI_FILE_DIALOG_OPEN, edi_properties_edit_particles_open_texture)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.texture_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.particles.texture_txf)
		if string.len(name) > 0 then
			local tex = GetParticlesTexture(editor.scene.selection)
			if tex ~= nil then
				SetTextureName(tex, name)
			else
				local textures = GetSceneTextures(editor.scene.handle)
				local tex = BeginList(textures)
				while tex ~= nil do
					if GetTextureName(tex) == name then
						SetParticlesTexture(editor.scene.selection, tex)
						break
					end
					tex = NextInList(textures)
				end
				if tex == nil then SetTextFieldText(editor.gui.properties.edit.particles.texture_txf, "") end
			end
		else
			ClearParticlesTexture(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.trs_cb) == CLICKED then
		SetParticlesDrawMode(editor.scene.selection, TRANSPARENT)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.add_cb) == CLICKED then
		SetParticlesDrawMode(editor.scene.selection, ADD)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.model_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.particles.model_txf)
		if string.len(name) > 0 then
			local mdl = GetParticlesModel(editor.scene.selection)
			if mdl ~= nil  then
				SetModelName(mdl, name)
			else
				local models = GetSceneModels(editor.scene.handle)
				local mdl = BeginList(models)
				while mdl ~= nil do
					if GetModelName(mdl) == name then
						SetTextFieldText(editor.gui.properties.edit.particles.entity_txf, "")
						SetParticlesModel(editor.scene.selection, mdl)
						break
					end
					mdl = NextInList(models)
				end
				if mdl == nil then SetTextFieldText(editor.gui.properties.edit.particles.model_txf, "") end
			end
		else
			ClearParticlesModel(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.entity_txf) == LOSE_FOCUS then
		local name = GetTextFieldText(editor.gui.properties.edit.particles.entity_txf)
		if string.len(name) > 0 then
			local ent = GetParticlesEntity(editor.scene.selection)
			if ent ~= nil then
				SetActorName(ent, name)
			else
				local ent = nil
				for i=0, GetSceneEntityCount(editor.scene.handle)-1 do
					ent = GetSceneEntityByIndex(editor.scene.handle, i)
					if GetActorName(ent) == name then
						SetTextFieldText(editor.gui.properties.edit.particles.model_txf, "")
						SetParticlesEntity(editor.scene.selection, ent)
						break
					end
				end
				if ent == nil then SetTextFieldText(editor.gui.properties.edit.particles.entity_txf, "") end
			end
		else
			ClearParticlesEntity(editor.scene.selection)
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.gravity_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.gravity_x_txf, nil, nil)
		SetParticlesGravity(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.gravity_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.gravity_z_txf, nil, nil)
		SetParticlesGravity(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.gravity_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.gravity_z_txf, nil, nil)
		SetParticlesGravity(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.gravity_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.spawn_delay_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.spawn_delay_txf, 0.00001, nil)
		SetParticlesSpawnDelay(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.spawn_delay_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.spawn_cb) == STATE_CHANGED then
		SetParticlesSpawn(editor.scene.selection,
			GetCheckBoxState(editor.gui.properties.edit.particles.spawn_cb))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.size_min_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.size_min_txf, 0.0, nil)
		SetParticlesSize(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.size_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.size_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.size_max_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.size_max_txf, 0.0, nil)
		SetParticlesSize(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.size_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.size_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.size_grow_min_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.size_grow_min_txf, nil, nil)
		SetParticlesSizeGrowth(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.size_grow_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.size_grow_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.size_grow_max_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.size_grow_max_txf, nil, nil)
		SetParticlesSizeGrowth(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.size_grow_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.size_grow_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.rotation_min_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.rotation_min_txf, 0.0, nil)
		SetParticlesRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotation_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotation_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.rotation_max_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.rotation_max_txf, 0.0, nil)
		SetParticlesRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotation_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rotation_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.rot_grow_min_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.rot_grow_min_txf, nil, nil)
		SetParticlesRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rot_grow_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rot_grow_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.rot_grow_max_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.rot_grow_max_txf, nil, nil)
		SetParticlesRotation(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rot_grow_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.rot_grow_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.life_span_min_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.life_span_min_txf, 0.0, nil)
		SetParticlesLifeSpan(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.life_span_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.life_span_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.life_span_max_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.life_span_max_txf, 0.0, nil)
		SetParticlesLifeSpan(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.life_span_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.life_span_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.fade_speed_min_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.fade_speed_min_txf, 0.0, nil)
		SetParticlesFadeSpeed(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.fade_speed_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.fade_speed_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.fade_speed_max_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.fade_speed_max_txf, 0.0, nil)
		SetParticlesFadeSpeed(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.fade_speed_min_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.fade_speed_max_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_min_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_min_x_txf, nil, nil)
		SetParticlesPositionMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_min_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_min_y_txf, nil, nil)
		SetParticlesPositionMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_min_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_min_z_txf, nil, nil)
		SetParticlesPositionMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_min_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_max_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_max_x_txf, nil, nil)
		SetParticlesPositionMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_max_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_max_y_txf, nil, nil)
		SetParticlesPositionMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.pos_max_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.pos_max_z_txf, nil, nil)
		SetParticlesPositionMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.pos_max_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_min_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_min_x_txf, nil, nil)
		SetParticlesVelocityMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_min_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_min_y_txf, nil, nil)
		SetParticlesVelocityMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_min_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_min_z_txf, nil, nil)
		SetParticlesVelocityMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_min_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_max_x_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_max_x_txf, nil, nil)
		SetParticlesVelocityMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_max_y_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_max_y_txf, nil, nil)
		SetParticlesVelocityMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.vel_max_z_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.vel_max_z_txf, nil, nil)
		SetParticlesVelocityMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_x_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_y_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.vel_max_z_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.color_min_r_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_min_r_txf, 0.0, nil)
		SetParticlesColorMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.color_min_g_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_min_g_txf, 0.0, nil)
		SetParticlesColorMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.color_min_b_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_min_b_txf, 0.0, nil)
		SetParticlesColorMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.color_min_a_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_min_a_txf, 0.0, nil)
		SetParticlesColorMin(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_min_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.color_max_r_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_max_r_txf, 0.0, nil)
		SetParticlesColorMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.color_max_g_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_max_g_txf, 0.0, nil)
		SetParticlesColorMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.color_max_b_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_max_b_txf, 0.0, nil)
		SetParticlesColorMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf)))
	end

	if GetGuiObjectEvent(editor.gui.properties.edit.particles.color_max_a_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.edit.particles.color_max_a_txf, 0.0, nil)
		SetParticlesColorMax(editor.scene.selection,
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_r_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_g_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_b_txf)),
			tonumber(GetTextFieldText(editor.gui.properties.edit.particles.color_max_a_txf)))
	end
end

function edi_update_sprite()
end

function edi_update_edit()
	if editor.scene.selection == nil then return end

	if GetGuiObjectEvent(editor.gui.properties.edit.act_cb) == CLICKED then
		edi_switch_edit_tab(EDI_EDIT_ACTOR)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.cam_cb) == CLICKED then
		edi_switch_edit_tab(EDI_EDIT_CAMERA)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.lig_cb) == CLICKED then
		edi_switch_edit_tab(EDI_EDIT_LIGHT)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.ent_cb) == CLICKED then
		edi_switch_edit_tab(EDI_EDIT_ENTITY)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.par_cb) == CLICKED then
		edi_switch_edit_tab(EDI_EDIT_PARTICLES)
	end
	if GetGuiObjectEvent(editor.gui.properties.edit.spr_cb) == CLICKED then
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
	if GetGuiObjectEvent(editor.gui.properties.pp.bloom_cb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.bloom_cb) == true then
			SetBloom(GetSliderValue(editor.gui.properties.pp.bloom_str_sli))
		else
			DisableBloom()
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.bloom_str_sli) == VALUE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.bloom_cb) == true then
			SetBloom(GetSliderValue(editor.gui.properties.pp.bloom_str_sli))
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.dof_enb_cb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.dof_enb_cb) == true then
			SetDof(tonumber(GetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf)),
				tonumber(GetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf)))
		else
			DisableDof()
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.dof_foc_rng_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.pp.dof_foc_rng_txf, 0, nil)
		if GetCheckBoxState(editor.gui.properties.pp.dof_enb_cb) == true then
			SetDof(tonumber(GetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf)),
				tonumber(GetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf)))
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.dof_foc_dst_txf) == LOSE_FOCUS then
		edi_check_text_field_float(editor.gui.properties.pp.dof_foc_dst_txf, 0, nil)
		if GetCheckBoxState(editor.gui.properties.pp.dof_enb_cb) == true then
			SetDof(tonumber(GetTextFieldText(editor.gui.properties.pp.dof_foc_rng_txf)),
				tonumber(GetTextFieldText(editor.gui.properties.pp.dof_foc_dst_txf)))
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.lsh_enb_cb) == STATE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.lsh_enb_cb) == true then
			SetLightShafts(GetSliderValue(editor.gui.properties.pp.lsh_str_sli))
		else
			DisableLightShafts()
		end
	end

	if GetGuiObjectEvent(editor.gui.properties.pp.lsh_str_sli) == VALUE_CHANGED then
		if GetCheckBoxState(editor.gui.properties.pp.lsh_enb_cb) == true then
			SetLightShafts(GetSliderValue(editor.gui.properties.pp.lsh_str_sli))
		end
	end
end

function edi_update_properties()
	if GetGuiObjectEvent(editor.gui.properties.menu_cb) == CLICKED then
		edi_switch_properties_tab(EDI_PROPERTIES_MENU)
	end

	if GetGuiObjectEvent(editor.gui.properties.edit_cb) == CLICKED then
		edi_switch_properties_tab(EDI_PROPERTIES_EDIT)
	end

	if GetGuiObjectEvent(editor.gui.properties.pp_cb) == CLICKED then
		edi_switch_properties_tab(EDI_PROPERTIES_PP)
	end

	if editor.gui.properties.current_tab == EDI_PROPERTIES_MENU then edi_update_menu()
	elseif editor.gui.properties.current_tab == EDI_PROPERTIES_EDIT then edi_update_edit()
	elseif editor.gui.properties.current_tab == EDI_PROPERTIES_PP then edi_update_pp() end
end

