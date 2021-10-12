--Item, Weight
local drops_regular_consumables = {
	[1] = {"weapon_zs_f_hotdog", 1},
	[2] = {"weapon_zs_f_takeout", 1},
	[3] = {"weapon_zs_f_banana", 1},
	[4] = {"weapon_zs_f_milk", 1},
	[5] = {"weapon_zs_f_orange", 1},
	[6] = {"weapon_zs_f_soda", 1},
	[7] = {"weapon_zs_f_takeout", 1},
	[8] = {"weapon_zs_f_water", 1},
	[9] = {"weapon_zs_f_watermelon", 1},
	[10] = {"weapon_zs_f_hamburger", 1},
	[11] = {"weapon_zs_f_burrito", 1},
	[12] = {"weapon_zs_f_coffee", 1},
	[13] = {"weapon_zs_f_cookie", 1},
	[14] = {"weapon_zs_f_icecream", 1},
	[15] = {"weapon_zs_f_juice", 1},
	[16] = {"weapon_zs_f_moonshine", 1},
	[17] = {"weapon_zs_f_potato", 1},
	[18] = {"weapon_zs_f_taco", 1}
}

--Item, Weight, QuanityMin, QuantityMax
local drops_regular_ammo = {
	[1] = {"pulse", 95, 15, 30},
	[2] = {"pulse", 5, 100, 200},
	[3] = {"pistol", 95, 12, 24},
	[4] = {"pistol", 5, 80, 120},
	[5] = {"impactmine", 95, 3, 8},
	[6] = {"impactmine", 5, 24, 40},
	[7] = {"scrap", 150, 3, 8},
	[8] = {"scrap", 75, 6, 12},
	[9] = {"scrap", 15, 12, 20},
	[10] = {"scrap", 2, 20, 40},
	--assault rifle
	[11] = {"ar2", 95, 24, 40},
	[12] = {"ar2", 5, 120, 240},
	[13] = {"smg1", 95, 30, 48},
	[14] = {"smg1", 5, 160, 240},
	[15] = {"xbowbolt", 95, 12, 20},
	[16] = {"xbowbolt", 5, 60, 100},
	[17] = {"buckshot", 95, 16, 24},
	[18] = {"buckshot", 5, 80, 120},
	--medical
	[20] = {"battery", 95, 20, 40},
	[22] = {"battery", 5, 100, 200},
	--nails
	[23] = {"gaussenergy", 100, 1, 2},
	[24] = {"gaussenergy", 40, 3, 5},
	[25] = {"gaussenergy", 12, 8, 12},
	--rifle
	[26] = {"357", 95, 8, 12},
	[27] = {"357", 5, 40, 60}
}

--Item, Weight
local drops_regular_weapon_tier1 = {
	[1] = {"weapon_zs_hammer", 5000},
	[2] = {"weapon_zs_peashooter", 1000},
	[3] = {"weapon_zs_battleaxe", 1000},
	[4] = {"weapon_zs_owens", 1000},
	[5] = {"weapon_zs_z9000", 1000},
	[6] = {"weapon_zs_blaster", 1000},
	[7] = {"weapon_zs_tosser", 1000},
	[8] = {"weapon_zs_stubber", 1000},
	[9] = {"weapon_zs_crackler", 1000},
	[10] = {"weapon_zs_minelayer", 1000},
	[11] = {"weapon_zs_peashooter_q1", 200},
	[12] = {"weapon_zs_battleaxe_q1", 100},
	[13] = {"weapon_zs_battleaxe_r1", 100},
	[14] = {"weapon_zs_owens_q1", 200},
	[15] = {"weapon_zs_z9000_q1", 200},
	[16] = {"weapon_zs_blaster_q1", 200},
	[17] = {"weapon_zs_tosser_q1", 200},
	[18] = {"weapon_zs_stubber_q1", 200},
	[19] = {"weapon_zs_crackler_q1", 200},
	[20] = {"weapon_zs_minelayer_q1", 200},
	[21] = {"weapon_zs_peashooter_q2", 50},
	[22] = {"weapon_zs_battleaxe_q2", 25},
	[23] = {"weapon_zs_battleaxe_r2", 25},
	[24] = {"weapon_zs_owens_q2", 50},
	[25] = {"weapon_zs_z9000_q2", 50},
	[26] = {"weapon_zs_blaster_q2", 50},
	[27] = {"weapon_zs_tosser_q2", 50},
	[28] = {"weapon_zs_stubber_q2", 50},
	[29] = {"weapon_zs_crackler_q2", 50},
	[30] = {"weapon_zs_minelayer_q2", 50},
	[31] = {"weapon_zs_peashooter_q3", 10},
	[32] = {"weapon_zs_battleaxe_q3", 5},
	[33] = {"weapon_zs_battleaxe_r3", 5},
	[34] = {"weapon_zs_owens_q3", 10},
	[35] = {"weapon_zs_z9000_q3", 10},
	[36] = {"weapon_zs_blaster_q3", 10},
	[37] = {"weapon_zs_tosser_q3", 10},
	[38] = {"weapon_zs_stubber_q3", 10},
	[39] = {"weapon_zs_crackler_q3", 10},
	[40] = {"weapon_zs_minelayer_q3", 10},
	[41] = {"weapon_zs_axe", 1000},
	[42] = {"weapon_zs_crowbar", 1000},
	[43] = {"weapon_zs_stunbaton", 1000},
	[44] = {"weapon_zs_swissarmyknife", 1000},
	[45] = {"weapon_zs_plank", 1000},
	[46] = {"weapon_zs_fryingpan", 1000},
	[47] = {"weapon_zs_pot", 1000},
	[48] = {"weapon_zs_ladel", 1000},
	[49] = {"weapon_zs_pipe", 1000},
	[50] = {"weapon_zs_hook", 1000},
	[51] = {"weapon_zs_lamp", 1000},
	[52] = {"weapon_zs_axe_q1", 200},
	[53] = {"weapon_zs_crowbar_q1", 200},
	[54] = {"weapon_zs_stunbaton_q1", 200},
	[55] = {"weapon_zs_swissarmyknife_q1", 200},
	[56] = {"weapon_zs_plank_q1", 200},
	[57] = {"weapon_zs_fryingpan_q1", 200},
	[58] = {"weapon_zs_pot_q1", 200},
	[59] = {"weapon_zs_ladel_q1", 200},
	[60] = {"weapon_zs_pipe_q1", 200},
	[61] = {"weapon_zs_hook_q1", 200},
	[62] = {"weapon_zs_lamp_q1", 200},
	[63] = {"weapon_zs_axe_q2", 50},
	[64] = {"weapon_zs_crowbar_q2", 50},
	[65] = {"weapon_zs_stunbaton_q2", 50},
	[66] = {"weapon_zs_swissarmyknife_q2", 50},
	[67] = {"weapon_zs_plank_q2", 50},
	[68] = {"weapon_zs_fryingpan_q2", 50},
	[69] = {"weapon_zs_pot_q2", 50},
	[70] = {"weapon_zs_ladel_q2", 50},
	[71] = {"weapon_zs_pipe_q2", 50},
	[72] = {"weapon_zs_hook_q2", 50},
	[73] = {"weapon_zs_lamp_q2", 50},
	[74] = {"weapon_zs_axe_q3", 10},
	[75] = {"weapon_zs_crowbar_q3", 10},
	[76] = {"weapon_zs_stunbaton_q3", 10},
	[77] = {"weapon_zs_swissarmyknife_q3", 10},
	[78] = {"weapon_zs_plank_q3", 10},
	[79] = {"weapon_zs_fryingpan_q3", 10},
	[80] = {"weapon_zs_pot_q3", 20},
	[81] = {"weapon_zs_ladel_q3", 10},
	[82] = {"weapon_zs_pipe_q3", 10},
	[83] = {"weapon_zs_hook_q3", 10},
	[84] = {"weapon_zs_lamp_q3", 10},
	[85] = {"weapon_zs_hammer_q1", 2000},
	[86] = {"weapon_zs_hammer_q2", 1000},
	[87] = {"weapon_zs_hammer_q3", 500},
	[88] = {"weapon_zs_electrohammer", 1500},
	[89] = {"weapon_zs_electrohammer_q1", 500},
	[90] = {"weapon_zs_electrohammer_q2", 200},
	[91] = {"weapon_zs_electrohammer_q3", 50},
	[92] = {"weapon_zs_strengthshot", 1000},
	[93] = {"weapon_zs_strengthshot_q1", 200},
	[94] = {"weapon_zs_strengthshot_q2", 50},
	[95] = {"weapon_zs_strengthshot_q3", 10},
	[96] = {"weapon_zs_strengthshot_r1", 200},
	[97] = {"weapon_zs_strengthshot_r2", 50},
	[98] = {"weapon_zs_strengthshot_r3", 10},
	[99] = {"weapon_zs_medicgun", 1000},
	[100] = {"weapon_zs_medicgun_q1", 200},
	[101] = {"weapon_zs_medicgun_q2", 50},
	[102] = {"weapon_zs_medicgun_q3", 10},
	[103] = {"weapon_zs_medicalkit", 1000},
	[104] = {"weapon_zs_medicalkit_q1", 200},
	[105] = {"weapon_zs_medicalkit_q2", 50},
	[106] = {"weapon_zs_medicalkit_q3", 10},
	[107] = {"weapon_zs_honeydipper", 1000},
	[108] = {"weapon_zs_honeydipper_q1", 200},
	[109] = {"weapon_zs_honeydipper_q2", 50},
	[110] = {"weapon_zs_honeydipper_q3", 10}
}

--Item, Weight
local drops_regular_weapon_tier2 = {
	[1] = {"weapon_zs_glock3", 1000},
	[2] = {"weapon_zs_magnum", 1000},
	[3] = {"weapon_zs_eraser", 1000},
	[4] = {"weapon_zs_sawedoff", 1000},
	[5] = {"weapon_zs_uzi", 1000},
	[6] = {"weapon_zs_annabelle", 1000},
	[7] = {"weapon_zs_inquisitor", 1000},
	[8] = {"weapon_zs_amigo", 1000},
	[9] = {"weapon_zs_hurricane", 1000},
	[10] = {"weapon_zs_fracture", 1000},
	[11] = {"weapon_zs_redeemers", 1000},
	[12] = {"weapon_zs_pushbroom", 1000},
	[13] = {"weapon_zs_shovel", 1000},
	[14] = {"weapon_zs_sledgehammer", 1000},
	[15] = {"weapon_zs_butcherknife", 1000},
	[16] = {"weapon_zs_harpoon", 1000},
	[17] = {"weapon_zs_glock3_q1", 100},
	[18] = {"weapon_zs_magnum_q1", 200},
	[19] = {"weapon_zs_eraser_q1", 200},
	[20] = {"weapon_zs_sawedoff_q1", 200},
	[21] = {"weapon_zs_uzi_q1", 200},
	[22] = {"weapon_zs_annabelle_q1", 200},
	[23] = {"weapon_zs_inquisitor_q1", 200},
	[24] = {"weapon_zs_amigo_q1", 200},
	[25] = {"weapon_zs_hurricane_q1", 200},
	[26] = {"weapon_zs_fracture_q1", 200},
	[27] = {"weapon_zs_redeemers_q1", 100},
	[28] = {"weapon_zs_pushbroom_q1", 200},
	[29] = {"weapon_zs_shovel_q1", 200},
	[30] = {"weapon_zs_sledgehammer_q1", 200},
	[31] = {"weapon_zs_butcherknife_q1", 100},
	[32] = {"weapon_zs_harpoon_r1", 200},
	[33] = {"weapon_zs_glock3_q2", 26},
	[34] = {"weapon_zs_magnum_q2", 50},
	[35] = {"weapon_zs_eraser_q2", 50},
	[36] = {"weapon_zs_sawedoff_q2", 50},
	[37] = {"weapon_zs_uzi_q2", 50},
	[38] = {"weapon_zs_annabelle_q2", 50},
	[39] = {"weapon_zs_inquisitor_q2", 50},
	[40] = {"weapon_zs_amigo_q2", 50},
	[41] = {"weapon_zs_hurricane_q2", 50},
	[42] = {"weapon_zs_fracture_q2", 50},
	[43] = {"weapon_zs_redeemers_q2", 25},
	[44] = {"weapon_zs_pushbroom_q2", 50},
	[45] = {"weapon_zs_shovel_q2", 50},
	[46] = {"weapon_zs_sledgehammer_q2", 50},
	[47] = {"weapon_zs_butcherknife_q2", 25},
	[48] = {"weapon_zs_harpoon_r2", 50},
	[49] = {"weapon_zs_glock3_q3", 6},
	[50] = {"weapon_zs_magnum_q3", 10},
	[51] = {"weapon_zs_eraser_q3", 10},
	[52] = {"weapon_zs_sawedoff_q3", 10},
	[53] = {"weapon_zs_uzi_q3", 10},
	[54] = {"weapon_zs_annabelle_q3", 10},
	[55] = {"weapon_zs_inquisitor_q3", 10},
	[56] = {"weapon_zs_amigo_q3", 10},
	[57] = {"weapon_zs_hurricane_q3", 10},
	[58] = {"weapon_zs_fracture_q3", 10},
	[59] = {"weapon_zs_redeemers_q3", 5},
	[60] = {"weapon_zs_pushbroom_q3", 10},
	[61] = {"weapon_zs_shovel_q3", 10},
	[62] = {"weapon_zs_sledgehammer_q3", 10},
	[63] = {"weapon_zs_butcherknife_q3", 5},
	[64] = {"weapon_zs_harpoon_r3", 10},
	[65] = {"weapon_zs_glock3_r1", 50},
	[66] = {"weapon_zs_glock3_r2", 12},
	[67] = {"weapon_zs_glock3_r3", 2},
	[68] = {"weapon_zs_glock3_s1", 50},
	[69] = {"weapon_zs_glock3_s2", 12},
	[70] = {"weapon_zs_glock3_s3", 2},
	[71] = {"weapon_zs_galestorm", 500},
	[72] = {"weapon_zs_galestorm_q1", 100},
	[73] = {"weapon_zs_galestorm_q2", 25},
	[74] = {"weapon_zs_galestorm_q3", 5},
	[75] = {"weapon_zs_stabber", 500},
	[76] = {"weapon_zs_stabber_q1", 100},
	[77] = {"weapon_zs_stabber_q2", 25},
	[78] = {"weapon_zs_stabber_q3", 5},
	[79] = {"weapon_zs_redeemers_r1", 100},
	[80] = {"weapon_zs_redeemers_r2", 25},
	[81] = {"weapon_zs_redeemers_r3", 5},
	[82] = {"weapon_zs_butcherknife_r1", 100},
	[83] = {"weapon_zs_butcherknife_r2", 25},
	[84] = {"weapon_zs_butcherknife_r3", 5}
}
	
--Item, Weight
local drops_regular_weapon_tier3 = {
	[1] = {"weapon_zs_deagle", 1000},
	[2] = {"weapon_zs_tempest", 1000},
	[3] = {"weapon_zs_ender", 1000},
	[4] = {"weapon_zs_smg", 1000},
	[5] = {"weapon_zs_silencer", 1000},
	[6] = {"weapon_zs_hunter", 1000},
	[7] = {"weapon_zs_onyx", 1000},
	[8] = {"weapon_zs_akbar", 1000},
	[9] = {"weapon_zs_oberon", 1000},
	[10] = {"weapon_zs_hyena", 1000},
	[11] = {"weapon_zs_pollutor", 1000},
	[12] = {"weapon_zs_crossbow", 1000},
	[13] = {"weapon_zs_enkindler", 1000},
	[14] = {"weapon_zs_longsword", 1000},
	[15] = {"weapon_zs_executioner", 1000},
	[16] = {"weapon_zs_meattenderizer", 1000},
	[17] = {"weapon_zs_deagle_q1", 150},
	[18] = {"weapon_zs_tempest_q1", 50},
	[19] = {"weapon_zs_tempest_r1", 50},
	[20] = {"weapon_zs_tempest_s1", 50},
	[21] = {"weapon_zs_ender_q1", 150},
	[22] = {"weapon_zs_smg_q1", 75},
	[23] = {"weapon_zs_smg_r1", 75},
	[24] = {"weapon_zs_silencer_q1", 150},
	[25] = {"weapon_zs_hunter_q1", 75},
	[26] = {"weapon_zs_hunter_r1", 75},
	[27] = {"weapon_zs_onyx_q1", 150},
	[28] = {"weapon_zs_akbar_q1", 75},
	[29] = {"weapon_zs_oberon_q1", 150},
	[30] = {"weapon_zs_hyena_q1", 150},
	[31] = {"weapon_zs_pollutor_q1", 50},
	[32] = {"weapon_zs_pollutor_r1", 550},
	[33] = {"weapon_zs_pollutor_s1", 550},
	[34] = {"weapon_zs_crossbow_q1", 150},
	[35] = {"weapon_zs_enkindler_q1", 150},
	[36] = {"weapon_zs_longsword_q1", 75},
	[37] = {"weapon_zs_longsword_r1", 75},
	[38] = {"weapon_zs_executioner_q1", 150},
	[39] = {"weapon_zs_meattenderizer_q1", 150},
	[40] = {"weapon_zs_deagle_q2", 15},
	[41] = {"weapon_zs_tempest_q2", 5},
	[42] = {"weapon_zs_tempest_r2", 5},
	[43] = {"weapon_zs_tempest_s2", 5},
	[44] = {"weapon_zs_ender_q2", 15},
	[45] = {"weapon_zs_smg_q2", 15},
	[46] = {"weapon_zs_smg_r2", 15},
	[47] = {"weapon_zs_silencer_q2", 15},
	[48] = {"weapon_zs_hunter_q2", 8},
	[49] = {"weapon_zs_hunter_r2", 7},
	[50] = {"weapon_zs_onyx_q2", 15},
	[51] = {"weapon_zs_akbar_q2", 8},
	[52] = {"weapon_zs_oberon_q2", 15},
	[53] = {"weapon_zs_hyena_q2", 15},
	[54] = {"weapon_zs_pollutor_q2", 5},
	[55] = {"weapon_zs_pollutor_r2", 5},
	[56] = {"weapon_zs_pollutor_s2", 5},
	[57] = {"weapon_zs_crossbow_q2", 15},
	[58] = {"weapon_zs_enkindler_q2", 15},
	[59] = {"weapon_zs_longsword_q2", 8},
	[60] = {"weapon_zs_longsword_r2", 7},
	[61] = {"weapon_zs_executioner_q2", 15},
	[62] = {"weapon_zs_meattenderizer_q2", 15},
	[63] = {"weapon_zs_deagle_q3", 4},
	[64] = {"weapon_zs_tempest_q3", 2},
	[65] = {"weapon_zs_tempest_r3", 1},
	[66] = {"weapon_zs_tempest_s3", 1},
	[67] = {"weapon_zs_ender_q3", 4},
	[68] = {"weapon_zs_smg_q3", 2},
	[69] = {"weapon_zs_smg_r3", 2},
	[70] = {"weapon_zs_silencer_q3", 4},
	[71] = {"weapon_zs_hunter_q3", 2},
	[72] = {"weapon_zs_hunter_r3", 2},
	[73] = {"weapon_zs_onyx_q3", 4},
	[74] = {"weapon_zs_akbar_q3", 2},
	[75] = {"weapon_zs_oberon_q3", 4},
	[76] = {"weapon_zs_hyena_q3", 4},
	[77] = {"weapon_zs_pollutor_q3", 2},
	[78] = {"weapon_zs_pollutor_r3", 1},
	[79] = {"weapon_zs_pollutor_s3", 1},
	[80] = {"weapon_zs_crossbow_q3", 4},
    [81] = {"weapon_zs_enkindler_q3", 4},
    [82] = {"weapon_zs_longsword_q3", 2},
    [83] = {"weapon_zs_longsword_r3", 2},
    [84] = {"weapon_zs_executioner_q3", 4},
    [85] = {"weapon_zs_meattenderizer_q3", 4},
    [86] = {"weapon_zs_medicrifle", 2000},
    [87] = {"weapon_zs_medicrifle_q1", 150},
    [88] = {"weapon_zs_medicrifle_q2", 15},
    [89] = {"weapon_zs_medicrifle_q3", 4},
    [90] = {"weapon_zs_medicrifle_r1", 150},
    [91] = {"weapon_zs_medicrifle_r2", 15},
    [92] = {"weapon_zs_medicrifle_r3", 4},
	[93] = {"weapon_zs_akbar_r1", 75},
	[94] = {"weapon_zs_akbar_r2", 7},
	[95] = {"weapon_zs_akbar_r3", 2}
}
	
--Item, Weight
local drops_regular_weapon_tier4 = {
	[1] = {"weapon_zs_longarm", 1000},
	[2] = {"weapon_zs_sweepershotgun", 1000},
	[3] = {"weapon_zs_jackhammer", 1000},
	[4] = {"weapon_zs_bulletstorm", 1000},
	[5] = {"weapon_zs_reaper", 1000},
	[6] = {"weapon_zs_quicksilver", 1000},
	[7] = {"weapon_zs_slugrifle", 1000},
	[8] = {"weapon_zs_m4", 1000},
	[9] = {"weapon_zs_smelter", 1000},
	[10] = {"weapon_zs_inferno", 1000},
	[11] = {"weapon_zs_quasar", 1000},
	[12] = {"weapon_zs_barrage", 1000},
	[13] = {"weapon_zs_asmd", 1000},
	[14] = {"weapon_zs_charon", 1000},
	[15] = {"weapon_zs_spinfusor", 1000},
	[16] = {"weapon_zs_graveshovel", 1000},
	[17] = {"weapon_zs_kongolaxe", 1000},
	[18] = {"weapon_zs_scythe", 1000},
	[19] = {"weapon_zs_rebarmace", 1000},
	[20] = {"weapon_zs_longarm_q1", 1000},
	[21] = {"weapon_zs_sweepershotgun_q1", 125},
	[22] = {"weapon_zs_sweepershotgun_r1", 125},
	[23] = {"weapon_zs_jackhammer_q1", 125},
	[24] = {"weapon_zs_bulletstorm_r1", 63},
	[25] = {"weapon_zs_reaper_q1", 125},
	[26] = {"weapon_zs_quicksilver_q1", 125},
	[27] = {"weapon_zs_slugrifle_q1", 125},
	[28] = {"weapon_zs_m4_q1", 63},
	[29] = {"weapon_zs_smelter_q1", 125},
	[30] = {"weapon_zs_inferno_q1", 125},
	[31] = {"weapon_zs_inferno_r1", 125},
	[32] = {"weapon_zs_quasar_q1", 125},
	[33] = {"weapon_zs_quasar_q1", 125},
	[34] = {"weapon_zs_barrage_q1", 125},
	[35] = {"weapon_zs_asmd_q1", 125},
	[36] = {"weapon_zs_charon_q1", 125},
	[37] = {"weapon_zs_spinfusor_q1", 125},
	[38] = {"weapon_zs_graveshovel_q1", 125},
	[39] = {"weapon_zs_kongolaxe_q", 63},
	[40] = {"weapon_zs_scythe_q1", 125},
	[41] = {"weapon_zs_rebarmace_q1", 125},
	[42] = {"weapon_zs_rebarmace_r1", 125},
	[43] = {"weapon_zs_longarm_q2", 12},
	[44] = {"weapon_zs_sweepershotgun_q2", 12},
	[45] = {"weapon_zs_sweepershotgun_r2", 12},
	[46] = {"weapon_zs_jackhammer_q2", 12},
	[47] = {"weapon_zs_bulletstorm_q2", 6},
	[48] = {"weapon_zs_reaper_q2", 12},
	[49] = {"weapon_zs_quicksilver_q2", 12},
	[50] = {"weapon_zs_slugrifle_q2", 12},
	[51] = {"weapon_zs_m4_q2", 6},
	[52] = {"weapon_zs_smelter_q2", 12},
	[53] = {"weapon_zs_inferno_q2", 12},
	[54] = {"weapon_zs_inferno_r2", 12},
	[55] = {"weapon_zs_quasar_q2", 12},
	[56] = {"weapon_zs_quasar_q2", 12},
	[57] = {"weapon_zs_barrage_q2", 12},
	[58] = {"weapon_zs_asmd_q2", 12},
	[59] = {"weapon_zs_charon_q2", 12},
	[60] = {"weapon_zs_spinfusor_q2", 12},
	[61] = {"weapon_zs_graveshovel_q2", 12},
	[62] = {"weapon_zs_kongolaxe_q2", 6},
	[63] = {"weapon_zs_scythe_q2", 12},
	[64] = {"weapon_zs_rebarmace_q2", 12},
	[65] = {"weapon_zs_rebarmace_r2", 12},
	[66] = {"weapon_zs_longarm_q3", 2},
	[67] = {"weapon_zs_sweepershotgun_q3", 2},
	[68] = {"weapon_zs_sweepershotgun_r3", 2},
	[69] = {"weapon_zs_jackhammer_q3", 2},
	[70] = {"weapon_zs_bulletstorm_q3", 1},
	[71] = {"weapon_zs_reaper_q3", 2},
	[72] = {"weapon_zs_quicksilver_q3", 2},
	[73] = {"weapon_zs_slugrifle_q3", 2},
	[74] = {"weapon_zs_m4_q3", 1},
	[75] = {"weapon_zs_smelter_q3", 2},
	[76] = {"weapon_zs_inferno_q3", 2},
	[77] = {"weapon_zs_inferno_r3", 2},
	[78] = {"weapon_zs_quasar_q3", 2},
	[79] = {"weapon_zs_quasar_q3", 2},
	[80] = {"weapon_zs_barrage_q3", 2},
	[81] = {"weapon_zs_asmd_q3", 2},
	[82] = {"weapon_zs_charon_q3", 2},
	[83] = {"weapon_zs_spinfusor_q3", 2},
	[84] = {"weapon_zs_graveshovel_q3", 2},
	[85] = {"weapon_zs_kongolaxe_q3", 1},
	[86] = {"weapon_zs_scythe_q3", 2},
	[87] = {"weapon_zs_rebarmace_q3", 2},
	[88] = {"weapon_zs_rebarmace_r3", 2},
	[89] = {"weapon_zs_healingray", 2000},
	[90] = {"weapon_zs_healingray_q1", 200},
	[91] = {"weapon_zs_healingray_q2", 20},
	[92] = {"weapon_zs_healingray_q3", 2},
	[93] = {"weapon_zs_m4_r1", 62},
	[94] = {"weapon_zs_m4_r2", 6},
	[95] = {"weapon_zs_m4_r3", 1},
	[96] = {"weapon_zs_bulletstorm_r1", 62},
	[97] = {"weapon_zs_bulletstorm_r2", 6},
	[98] = {"weapon_zs_bulletstorm_r3", 1},
	[99] = {"weapon_zs_kongolaxe_q", 62},
	[100] = {"weapon_zs_kongolaxe_q2", 6},
	[101] = {"weapon_zs_kongolaxe_q3", 1}
}
	
--Item, Weight
local drops_regular_weapon_tier5 = {
	[1] = {"weapon_zs_artemis", 30000},
	[2] = {"weapon_zs_novacolt", 30000},
	[3] = {"weapon_zs_bulwark", 30000},
	[4] = {"weapon_zs_zeus", 30000},
	[5] = {"weapon_zs_juggernaut", 30000},
	[6] = {"weapon_zs_scar", 30000},
	[7] = {"weapon_zs_boomstick", 30000},
	[8] = {"weapon_zs_deathdealers", 30000},
	[9] = {"weapon_zs_colossus", 30000},
	[10] = {"weapon_zs_renegade", 30000},
	[11] = {"weapon_zs_pulserifle", 30000},
	[12] = {"weapon_zs_gluon", 30000},
	[13] = {"weapon_zs_broadside", 30000},
	[14] = {"weapon_zs_innervator", 30000},
	[15] = {"weapon_zs_frotchet", 30000},
	[16] = {"weapon_zs_powerfists", 30000},
	[17] = {"weapon_zs_artemis_q1", 1500},
	[18] = {"weapon_zs_artemis_r1", 1500},
	[19] = {"weapon_zs_novacolt_q1", 3000},
	[20] = {"weapon_zs_bulwark_q1", 3000},
	[21] = {"weapon_zs_zeus_q1", 3000},
	[22] = {"weapon_zs_juggernaut_q1", 3000},
	[23] = {"weapon_zs_scar_q1", 1500},
	[24] = {"weapon_zs_scar_r1", 1500},
	[25] = {"weapon_zs_boomstick_q1", 3000},
	[26] = {"weapon_zs_deathdealers_q1", 3000},
	[27] = {"weapon_zs_colossus_q1", 1500},
	[28] = {"weapon_zs_colossus_r1", 1500},
	[29] = {"weapon_zs_renegade_q1", 1500},
	[30] = {"weapon_zs_renegade_r1", 1500},
	[31] = {"weapon_zs_pulserifle_q1", 1500},
	[32] = {"weapon_zs_pulserifle_r1", 1500},
	[33] = {"weapon_zs_gluon_q1", 750},
	[34] = {"weapon_zs_gluon_r1", 750},
	[35] = {"weapon_zs_gluon_s1", 750},
	[36] = {"weapon_zs_broadside_q1", 1500},
	[37] = {"weapon_zs_broadside_r1", 1500},
	[38] = {"weapon_zs_innervator_q1", 3000},
	[39] = {"weapon_zs_frotchet_q1", 3000},
	[40] = {"weapon_zs_powerfists_q1", 3000},
	[41] = {"weapon_zs_artemis_q2", 150},
	[42] = {"weapon_zs_artemis_r2", 150},
	[43] = {"weapon_zs_novacolt_q2", 300},
	[44] = {"weapon_zs_bulwark_q2", 300},
	[45] = {"weapon_zs_zeus_q2", 300},
	[46] = {"weapon_zs_juggernaut_q2", 300},
	[47] = {"weapon_zs_scar_q2", 150},
	[48] = {"weapon_zs_scar_r2", 150},
	[49] = {"weapon_zs_boomstick_q2", 300},
	[50] = {"weapon_zs_deathdealers_q2", 300},
	[51] = {"weapon_zs_colossus_q2", 150},
	[52] = {"weapon_zs_colossus_r2", 150},
	[53] = {"weapon_zs_renegade_q2", 150},
	[54] = {"weapon_zs_renegade_r2", 150},
	[55] = {"weapon_zs_pulserifle_q2", 150},
	[56] = {"weapon_zs_pulserifle_r2", 150},
	[57] = {"weapon_zs_gluon_q2", 75},
	[58] = {"weapon_zs_gluon_r2", 75},
	[59] = {"weapon_zs_gluon_s2", 75},
	[60] = {"weapon_zs_broadside_q2", 150},
	[61] = {"weapon_zs_broadside_r2", 150},
	[62] = {"weapon_zs_innervator_q2", 300},
	[63] = {"weapon_zs_frotchet_q2", 300},
	[64] = {"weapon_zs_powerfists_q2", 300},
	[65] = {"weapon_zs_artemis_q3", 15},
	[66] = {"weapon_zs_artemis_r3", 15},
	[67] = {"weapon_zs_novacolt_q3", 30},
	[68] = {"weapon_zs_bulwark_q3", 30},
	[69] = {"weapon_zs_zeus_q3", 30},
	[70] = {"weapon_zs_juggernaut_q3", 30},
	[71] = {"weapon_zs_scar_q3", 15},
	[72] = {"weapon_zs_scar_r3", 15},
	[73] = {"weapon_zs_boomstick_q3", 30},
	[74] = {"weapon_zs_deathdealers_q3", 30},
	[75] = {"weapon_zs_colossus_q3", 15},
	[76] = {"weapon_zs_colossus_r3", 15},
	[77] = {"weapon_zs_renegade_q3", 15},
	[78] = {"weapon_zs_renegade_r3", 15},
	[79] = {"weapon_zs_pulserifle_q3", 15},
	[80] = {"weapon_zs_pulserifle_r3", 15},
	[81] = {"weapon_zs_gluon_q3", 9},
	[82] = {"weapon_zs_gluon_r3", 7},
	[83] = {"weapon_zs_gluon_s3", 7},
	[84] = {"weapon_zs_broadside_q3", 15},
	[85] = {"weapon_zs_broadside_r3", 15},
	[86] = {"weapon_zs_innervator_q3", 30},
	[87] = {"weapon_zs_frotchet_q3", 30},
	[88] = {"weapon_zs_powerfists_q3", 30},
	[89] = {"weapon_zs_gluon_t1", 750},
	[90] = {"weapon_zs_gluon_t2", 75},
	[91] = {"weapon_zs_gluon_r3", 7}
}

--Item, Weight
local drops_regular_trinket = {
	-- [1] = {"trinket_glimmeringcore", 1},
	-- [2] = {"trinket_scavcore", 1},
	-- [3] = {"trinket_rubysplinter", 1},
	-- [4] = {"trinket_gleamingcore", 1},
	-- [5] = {"trinket_shimmeringcore", 1},
	-- [6] = {"trinket_magneticcore", 1},
	-- [7] = {"trinket_bloodstonesplinter", 1},
	-- [8] = {"trinket_chromiumfragment", 1},
	-- [9] = {"trinket_redruby", 1},
	
	[1] = {"trinket_redruby", 20},
	[2] = {"trinket_chromiumfragment", 20},
	[3] = {"trinket_bloodstonesplinter", 20},
	[4] = {"trinket_scavcore", 20},
	[5] = {"trinket_rubysplinter", 20},
	[6] = {"trinket_pinkruby", 20},
	[7] = {"trinket_welfarepearl", 20},
	[8] = {"trinket_opalwhite", 18},
	[9] = {"trinket_opalblack", 2},
	[10] = {"trinket_opalpink", 20}
}

--Item, Weight
local drops_components_lodestones = {
	[1] = {"comp_tachyonic_lodestone", 1},
	[2] = {"comp_chromatic_lodestone", 1},
	[3] = {"comp_sparking_lodestone", 10}
}

--Item, Weight
local drops_components_metallic = {
	[1] = {"comp_silver", 200},
	[2] = {"comp_gold", 100},
	[3] = {"comp_electrum", 10},
	[4] = {"comp_platinum", 10},
	[5] = {"comp_iridium", 1}
}

--Item, Weight
local drops_trinket_phantom = {
	[1] = {"trinket_phantom_base", 1}
}

--Item, Weight
local drops_regular_other = {
	[1] = {"weapon_zs_arsenalcrate", 100},
	[2] = {"weapon_zs_resupplybox", 100},
	[3] = {"weapon_zs_remantler", 100},
	[4] = {"weapon_zs_sigilfragment", 100},
	[5] = {"weapon_zs_corruptedfragment", 20}
}

function MakeDrop(dropTable, drop, pos)
	if dropTable == drops_regular_ammo then
		ent = ents.Create("prop_ammo")
		if ent:IsValid() then
			local heading = VectorRand():GetNormalized()
			ent:SetAmmoType(drop[1])
			ent:SetAmmo(math.random(drop[3], drop[4]))
			ent:SetPos(pos + heading * 8)
			ent:SetAngles(VectorRand():Angle())
			ent:Spawn()

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:ApplyForceOffset(heading * math.Rand(8000, 32000), pos)
			end
			timer.Simple(240, function() 
				if ent:IsValid() then
					ent:Remove() 
				end
			end)
		end
	else
	
		local inv = string.sub(drop[1], 1, 4) ~= "weap"
		local ent = ents.Create(inv and "prop_invitem" or "prop_weapon")
		
		if ent:IsValid() then
			ent:SetPos(pos)
			ent:SetAngles(AngleRand())
			if inv then
				ent:SetInventoryItemType(drop[1])
			else
				ent:SetWeaponType(drop[1])
			end
			ent:Spawn()
			if not inv then
				local weapon = weapons.Get(drop[1])
				ent:SetClip1(weapon.Primary.ClipSize)
			end

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()
				phys:SetVelocityInstantaneous(VectorRand():GetNormalized() * math.Rand(24, 100))
				phys:AddAngleVelocity(VectorRand() * 200)
			end
			if dropTable == drops_regular_consumables then
				timer.Simple(240, function() 
					if ent:IsValid() then
						ent:Remove() 
					end
				end)
			else 
				timer.Simple(480, function() 
					if ent:IsValid() then
						ent:Remove() 
					end
				end)
			end
		end
	end
end

function DirectDrop(dropTable, drop, pos, atkr)
	if dropTable == drops_regular_ammo then
		atkr:GiveAmmo(math.random(drop[3], drop[4]), drop[1])
	else	
		if atkr:HasWeapon(drop[1]) and dropTable == drops_regular_other then
			local weapon = weapons.Get(drop[1])
			atkr:GiveAmmo(weapon.Primary.ClipSize, weapon.Primary.Ammo)
		elseif atkr:HasWeapon(drop[1]) or atkr:HasTrinket(string.Replace(drop[1], "trinket_", "")) then
			if pos then
				MakeDrop(dropTable, drop, pos)
			end
		else
			if string.find(drop[1], "trinket_") then
				if not atkr:HasTrinket(string.Replace(drop[1], "trinket_", "")) then
					atkr:AddInventoryItem(drop[1])
				else
					if pos then
						MakeDrop(dropTable, drop, pos)
					end
				end
			elseif string.find(drop[1], "comp_") then
				if not atkr:HasInventoryItem(drop[1]) then
					atkr:AddInventoryItem(drop[1])
				else
					if pos then
						MakeDrop(dropTable, drop, pos)
					end
				end
			else
				atkr:Give(drop[1])
			end
		end
	end
end

function DoDropBoss(pl, atkr)
	local rng = math.random(1,10000)
	local dropTable
	local drop
	
	if rng <= 2000 then
		local rng3 = math.random(1,100)
		if rng3 <= 98 and rng3 > 80 then
			dropTable = drops_regular_weapon_tier4
		elseif rng3 > 98 then
			dropTable = drops_regular_weapon_tier5
		else
			dropTable = drops_regular_weapon_tier3
		end
	elseif rng <= 4000 and rng > 2000 then
		dropTable = drops_components_lodestones
	else
		dropTable = drops_regular_trinket
	end
	
	drop = DropThinkWeight(dropTable)
	
	local pos = pl:LocalToWorld(pl:OBBCenter())
	
	MakeDrop(dropTable, drop, pos)
end

function DoDropBoss2(pl, atkr)
	local dropTable = drops_trinket_phantom
	local drop = DropThinkWeight(dropTable)	
	local pos = pl:LocalToWorld(pl:OBBCenter())
	
	MakeDrop(dropTable, drop, pos)
end

function DoDropTechnician(pl)
	local rng = math.random(1,100)
	local drop = "scrap"
	
	if rng > 0 and rng <= 25 then
		drop = {"weapon_zs_hammer"}
	elseif rng > 25 and rng <= 50 then
		drop = {"weapon_zs_medicalkit"}
	elseif rng > 50 and rng <= 58 then
		drop = {DropThinkWeight(drops_regular_weapon_tier2)}
	elseif rng > 58 and rng <= 60 then
		drop = {DropThinkWeight(drops_regular_weapon_tier3)}
	end
	
	if drop == "scrap" then
		pl:GiveAmmo(10, "scrap")
	else
		DirectDrop(nil, drop[1], nil, pl)
	end
end

function DropThinkWeight(dropTable)
	local weightTotal = 0
	local counter = 0
	
	for k, v in pairs(dropTable) do
		weightTotal = weightTotal + v[2]
	end
	
	local rng = math.random(1, weightTotal)
	
	for k, v in pairs(dropTable) do
		counter = counter + v[2]
		if counter >= rng then
			return v
		end
	end
end

normalDrops = {
[1] = {drops_regular_consumables, 10},
[2] = {drops_regular_ammo, 8},
[3] = {"weapon", 2},
[4] = {drops_regular_trinket, 2},
[5] = {drops_components_lodestones, 0.1},
[6] = {drops_components_metallic, 2.5},
[7] = {drops_trinket_phantom, 0.1},
[8] = {drops_regular_other, 2}
}

bossDrops = {
[1] = {"weapon", 100},
[2] = {drops_regular_trinket, 50},
[3] = {drops_components_lodestones, 10},
[4] = {drops_components_metallic, 80},
[5] = {drops_trinket_phantom, 100},
[6] = {drops_regular_other, 50}
}

function DoDrop(pl, atkr, dropCategory)
	local drops = {}
	local plDropMul = 1
	local eventDropMul = 1
	
	for k, v in pairs(dropCategory) do	
		if math.Round(v[2] * 10000 * plDropMul * eventDropMul, 0) > math.random(1,1000000) then
			if v[1] == drops_regular_ammo then
				if math.random(1, 100) <= math.floor((atkr.AmmoToCacheChance or 0) * 100) then
					if math.random(1, 20) < 20 then
						atkr.StowageCaches = (atkr.StowageCaches or 0) + 1
						
					else
						atkr.StowageCaches = (atkr.StowageCaches or 0) + 3
					end
					net.Start("zs_stowagecaches")
					net.WriteInt(atkr.StowageCaches, 8)
					net.Send(atkr)
				else
					table.insert(drops, drops_regular_ammo)
				end
			elseif v[1] == "weapon" then
				local rng = math.random(1,1000)
				if rng <= 950 and rng > 850 then
					table.insert(drops, drops_regular_weapon_tier2)
				elseif rng <= 990 and rng > 950 then
					table.insert(drops, drops_regular_weapon_tier3)
				elseif rng <= 998 and rng > 990 then
					table.insert(drops, drops_regular_weapon_tier4)
				elseif rng > 998 then
					table.insert(drops, drops_regular_weapon_tier5)
				else
					table.insert(drops, drops_regular_weapon_tier1)
				end
			else	
				table.insert(drops, v[1])
			end
		end
	end
	
	if not table.IsEmpty(drops) then
		for k, v in pairs(drops) do
			local pos = pl:LocalToWorld(pl:OBBCenter())

			timer.Simple(k / 10, function() MakeDrop(v, DropThinkWeight(v), pos) end)
		end
	end
end

-- function DoDrop(pl, atkr)
	-- local drops = {}
	-- local plDropMul = 1
	-- local eventDropMul = 1
	
	-- --Food drops
	-- local dropChanceFood = 10 * 10000 * plDropMul * eventDropMul
	-- if math.Round(dropChanceFood, 0) > math.random(1,1000000) then
		-- table.insert(drops, drops_regular_consumables)
	-- end
	
	-- --Ammo drops
	-- local dropChanceAmmo = 8 * 10000 * plDropMul * eventDropMul
	-- if math.Round(dropChanceAmmo, 0) > math.random(1,1000000) then
		-- if math.random(1, 100) <= math.floor((atkr.AmmoToCacheChance or 0) * 100) then
			-- if math.random(1, 20) < 20 then
				-- atkr.StowageCaches = (atkr.StowageCaches or 0) + 1
				
			-- else
				-- atkr.StowageCaches = (atkr.StowageCaches or 0) + 3
			-- end
			-- net.Start("zs_stowagecaches")
			-- net.WriteInt(atkr.StowageCaches, 8)
			-- net.Send(atkr)
		-- else
			-- table.insert(drops, drops_regular_ammo)
		-- end
	-- end
	
	-- --Weapon drops
	-- local dropChanceWeapon = 1.5 * 10000 * plDropMul * eventDropMul
	-- if math.Round(dropChanceWeapon, 0) > math.random(1,1000000) then
		-- local rng = math.random(1,1000)
		-- if rng <= 950 and rng > 850 then
			-- table.insert(drops, drops_regular_weapon_tier2)
		-- elseif rng <= 990 and rng > 950 then
			-- table.insert(drops, drops_regular_weapon_tier3)
		-- elseif rng <= 998 and rng > 990 then
			-- table.insert(drops, drops_regular_weapon_tier4)
		-- elseif rng > 998 then
			-- table.insert(drops, drops_regular_weapon_tier5)
		-- else
			-- table.insert(drops, drops_regular_weapon_tier1)
		-- end
	-- end
	
	-- --Trinket drops
	-- local dropChanceTrinket = 1 * 10000 * plDropMul * eventDropMul
	-- if math.Round(dropChanceTrinket, 0) > math.random(1,1000000) then
		-- table.insert(drops, drops_regular_trinket)
	-- end
	
	-- --Lodestone drops
	-- local dropChanceLodestone = 0.2 * 10000 * plDropMul * eventDropMul
	-- if math.Round(dropChanceLodestone, 0) > math.random(1,1000000) then
		-- table.insert(drops, drops_components_lodestones)
	-- end
	
	-- --Metallic drops
	-- local dropChanceMetallic = 2 * 10000 * plDropMul * eventDropMul
	-- if math.Round(dropChanceMetallic, 0) > math.random(1,1000000) then
		-- table.insert(drops, drops_components_metallic)
	-- end
	
	-- --Phantom essence
	-- local dropChancePhantom = 0.1 * 10000 * plDropMul * eventDropMul
	-- if math.Round(dropChancePhantom, 0) > math.random(1,1000000) then
		-- table.insert(drops, drops_trinket_phantom)
	-- end
	
	-- if not table.IsEmpty(drops) then
		-- for k, v in pairs(drops) do
			-- local pos = pl:LocalToWorld(pl:OBBCenter())

			-- timer.Simple(k / 10, function() MakeDrop(v, DropThinkWeight(v), pos) end)
		-- end
	-- end
-- end

--Break the drop function into two precursor functions that allow for inputing different droprates.