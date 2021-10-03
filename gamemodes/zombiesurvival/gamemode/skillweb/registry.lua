GM.Skills = {}
GM.SkillModifiers = {}
GM.SkillFunctions = {}
GM.SkillModifierFunctions = {}

function GM:AddSkill(id, name, description, x, y, connections, tree)
	local skill = {Connections = table.ToAssoc(connections or {})}

	if CLIENT then
		skill.x = x
		skill.y = y

		-- TODO: Dynamic skill descriptions based on modifiers on the skill.

		skill.Description = description
	end

	if #name == 0 then
		name = "Skill "..id
		skill.Disabled = true
	end

	skill.Name = name
	skill.Tree = tree

	self.Skills[id] = skill

	return skill
end

-- Use this after all skills have been added. It assigns dynamic IDs!
function GM:AddTrinket(name, swepaffix, pairedweapon, veles, weles, tier, description, status, stocks)
	local skill = {Connections = {}}

	skill.Name = name
	skill.Trinket = swepaffix
	skill.Status = status

	local datatab = {PrintName = name, DroppedEles = weles, Tier = tier, Description = description, Status = status, Stocks = stocks}

	if pairedweapon then
		skill.PairedWeapon = "weapon_zs_t_" .. swepaffix
	end

	self.ZSInventoryItemData["trinket_" .. swepaffix] = datatab
	self.Skills[#self.Skills + 1] = skill

	return #self.Skills, self.ZSInventoryItemData["trinket_" .. swepaffix]
end

-- I'll leave this here, but I don't think it's needed.
function GM:GetTrinketSkillID(trinketname)
	for skillid, skill in pairs(GM.Skills) do
		if skill.Trinket and skill.Trinket == trinketname then
			return skillid
		end
	end
end

function GM:AddSkillModifier(skillid, modifier, amount)
	self.SkillModifiers[skillid] = self.SkillModifiers[skillid] or {}
	self.SkillModifiers[skillid][modifier] = (self.SkillModifiers[skillid][modifier] or 0) + amount
end

function GM:AddSkillFunction(skillid, func)
	self.SkillFunctions[skillid] = self.SkillFunctions[skillid] or {}
	table.insert(self.SkillFunctions[skillid], func)
end

function GM:SetSkillModifierFunction(modid, func)
	self.SkillModifierFunctions[modid] = func
end

function GM:MkGenericMod(modifiername)
	return function(pl, amount) pl[modifiername] = math.Clamp(amount + 1.0, 0.0, 1000.0) end
end

-- These are used for position on the screen
TREE_HEALTHTREE = 1
TREE_SPEEDTREE = 2
TREE_SUPPORTTREE = 3
TREE_TECHNICIAN = 4
TREE_MELEETREE = 5
TREE_GUNTREE = 6

-- Dummy skill used for "connecting" to their trees.
SKILL_NONE = 0

--[[
SKILL_U_AMMOCRATE = 0 -- Unlock alternate arsenal crate that only sells cheap ammo (remove from regular?)
SKILL_U_DECOY = 0 -- "Unlock: Decoy", "Unlocks purchasing the Decoy\nZombies believe it is a human\nCan be destroyed\nExplodes when destroyed"

SKILL_OVERCHARGEFLASHLIGHT = 0 -- Your flashlight now produces a blinding flash that stuns zombies\nYour flashlight now breaks after one use

Unlock: Explosive body armor - Allows you to purchase explosive body armor, which knocks back both you and nearby zombies when you fall below 25 hp.
Olympian - +50% throw power\nsomething bad
Unlock: Antidote Medic Gun - Unlocks purchasing the Antidote Medic Gun\nTarget poison damage resistance +100%\nTarget immediately cleansed of all debuffs\nTarget is no longer healed or hastened
]]

-- unimplemented

SKILL_TECH_START = 1
SKILL_TECH_CADE_REPAIR1 = 2
SKILL_TECH_CADE_REPAIR2 = 3
SKILL_TECH_CADE_REPAIR3 = 4
SKILL_TECH_CADE_REPAIR4 = 5
SKILL_TECH_CADE_REPAIR5 = 6
SKILL_TECH_CADE_TAUT = 7
SKILL_TECH_CADE_DMGTODOORS = 8
SKILL_TECH_CADE_RFE_AMMOSAVE1 = 12
SKILL_TECH_CADE_RFE_AMMOSAVE2 = 13
SKILL_TECH_CADE_RFE_AMMOSAVE3 = 14
SKILL_TECH_CADE_RFE_DELAY1 = 16
SKILL_TECH_CADE_RFE_DELAY2 = 17
SKILL_TECH_CADE_RFE_RANGE1 = 18
SKILL_TECH_CADE_RFE_RANGE2 = 19
SKILL_TECH_CADE_HAMMER_DELAY1 = 20
SKILL_TECH_CADE_HAMMER_DELAY2 = 21
SKILL_TECH_CADE_HAMMER_DELAY3 = 22
SKILL_TECH_CADE_CAPACITY_REPAIR1 = 23
SKILL_TECH_CADE_CAPACITY_REPAIR2 = 24
SKILL_TECH_CADE_CAPACITY_REPAIR3 = 25
SKILL_TECH_CADE_CAPACITY_REPAIR4 = 26
SKILL_TECH_CADE_REFLECT = 27
SKILL_TECH_CADE_JUNKPACK_ADVANCED = 28
SKILL_TECH_RESUPPLY_CD1 = 29
SKILL_TECH_RESUPPLY_CD2 = 30
SKILL_TECH_RESUPPLY_CD3 = 31
SKILL_TECH_RESUPPLY_BONUS_AMMO = 32
SKILL_TECH_RESUPPLY_BONUS_SCRAP = 33
SKILL_TECH_RESUPPLY_BONUS_ITEM = 34
SKILL_TECH_RESUPPLY_BONUS_CADE = 35
SKILL_TECH_OFFENSE_DEP_DAM1 = 36
SKILL_TECH_OFFENSE_DEP_DAM2 = 37
SKILL_TECH_OFFENSE_DEP_DAM3 = 38
SKILL_TECH_OFFENSE_DEP_DAM4 = 39
SKILL_TECH_OFFENSE_DEP_DAM5 = 40
SKILL_TECH_OFFENSE_DEP_ROF1 = 41
SKILL_TECH_OFFENSE_DEP_ROF2 = 42
SKILL_TECH_OFFENSE_DEP_ROF3 = 43
SKILL_TECH_OFFENSE_DEP_ROF4 = 44
SKILL_TECH_OFFENSE_DEP_ROF5 = 45
SKILL_TECH_OFFENSE_DEP_AMMOSAVE1 = 49
SKILL_TECH_OFFENSE_DEP_AMMOSAVE2 = 50
SKILL_TECH_OFFENSE_DEP_OVERDRIVE = 51
SKILL_TECH_OFFENSE_DEP_RANGE1 = 52
SKILL_TECH_OFFENSE_DEP_RANGE2 = 53
SKILL_TECH_OFFENSE_DEP_TURRET_ROCKET = 54
SKILL_TECH_OFFENSE_DEP_ZAPPER_ARC = 55
SKILL_TECH_OFFENSE_RESCAS_ZAPPER = 56
SKILL_TECH_OFFENSE_RESCAS_DAM = 57
SKILL_TECH_OFFENSE_RESCAS_THRESHOLD = 58
SKILL_TECH_OFFENSE_RESCAS_RAD = 59
SKILL_TECH_OFFENSE_FIRE_TURRET_ENABLE = 60
SKILL_TECH_OFFENSE_FIRE_CHANCE = 61
SKILL_TECH_OFFENSE_FIRE_DAM = 62
SKILL_TECH_OFFENSE_FIRE_DUR = 63
SKILL_TECH_DEP_AMMOCAP = 195
SKILL_TECH_CADE_DEP_AMMOCAP = 196
SKILL_TECH_OFFENSE_DEP_AMMOCAP = 197
SKILL_TECH_CADE_GRENADE_TICKS_ADDED1 = 198
SKILL_TECH_CADE_GRENADE_TICKS_ADDED2 = 199

-- SKILL_SURV_START = 
-- SKILL_SURV_HEALTH_ADDED_LESSER_
-- SKILL_SURV_HEALTH_ADDED_LESSER_
-- SKILL_SURV_HEALTH_ADDED_LESSER_
-- SKILL_SURV_HEALTH_ADDED_LESSER_
-- SKILL_SURV_HEALTH_ADDED_LESSER_
-- SKILL_SURV_HEALTH_ADDED_LESSER_
-- SKILL_SURV_HEALTH_ADDED_LESSER_
-- SKILL_SURV_HEALTH_ADDED_GREATER_
-- SKILL_SURV_HEALTH_ADDED_GREATER_
-- SKILL_SURV_HEALTH_ADDED_GREATER_
-- SKILL_SURV_HEALTH_REGEN_
-- SKILL_SURV_HEALTH_REGEN_
-- SKILL_SURV_HEALTH_REGEN_
-- SKILL_SURV_BLOODARMOR_ADDED_LESSER_
-- SKILL_SURV_BLOODARMOR_ADDED_LESSER_
-- SKILL_SURV_BLOODARMOR_ADDED_LESSER_
-- SKILL_SURV_BLOODARMOR_ADDED_LESSER_
-- SKILL_SURV_BLOODARMOR_ADDED_LESSER_
-- SKILL_SURV_BLOODARMOR_ADDED_GREATER_
-- SKILL_SURV_BLOODARMOR_ADDED_GREATER_
-- SKILL_SURV_BLOODARMOR_ADDED_GREATER_
-- SKILL_SURV_BLOOD_MAGIC
-- SKILL_SURV_FORAGING
-- SKILL_SURV_DINNER_BONE

SKILL_SPEED1 = 64
SKILL_SPEED2 = 65
SKILL_SPEED3 = 66
SKILL_SPEED4 = 67
SKILL_SPEED5 = 68
SKILL_BACKPEDDLER = 69
SKILL_TWINVOLLEY = 70
SKILL_QUICKDRAW = 71
SKILL_QUICKRELOAD = 72
SKILL_VITALITY2 = 73
SKILL_BATTLER1 = 74
SKILL_BATTLER2 = 75
SKILL_BATTLER3 = 76
SKILL_BATTLER4 = 77
SKILL_BATTLER5 = 78
SKILL_HEAVYSTRIKES = 79
SKILL_COMBOKNUCKLE = 80
SKILL_JOUSTER = 81
SKILL_SCAVENGER = 82
SKILL_ULTRANIMBLE = 83
SKILL_D_FRAIL = 84
SKILL_U_MEDICCLOUD = 85
SKILL_SMARTTARGETING = 86
SKILL_GOURMET = 87
SKILL_BLOODARMOR = 88
SKILL_REGENERATOR = 89
SKILL_SAFEFALL = 90
SKILL_VITALITY3 = 91
SKILL_TANKER = 92
SKILL_U_CORRUPTEDFRAGMENT = 93
SKILL_FOCUS = 94
SKILL_WOOISM = 95
SKILL_STOIC1 = 96
SKILL_STOIC2 = 97
SKILL_STOIC3 = 98
SKILL_STOIC4 = 99
SKILL_STOIC5 = 100
SKILL_SURGEON1 = 101
SKILL_SURGEON2 = 102
SKILL_SURGEON3 = 103
SKILL_MOTIONI = 104
SKILL_PHASER = 105
SKILL_HAULMODULE = 106
SKILL_TRIGGER_DISCIPLINE1 = 107
SKILL_TRIGGER_DISCIPLINE2 = 108
SKILL_TRIGGER_DISCIPLINE3 = 109
SKILL_D_PALSY = 110
SKILL_EGOCENTRIC = 111
SKILL_D_HEMOPHILIA = 112
SKILL_LASTSTAND = 113
SKILL_D_NOODLEARMS = 114
SKILL_GLASSWEAPONS = 115
SKILL_CANNONBALL = 116
SKILL_D_CLUMSY = 117
SKILL_CHEAPKNUCKLE = 118
SKILL_CRITICALKNUCKLE = 119
SKILL_KNUCKLEMASTER = 120
SKILL_D_LATEBUYER = 121
SKILL_VITALITY1 = 122
SKILL_GLUTTON = 123
SKILL_D_WEAKNESS = 124
SKILL_PREPAREDNESS = 125
SKILL_D_WIDELOAD = 126
SKILL_FORAGER = 127
SKILL_LANKY = 128
SKILL_PITCHER = 129
SKILL_BLASTPROOF = 130
SKILL_MASTERCHEF = 131
SKILL_SUGARRUSH = 132
SKILL_U_STRENGTHSHOT = 133
SKILL_LIGHTWEIGHT = 134
SKILL_AGILEI = 135
SKILL_U_CRYGASGREN = 136
SKILL_SOFTDET = 137
SKILL_RECLAIMSOL = 138
SKILL_ORPHICFOCUS = 139
SKILL_IRONBLOOD = 140
SKILL_BLOODLETTER = 141
SKILL_HAEMOSTASIS = 142
SKILL_SLEIGHTOFHAND = 143
SKILL_AGILEII = 144
SKILL_AGILEIII = 145
SKILL_BIOLOGYI = 146
SKILL_BIOLOGYII = 147
SKILL_BIOLOGYIII = 148
SKILL_FOCUSII = 149
SKILL_FOCUSIII = 150
SKILL_EQUIPPED = 151
SKILL_SURESTEP = 152
SKILL_INTREPID = 153
SKILL_CARDIOTONIC = 154
SKILL_BLOODLUST = 155
SKILL_SCOURER = 156
SKILL_LANKYII = 157
SKILL_U_ANTITODESHOT = 158
SKILL_DISPERSION = 159
SKILL_MOTIONII = 160
SKILL_MOTIONIII = 161
SKILL_D_SLOW = 162
SKILL_BRASH = 163
SKILL_CONEFFECT = 164
SKILL_CIRCULATION = 165
SKILL_SANGUINE = 166
SKILL_ANTIGEN = 167
SKILL_BIOLOGYIV = 168
SKILL_SURGEONIV = 169
SKILL_DELIBRATION = 170
SKILL_DRIFT = 171
SKILL_WARP = 172
SKILL_LEVELHEADED = 173
SKILL_ROBUST = 174
SKILL_TRUEWOOISM = 175
SKILL_UNBOUND = 176
SKILL_GUNNER1 = 177
SKILL_GUNNER2 = 178
SKILL_GUNNER3 = 179
SKILL_GUNNER4 = 180
SKILL_GUNNER5 = 181
SKILL_GLADIATOR1 = 182
SKILL_GLADIATOR2 = 183
SKILL_GLADIATOR3 = 184
SKILL_ASSASSIN1 = 185
SKILL_ASSASSIN2 = 186
SKILL_ASSASSIN3 = 187
SKILL_WARRIOR1 = 188
SKILL_WARRIOR2 = 189
SKILL_BRUTE1 = 190
SKILL_BRUTE2 = 191
SKILL_BATTLER6 = 192
SKILL_BATTLER7 = 193
SKILL_BATTLER8 = 194

SKILLMOD_HEALTH = 1
SKILLMOD_SPEED = 2
SKILLMOD_WORTH = 3
SKILLMOD_FALLDAMAGE_THRESHOLD_MUL = 4
SKILLMOD_FALLDAMAGE_RECOVERY_MUL = 5
SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL = 6
SKILLMOD_FOODRECOVERY_MUL = 7
SKILLMOD_FOODEATTIME_MUL = 8
SKILLMOD_JUMPPOWER_MUL = 9
SKILLMOD_RELOADSPEED_MUL = 11
SKILLMOD_DEPLOYSPEED_MUL = 12
SKILLMOD_UNARMED_DAMAGE_MUL = 13
SKILLMOD_UNARMED_SWING_DELAY_MUL = 14
SKILLMOD_MELEE_DAMAGE_MUL = 15
SKILLMOD_HAMMER_SWING_DELAY_MUL = 16
SKILLMOD_CONTROLLABLE_SPEED_MUL = 17
SKILLMOD_CONTROLLABLE_HANDLING_MUL = 18
SKILLMOD_CONTROLLABLE_HEALTH_MUL = 19
SKILLMOD_MANHACK_DAMAGE_MUL = 20
SKILLMOD_BARRICADE_PHASE_SPEED_MUL = 21
SKILLMOD_MEDKIT_COOLDOWN_MUL = 22
SKILLMOD_MEDKIT_EFFECTIVENESS_MUL = 23
SKILLMOD_REPAIRRATE_MUL = 24
SKILLMOD_TURRET_HEALTH_MUL = 25
SKILLMOD_TURRET_SCANSPEED_MUL = 26
SKILLMOD_TURRET_SCANANGLE_MUL = 27
SKILLMOD_BLOODARMOR = 28
SKILLMOD_MELEE_KNOCKBACK_MUL = 29
SKILLMOD_SELF_DAMAGE_MUL = 30
SKILLMOD_AIMSPREAD_MUL = 31
SKILLMOD_POINTS = 32
SKILLMOD_POINT_MULTIPLIER = 33
SKILLMOD_FALLDAMAGE_DAMAGE_MUL = 34
SKILLMOD_MANHACK_HEALTH_MUL = 35
SKILLMOD_DEPLOYABLE_HEALTH_MUL = 36
SKILLMOD_DEPLOYABLE_PACKTIME_MUL = 37
SKILLMOD_DRONE_SPEED_MUL = 38
SKILLMOD_DRONE_CARRYMASS_MUL = 39
SKILLMOD_MEDGUN_FIRE_DELAY_MUL = 40
SKILLMOD_RESUPPLY_DELAY_MUL = 41
SKILLMOD_FIELD_RANGE_MUL = 42
SKILLMOD_FIELD_DELAY_MUL = 43
SKILLMOD_DRONE_GUN_RANGE_MUL = 44
SKILLMOD_HEALING_RECEIVED = 45
SKILLMOD_RELOADSPEED_PISTOL_MUL = 46
SKILLMOD_RELOADSPEED_SMG_MUL = 47
SKILLMOD_RELOADSPEED_ASSAULT_MUL = 48
SKILLMOD_RELOADSPEED_SHELL_MUL = 49
SKILLMOD_RELOADSPEED_RIFLE_MUL = 50
SKILLMOD_RELOADSPEED_XBOW_MUL = 51
SKILLMOD_RELOADSPEED_PULSE_MUL = 52
SKILLMOD_RELOADSPEED_EXP_MUL = 53
SKILLMOD_MELEE_ATTACKER_DMG_REFLECT = 54
SKILLMOD_PULSE_WEAPON_SLOW_MUL = 55
SKILLMOD_MELEE_DAMAGE_TAKEN_MUL = 56
SKILLMOD_POISON_DAMAGE_TAKEN_MUL = 57
SKILLMOD_BLEED_DAMAGE_TAKEN_MUL = 58
SKILLMOD_MELEE_SWING_DELAY_MUL = 59
SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL = 60
SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL = 61
SKILLMOD_MELEE_POWERATTACK_MUL = 62
SKILLMOD_KNOCKDOWN_RECOVERY_MUL = 63
SKILLMOD_MELEE_RANGE_MUL = 64
SKILLMOD_SLOW_EFF_TAKEN_MUL = 65
SKILLMOD_EXP_DAMAGE_TAKEN_MUL = 66
SKILLMOD_FIRE_DAMAGE_TAKEN_MUL = 67
SKILLMOD_PROP_CARRY_CAPACITY_MUL = 68
SKILLMOD_PROP_THROW_STRENGTH_MUL = 69
SKILLMOD_PHYSICS_DAMAGE_TAKEN_MUL = 70
SKILLMOD_VISION_ALTER_DURATION_MUL = 71
SKILLMOD_DIMVISION_EFF_MUL = 72
SKILLMOD_PROP_CARRY_SLOW_MUL = 73
SKILLMOD_BLEED_SPEED_MUL = 74
SKILLMOD_MELEE_LEG_DAMAGE_ADD = 75
SKILLMOD_SIGIL_TELEPORT_MUL = 76
SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT = 77
SKILLMOD_POISON_SPEED_MUL = 78
SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL = 79
SKILLMOD_EXP_DAMAGE_RADIUS = 80
SKILLMOD_MEDGUN_RELOAD_SPEED_MUL = 81
SKILLMOD_WEAPON_WEIGHT_SLOW_MUL = 82
SKILLMOD_FRIGHT_DURATION_MUL = 83
SKILLMOD_IRONSIGHT_EFF_MUL = 84
SKILLMOD_BLOODARMOR_DMG_REDUCTION = 85
SKILLMOD_BLOODARMOR_MUL = 86
SKILLMOD_BLOODARMOR_REGENERATION_MUL = 87
SKILLMOD_LOW_HEALTH_SLOW_MUL = 88
SKILLMOD_PROJ_SPEED = 89
SKILLMOD_SCRAP_START = 90
SKILLMOD_ENDWAVE_POINTS = 91
SKILLMOD_ARSENAL_DISCOUNT = 92
SKILLMOD_CLOUD_RADIUS = 93
SKILLMOD_CLOUD_TIME = 94
SKILLMOD_PROJECTILE_DAMAGE_MUL = 95
SKILLMOD_EXP_DAMAGE_MUL = 96
SKILLMOD_TURRET_RANGE_MUL = 97
SKILLMOD_AIM_SHAKE_MUL = 98
SKILLMOD_MEDDART_EFFECTIVENESS_MUL = 99
SKILLMOD_BLOODARMOR_GAIN = 100
SKILLMOD_BULLET_DAMAGE_MUL = 101
SKILLMOD_DROP_CHANCE_MUL = 102
SKILLMOD_COLLECT_CHANCE_MUL = 103
SKILLMOD_AMMOTOCACHE_CHANCE_MUL = 104
SKILLMOD_FIRE_ADDED_DAMAGE = 105
SKILLMOD_BLOODARMOR_MELEEKILL = 106
SKILLMOD_BLOODARMOR_MELEEKILL_MUL = 107
SKILLMOD_BLOODARMOR_REGENERATION_MUL = 108
SKILLMOD_BLOODARMOR_GAIN_MUL = 109
SKILLMOD_RES_THRESHOLD_MUL = 110
SKILLMOD_DEPLOYABLE_LIMIT = 111
SKILLMOD_CADE_REPAIR_CAPACITY = 112
SKILLMOD_DEP_DELAY_MUL = 113
SKILLMOD_DEP_DAMAGE_MUL = 114
SKILLMOD_DEP_RANGE_MUL = 115
SKILLMOD_FIRE_ADDED_DURATION = 116
SKILLMOD_FIRE_INCREASED_CHANCE = 117
SKILLMOD_CADE_DOOR_DAMAGE = 118
SKILLMOD_RESCAS_DAM = 119
SKILLMOD_RESCAS_RAD = 120
SKILLMOD_CADE_RFE_EFFICIENCY = 121
SKILLMOD_CADE_OFFENSE_EFFICIENCY = 122
SKILLMOD_CADE_RFE_RANGE = 123
SKILLMOD_CADE_RFE_ROF = 124
SKILLMOD_GRENADE_MAX_TICKS = 125
SKILLMOD_DEPLOYABLE_MAXAMMO = 126
SKILLMOD_RESUPPLY_AMMO_MUL = 127
SKILLMOD_EXP_MUL = 128
SKILLMOD_HEALTH_MUL = 129
SKILLMOD_WELFARE_MUL = 130

local GOOD = "^"..COLORID_GREEN
local BAD = "^"..COLORID_RED

GM:AddSkill(SKILL_TECH_START, "Technician", GOOD .. "Allows seeing resupply crates, remantlers, etc.\n" .. GOOD .. "Start with a random item or scrap.",
																0,			0,					{SKILL_NONE}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_CADE_REPAIR1, "Repair 1", GOOD .. "+10% Repair Rate",
																2,			2,					{SKILL_TECH_START}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_REPAIR1, SKILLMOD_REPAIRRATE_MUL, 0.10)
GM:AddSkill(SKILL_TECH_CADE_REPAIR2, "Repair 2", GOOD .. "+10% Repair Rate",
																4,			2,					{SKILL_TECH_CADE_REPAIR1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_REPAIR2, SKILLMOD_REPAIRRATE_MUL, 0.10)																
GM:AddSkill(SKILL_TECH_CADE_REPAIR3, "Repair 3", GOOD .. "+10% Repair Rate",
																6,			2,					{SKILL_TECH_CADE_REPAIR2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_REPAIR3, SKILLMOD_REPAIRRATE_MUL, 0.10)
GM:AddSkill(SKILL_TECH_CADE_REPAIR4, "Repair 4", GOOD .. "+10% Repair Rate",
																8,			2,					{SKILL_TECH_CADE_REPAIR3}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_REPAIR4, SKILLMOD_REPAIRRATE_MUL, 0.10)
GM:AddSkill(SKILL_TECH_CADE_REPAIR5, "Repair 5", GOOD .. "+10% Repair Rate",
																10,			2,					{SKILL_TECH_CADE_REPAIR4}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_REPAIR5, SKILLMOD_REPAIRRATE_MUL, 0.10)
GM:AddSkill(SKILL_TECH_CADE_TAUT, "Taut", GOOD .. "Props are not dropped when hit by a zombie.",
																2,			4,					{SKILL_TECH_CADE_REPAIR1}, TREE_TECHNICIAN)
GM:AddSkillFunction(SKILL_TECH_CADE_TAUT, function(pl, active)
	pl.BuffTaut = active
end)
GM:AddSkill(SKILL_TECH_CADE_DMGTODOORS, "Damage To Doors", "Increases damage to doors by 300%.",
																0,			4,					{SKILL_TECH_CADE_REPAIR1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_DMGTODOORS, SKILLMOD_CADE_DOOR_DAMAGE, 3.0)
GM:AddSkill(SKILL_TECH_CADE_RFE_AMMOSAVE1, "Efficiency 1", GOOD .. "Repair field emitters consume 10% less ammo.",
																6,			4,					{SKILL_TECH_CADE_REPAIR3}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_RFE_AMMOSAVE1, SKILLMOD_CADE_RFE_EFFICIENCY, -0.10)												
GM:AddSkill(SKILL_TECH_CADE_RFE_AMMOSAVE2, "Efficiency 2", GOOD .. "Repair field emitters consume 10% less ammo.",
																8,			5,					{SKILL_TECH_CADE_RFE_AMMOSAVE1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_RFE_AMMOSAVE2, SKILLMOD_CADE_RFE_EFFICIENCY, -0.10)		
GM:AddSkill(SKILL_TECH_CADE_RFE_AMMOSAVE3, "Efficiency 3", GOOD .. "Repair field emitters consume 10% less ammo.",
																10,			6,					{SKILL_TECH_CADE_RFE_AMMOSAVE2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_RFE_AMMOSAVE3, SKILLMOD_CADE_RFE_EFFICIENCY, -0.10)		
GM:AddSkill(SKILL_TECH_CADE_RFE_DELAY1, "Repair Field Delay 1", GOOD .. "Reduces repair field emitter delay by 10%.",
																4,			5,					{SKILL_TECH_CADE_RFE_AMMOSAVE1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_RFE_DELAY1, SKILLMOD_FIELD_DELAY_MUL, -0.10)		
GM:AddSkill(SKILL_TECH_CADE_RFE_DELAY2, "Repair Field Delay 2", GOOD .. "Reduces repair field emitter delay by 10%.",
																2,			6,					{SKILL_TECH_CADE_RFE_DELAY1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_RFE_DELAY2, SKILLMOD_FIELD_DELAY_MUL, -0.10)	
GM:AddSkill(SKILL_TECH_CADE_RFE_RANGE1, "Repair Field Range 1", GOOD .. "Increases repair field emitter range by 15%.",
																6,			6,					{SKILL_TECH_CADE_RFE_AMMOSAVE1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_RFE_RANGE1, SKILLMOD_FIELD_RANGE_MUL, 0.15)	
GM:AddSkill(SKILL_TECH_CADE_RFE_RANGE2, "Repair Field Range 2", GOOD .. "Increases repair field emitter range by 15%.",
																6,			8,					{SKILL_TECH_CADE_RFE_RANGE1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_RFE_RANGE1, SKILLMOD_FIELD_RANGE_MUL, 0.15)	
GM:AddSkill(SKILL_TECH_CADE_HAMMER_DELAY1, "Hammer Delay 1", GOOD .. "Hammer swing delay reduced by 10%",
																6,			-0,					{SKILL_TECH_CADE_REPAIR3}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_HAMMER_DELAY1, SKILLMOD_HAMMER_SWING_DELAY_MUL, -0.10)
GM:AddSkill(SKILL_TECH_CADE_HAMMER_DELAY2, "Hammer Delay 2", GOOD .. "Hammer swing delay reduced by 10%",
																6,			-2,					{SKILL_TECH_CADE_HAMMER_DELAY1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_HAMMER_DELAY2, SKILLMOD_HAMMER_SWING_DELAY_MUL, -0.10)
GM:AddSkill(SKILL_TECH_CADE_HAMMER_DELAY3, "Hammer Delay 3", GOOD .. "Hammer swing delay reduced by 10%\n" .. GOOD .. "Applies reinforcer to props for 10 seconds, reduces damage taken while active.",
																6,			-4,					{SKILL_TECH_CADE_HAMMER_DELAY2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_HAMMER_DELAY3, SKILLMOD_HAMMER_SWING_DELAY_MUL, -0.10)
GM:AddSkill(SKILL_TECH_CADE_CAPACITY_REPAIR1, "Repair Capacity 1", GOOD .. "Repair capacity of props increased by 10%",
																8,			0,					{SKILL_TECH_CADE_REPAIR4}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_CAPACITY_REPAIR1, SKILLMOD_CADE_REPAIR_CAPACITY, 0.10)
GM:AddSkill(SKILL_TECH_CADE_CAPACITY_REPAIR2, "Repair Capacity 2", GOOD .. "Repair capacity of props increased by 10%" ,
																8,			-2,					{SKILL_TECH_CADE_CAPACITY_REPAIR1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_CAPACITY_REPAIR2, SKILLMOD_CADE_REPAIR_CAPACITY, 0.10)
GM:AddSkill(SKILL_TECH_CADE_CAPACITY_REPAIR3, "Repair Capacity 3", GOOD .. "Repair capacity of props increased by 10%",
																8,			-4,					{SKILL_TECH_CADE_CAPACITY_REPAIR2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_CAPACITY_REPAIR3, SKILLMOD_CADE_REPAIR_CAPACITY, 0.10)
GM:AddSkill(SKILL_TECH_CADE_CAPACITY_REPAIR4, "Repair Capacity 4", GOOD .. "Repair capacity of props increased by 10%",
																10,			-2,					{SKILL_TECH_CADE_CAPACITY_REPAIR2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_CAPACITY_REPAIR4, SKILLMOD_CADE_REPAIR_CAPACITY, 0.10)
GM:AddSkill(SKILL_TECH_CADE_REFLECT, "Reflection", GOOD .. "Applies reflection to props for 10 seconds, reflects damage taken while active.",
																10,			0,					{SKILL_TECH_CADE_REPAIR5}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_CADE_JUNKPACK_ADVANCED, "Advanced Junkpack", GOOD .."Upgrades the Junkpack.",
																10,			4,					{SKILL_TECH_CADE_REPAIR5}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_RESUPPLY_CD1, "Resupply Cooldown 1", GOOD .. "Reduces resupply cooldown by 13%.",
																2,			-2,					{SKILL_TECH_START}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_RESUPPLY_CD1, SKILLMOD_RESUPPLY_DELAY_MUL, -0.13)
GM:AddSkill(SKILL_TECH_RESUPPLY_CD2, "Resupply Cooldown 2", GOOD .. "Reduces resupply cooldown by 13%.",
																4,			-4,					{SKILL_TECH_RESUPPLY_CD1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_RESUPPLY_CD2, SKILLMOD_RESUPPLY_DELAY_MUL, -0.13)
GM:AddSkill(SKILL_TECH_RESUPPLY_CD3, "Resupply Cooldown 3", GOOD .. "Reduces resupply cooldown by 13%.",
																0,			-4,					{SKILL_TECH_RESUPPLY_CD1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_RESUPPLY_CD3, SKILLMOD_RESUPPLY_DELAY_MUL, -0.13)																
GM:AddSkill(SKILL_TECH_RESUPPLY_BONUS_AMMO, "Bonus Ammo", GOOD .. "Increases ammo yields from the resupplybox by 30%.\n" .. BAD .. "Does not apply to scrap.",
																2,			-6,					{SKILL_TECH_RESUPPLY_CD3}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_RESUPPLY_BONUS_AMMO, SKILLMOD_RESUPPLY_AMMO_MUL, 0.30)
GM:AddSkill(SKILL_TECH_RESUPPLY_BONUS_SCRAP, "Bonus Scrap", GOOD .. "Each resupply use gives 1 extra scrap.",
																0,			-6,					{SKILL_TECH_RESUPPLY_CD3}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_RESUPPLY_BONUS_CADE, "Bonus Supplies", GOOD .. "Each resupply use has a chance to give nails or junkpack ammo.",
																-2,			-6,					{SKILL_TECH_RESUPPLY_CD3}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_DAM1, "Deployable Damage 1", GOOD .. "Increases deployable damage by 3%",
																-2,			0,					{SKILL_TECH_START}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_DAM1, SKILLMOD_DEP_DAMAGE_MUL, 0.03)	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_DAM2, "Deployable Damage 2", GOOD .. "Increases deployable damage by 3%",
																-4,			0,					{SKILL_TECH_OFFENSE_DEP_DAM1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_DAM2, SKILLMOD_DEP_DAMAGE_MUL, 0.03)	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_DAM3, "Deployable Damage 3", GOOD .. "Increases deployable damage by 3%",
																-6,			0,					{SKILL_TECH_OFFENSE_DEP_DAM2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_DAM3, SKILLMOD_DEP_DAMAGE_MUL, 0.03)	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_DAM4, "Deployable Damage 4", GOOD .. "Increases deployable damage by 3%",
																-8,			0,					{SKILL_TECH_OFFENSE_DEP_DAM3}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_DAM4, SKILLMOD_DEP_DAMAGE_MUL, 0.03)	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_DAM5, "Deployable Damage 5", GOOD .. "Increases deployable damage by 3%",
																-10,		0,					{SKILL_TECH_OFFENSE_DEP_DAM4}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_DAM5, SKILLMOD_DEP_DAMAGE_MUL, 0.03)	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_ROF1, "Deployable RoF 1", GOOD .. "Decreases deployable fire delay by 3%",
																-6,			2,					{SKILL_TECH_OFFENSE_DEP_DAM3}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_ROF1, SKILLMOD_DEP_DELAY_MUL, -0.03)																	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_ROF2, "Deployable RoF 2", GOOD .. "Decreases deployable fire delay by 3%",
																-8,			2,					{SKILL_TECH_OFFENSE_DEP_ROF1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_ROF2, SKILLMOD_DEP_DELAY_MUL, -0.03)																	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_ROF3, "Deployable RoF 3", GOOD .. "Decreases deployable fire delay by 3%",
																-6,			4,					{SKILL_TECH_OFFENSE_DEP_ROF1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_ROF3, SKILLMOD_DEP_DELAY_MUL, -0.03)																	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_ROF4, "Deployable RoF 4", GOOD .. "Decreases deployable fire delay by 3%",
																-4,			4,					{SKILL_TECH_OFFENSE_DEP_ROF1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_ROF4, SKILLMOD_DEP_DELAY_MUL, -0.03)																	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_ROF5, "Deployable RoF 5", GOOD .. "Decreases deployable fire delay by 3%",
																-4,			2,					{SKILL_TECH_OFFENSE_DEP_ROF1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_ROF5, SKILLMOD_DEP_DELAY_MUL, -0.03)																	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_AMMOSAVE1, "Efficiency 1", GOOD .. "Turrets and zappers consume 10% less ammo.",
																-6,			-2,					{SKILL_TECH_OFFENSE_DEP_DAM3}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_AMMOSAVE1, SKILLMOD_CADE_OFFENSE_EFFICIENCY, -0.10)													
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_AMMOSAVE2, "Efficiency 2", GOOD .. "Turrets and zappers consume 10% less ammo.",
																-6,			-4,					{SKILL_TECH_OFFENSE_DEP_AMMOSAVE1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_AMMOSAVE2, SKILLMOD_CADE_OFFENSE_EFFICIENCY, -0.10)	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_OVERDRIVE, "Overdrive", GOOD .. "Turrets and zappers have +33% rate of fire.\n" .. BAD .. "Turrets and Zappers consume 30% more ammo.",
																-12,		0,					{SKILL_TECH_OFFENSE_DEP_DAM5}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_OVERDRIVE, SKILLMOD_CADE_OFFENSE_EFFICIENCY, 0.30)		
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_OVERDRIVE, SKILLMOD_DEP_DELAY_MUL, -0.33)		
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_RANGE1, "Deployable Range 1", GOOD .. "Increases deployable range by 15%",
																-10,		2,					{SKILL_TECH_OFFENSE_DEP_DAM5}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_RANGE1, SKILLMOD_DEP_RANGE_MUL, 0.15)																	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_RANGE2, "Deployable Range 2", GOOD .. "Increases deployable range by 15%",
																-10,		-2,					{SKILL_TECH_OFFENSE_DEP_DAM5}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_RANGE2, SKILLMOD_DEP_RANGE_MUL, 0.15)
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_TURRET_ROCKET, "Unlock Rocket Turret", GOOD .. "Unlocks ability to purchase Rocket Turrets.",
																-12,		2,					{SKILL_TECH_OFFENSE_DEP_DAM5}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_ZAPPER_ARC, "Unlock Arc Zapper", GOOD .. "Unlocks ability to purchase Arc Zappers.",
																-12,		-2,					{SKILL_TECH_OFFENSE_DEP_DAM5}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_OFFENSE_RESCAS_ZAPPER, "Zapper Res. Cascade", GOOD .. "Unlocks the ability for zappers to trigger resonance cascade.",
																-10,		-4,					{SKILL_TECH_OFFENSE_DEP_RANGE2}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_OFFENSE_RESCAS_DAM, "Res. Cascade Damage", GOOD .. "Increases damage of Resonance Cascade by 25%.",
																-12,		-4,					{SKILL_TECH_OFFENSE_RESCAS_ZAPPER}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_RESCAS_DAM, SKILLMOD_RESCAS_DAM, 0.25)		
GM:AddSkill(SKILL_TECH_OFFENSE_RESCAS_THRESHOLD, "Res. Cascade Threshold", GOOD .. "Decreases Resonance Cascade threshold by -15.",
																-10,		-6,					{SKILL_TECH_OFFENSE_RESCAS_ZAPPER}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_RESCAS_THRESHOLD, SKILLMOD_RES_THRESHOLD_MUL, -0.15)		
GM:AddSkill(SKILL_TECH_OFFENSE_RESCAS_RAD, "Res. Cascade Radius", GOOD .. "Increases radius of Resonance Cascade by 30%.",
																-8,			-4,					{SKILL_TECH_OFFENSE_RESCAS_ZAPPER}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_RESCAS_RAD, SKILLMOD_RESCAS_RAD, 0.30)											
GM:AddSkill(SKILL_TECH_OFFENSE_FIRE_TURRET_ENABLE, "Blazing Turrets", GOOD .. "Unlocks the ability for gun turrets, blast turrets, and assault turrets to cause ignition.",
																-10,		4,					{SKILL_TECH_OFFENSE_DEP_RANGE1}, TREE_TECHNICIAN)
GM:AddSkill(SKILL_TECH_OFFENSE_FIRE_CHANCE, "Ignite Chance", GOOD .. "50% increased chance to ignite targets.",
																-12,		4,					{SKILL_TECH_OFFENSE_FIRE_TURRET_ENABLE}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_FIRE_CHANCE, SKILLMOD_FIRE_INCREASED_CHANCE, 0.50)
GM:AddSkill(SKILL_TECH_OFFENSE_FIRE_DAM, "Added Fire Damage", GOOD .. "Adds 1 damage per tick to to fire damage.",
																-10,		6,					{SKILL_TECH_OFFENSE_FIRE_TURRET_ENABLE}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_FIRE_DAM, SKILLMOD_FIRE_ADDED_DAMAGE, 1.0)
GM:AddSkill(SKILL_TECH_OFFENSE_FIRE_DUR, "Added Fire Duration", GOOD .. "Applies 1 extra stacks per application of fire.",
																-8,			4,					{SKILL_TECH_OFFENSE_FIRE_TURRET_ENABLE}, TREE_TECHNICIAN)	
GM:AddSkillModifier(SKILL_TECH_OFFENSE_FIRE_DUR, SKILLMOD_FIRE_ADDED_DURATION, 1.0)		
GM:AddSkill(SKILL_TECH_DEP_AMMOCAP, "Deployable Capacity", GOOD .. "Increases deployable ammo capacity by 25%.",
																0,			2,					{SKILL_TECH_START}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_DEP_AMMOCAP, SKILLMOD_DEPLOYABLE_MAXAMMO, 0.25)		
GM:AddSkill(SKILL_TECH_CADE_DEP_AMMOCAP, "Deployable Capacity", GOOD .. "Increases deployable ammo capacity by 25%.",
																8,			7,					{SKILL_TECH_CADE_RFE_AMMOSAVE2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_DEP_AMMOCAP, SKILLMOD_DEPLOYABLE_MAXAMMO, 0.25)	
GM:AddSkill(SKILL_TECH_OFFENSE_DEP_AMMOCAP, "Deployable Capacity", GOOD .. "Increases deployable ammo capacity by 25%.",
																-6,			-6,					{SKILL_TECH_OFFENSE_DEP_AMMOSAVE2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_OFFENSE_DEP_AMMOCAP, SKILLMOD_DEPLOYABLE_MAXAMMO, 0.25)	
GM:AddSkill(SKILL_TECH_CADE_GRENADE_TICKS_ADDED1, "Grenade Ticks", GOOD .. "Provides grenades 1 additional tick.",
																4,			0,					{SKILL_TECH_CADE_REPAIR2}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_GRENADE_TICKS_ADDED1, SKILLMOD_GRENADE_MAX_TICKS, 1.0)		
GM:AddSkill(SKILL_TECH_CADE_GRENADE_TICKS_ADDED2, "Grenade Ticks", GOOD .. "Provides grenades 1 additional tick.",
																4,			-2,					{SKILL_TECH_CADE_GRENADE_TICKS_ADDED1}, TREE_TECHNICIAN)
GM:AddSkillModifier(SKILL_TECH_CADE_GRENADE_TICKS_ADDED2, SKILLMOD_GRENADE_MAX_TICKS, 1.0)																
																								
-- Health Tree
GM:AddSkill(SKILL_STOIC1, "Stoic I", GOOD.."+5 maximum health\n",
																-4,			-6,					{SKILL_NONE, SKILL_STOIC2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC2, "Stoic II", GOOD.."+5 maximum health\n",
																-4,			-4,					{SKILL_STOIC3, SKILL_VITALITY1, SKILL_REGENERATOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC3, "Stoic III", GOOD.."+5 maximum health\n",
																-3,			-2,					{SKILL_STOIC4}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC4, "Stoic IV", GOOD.."+5 maximum health\n",
																-3,			0,					{SKILL_STOIC5}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC5, "Stoic V", GOOD.."+5 maximum health\n",
																-3,			2,					{SKILL_BLOODARMOR, SKILL_TANKER}, TREE_HEALTHTREE)
--GM:AddSkill(SKILL_D_HEMOPHILIA, "Debuff: Hemophilia", GOOD.."+10 starting Worth\n"..GOOD.."+3 starting scrap\n"..BAD.."Bleed for 25% extra damage when hit",
--																4,			2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GLUTTON, "Glutton", GOOD.."Gain up to 30 blood armor when you eat food\n"..GOOD.."Blood armor gained can exceed the cap by 40\n"..BAD.."-5 maximum health\n"..BAD.."No longer receive health from eating food",
																3,			-2,					{SKILL_GOURMET, SKILL_BLOODARMOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_PREPAREDNESS, "Preparedness", GOOD.."Your starting item can be a random food item",
																4,			-6,					{SKILL_NONE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GOURMET, "Gourmet", GOOD.."+15% recovery from food",
																4,			-4,					{SKILL_PREPAREDNESS, SKILL_VITALITY1}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_HAEMOSTASIS, "Haemostasis", GOOD.."Resist status effects while you have at least 3 blood armor\n"..BAD.."Lose 3 blood armor on resist\n"..BAD.."-10% blood armor damage absorption",
																4,			6,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODLETTER, "Bloodletter", GOOD.."+20% blood armor regenerated",
																0,			4,					{SKILL_ANTIGEN}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_REGENERATOR, "Regenerator", GOOD.."Regenerate 1 health every 3s",
																-5,			-2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODARMOR, "Blood Armor", GOOD.."Regenerate 20% of max blood armor every 2 seconds\nBase blood armor maximum is 8\nBase blood armor damage absorption is 50%\n",
																2,			2,					{SKILL_IRONBLOOD, SKILL_BLOODLETTER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_IRONBLOOD, "Iron Blood", GOOD.."+40% damage reduction from blood armor\n"..GOOD.."Bonus increased by 10% when health is 50% or less\n"..BAD.."-25% maximum blood armor\n"..BAD.."-10 movement speed",
																2,			4,					{SKILL_HAEMOSTASIS, SKILL_CIRCULATION}, TREE_HEALTHTREE)
--GM:AddSkill(SKILL_D_WEAKNESS, "Debuff: Weakness", GOOD.."+10 starting Worth\n"..GOOD.."+1 end of wave points\n"..BAD.."-35 maximum health",
--																1,			-1,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY1, "Vitality I", GOOD.."+8 maximum health",
																0,			-4,					{SKILL_VITALITY2}, TREE_HEALTHTREE)
--GM:AddSkill(SKILL_WORTHINESS6, "Worthiness VI", GOOD.."+5 starting worth",
--																0,			-6,					{SKILL_VITALITY1}, TREE_HEALTHTREE)
																
GM:AddSkill(SKILL_VITALITY2, "Vitality II", GOOD.."+8 maximum health",
																0,			-2,					{SKILL_VITALITY3}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY3, "Vitality III", GOOD.."+14 maximum health",
																0,			-0,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_TANKER, "Tanker", GOOD.."+25 maximum health\n"..GOOD.."+4 Blood Armor\n",
																-5,			4,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_FORAGER, "Forager", GOOD.."15% chance to collect food from resupply boxes\n"..GOOD.."-5% resupply box delay",
																5,			-2,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_FORAGER, SKILLMOD_RESUPPLY_DELAY_MUL, -0.05)
GM:AddSkill(SKILL_SUGARRUSH, "Sugar Rush", GOOD.."+35 speed boost from food for 14 seconds\n"..BAD.."-35% recovery from food\n",
																4,			0,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CIRCULATION, "Circulation", GOOD.."+2 maximum blood armor",
																4,			4,					{SKILL_SANGUINE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_SANGUINE, "Sanguine", GOOD.."+5 maximum blood armor\n"..BAD.."-10 maximum health",
																6,			2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_ANTIGEN, "Antigen", GOOD.."+5% blood armor damage absorption\n",
																-2,			4,					{}, TREE_HEALTHTREE)
-- Speed Tree
GM:AddSkill(SKILL_SPEED1, "Speed I", GOOD.."+0.5 movement speed\n",
																-4,			6,					{SKILL_NONE, SKILL_SPEED2}, TREE_SPEEDTREE)
--GM:AddSkill(SKILL_ASDF, "ASDF", GOOD.."+0.5 movement speed\n",
--																-5,			5,					{SKILL_SPEED1}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED2, "Speed II", GOOD.."+0.75 movement speed\n",
																-4,			4,					{SKILL_SPEED3, SKILL_PHASER, SKILL_SPEED2, SKILL_U_CORRUPTEDFRAGMENT}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED3, "Speed III", GOOD.."+1 movement speed\n",
																-4,			2,					{SKILL_SPEED4}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED4, "Speed IV", GOOD.."+1.25 movement speed\n",
																-4,			0,					{SKILL_SPEED5, SKILL_SAFEFALL}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED5, "Speed V", GOOD.."+1.50 movement speed\n",
																-4,			-2,					{SKILL_ULTRANIMBLE, SKILL_BACKPEDDLER, SKILL_MOTIONI, SKILL_CARDIOTONIC, SKILL_UNBOUND}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEI, "Agile I", GOOD.."+4% jumping power\n"..BAD.."-2 movement speed",
																4,			6,					{SKILL_NONE, SKILL_AGILEII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEII, "Agile II", GOOD.."+5% jumping power\n"..BAD.."-3 movement speed",
																4,			2,					{SKILL_AGILEIII, SKILL_WORTHINESS3}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEIII, "Agile III", GOOD.."+6% jumping power\n"..BAD.."-4 movement speed",
																4,			-2,					{SKILL_SAFEFALL, SKILL_ULTRANIMBLE, SKILL_SURESTEP, SKILL_INTREPID}, TREE_SPEEDTREE)
--GM:AddSkill(SKILL_D_SLOW, "Debuff: Slow", GOOD.."+15 starting Worth\n"..GOOD.."+1 end of wave points\n"..BAD.."-33.75 movement speed",
--																0,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONI, "Motion I", GOOD.."+0.75 movement speed\n"..GOOD.."+3% Phasing Speed",
																-2,			-2,					{SKILL_MOTIONII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONII, "Motion II", GOOD.."+0.75 movement speed\n"..GOOD.."+3% Reloading Speed",
																-1,			-1,					{SKILL_MOTIONIII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONIII, "Motion III", GOOD.."+0.75 movement speed\n"..GOOD.."-3% Teleportation Time",
																0,			-2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_BACKPEDDLER, "Backpeddler", GOOD.."Move the same speed in all directions\n"..BAD.."-7 movement speed\n"..BAD.."Receive leg damage on any melee hit",
																-6,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_PHASER, "Phaser", GOOD.."+5% barricade phasing movement speed",
																-1,			4,					{SKILL_DRIFT}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_DRIFT, "Drift", GOOD.."+5% barricade phasing movement speed",
																1,			3,					{SKILL_WARP}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_WARP, "Warp", GOOD.."-8% sigil teleportation time",
																2,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SAFEFALL, "Safe Fall", GOOD.."-40% fall damage taken\n"..GOOD.."+50% faster fall damage knockdown recovery\n"..BAD.."+40% slow down from landing or fall damage",
																0,			0,					{}, TREE_SPEEDTREE)
--GM:AddSkill(SKILL_D_WIDELOAD, "Debuff: Wide Load", GOOD.."+15 starting Worth\n"..GOOD.."-5% resupply delay\n"..BAD.."Phasing speed limited to 1 for the first 6 seconds of phasing",
--																1,			1,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_U_CORRUPTEDFRAGMENT, "Unlock: Corrupted Fragment", GOOD.."Unlocks purchasing the Corrupted Fragment\nGoes to corrupted sigils instead",
																-2,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ULTRANIMBLE, "Ultra Nimble", GOOD.."+7 movement speed\n"..BAD.."-10 maximum health",
																0,			-6,					{}, TREE_SPEEDTREE)
--GM:AddSkill(SKILL_WORTHINESS3, "Worthiness III", GOOD.."+5 starting worth",
--																6,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SURESTEP, "Sure Step", GOOD.."-30% effectiveness of slows\n"..BAD.."-4 movement speed",
																6,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_INTREPID, "Intrepid", GOOD.."-35% low health slow intensity\n"..BAD.."-4 movement speed",
																6,			-4,					{SKILL_ROBUST}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ROBUST, "Robust", GOOD.."-6% movement speed reduction with heavy weapons",
																5,			-5,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CARDIOTONIC, "Cardiotonic", GOOD.."Hold shift to run whilst draining blood armor\n"..BAD.."-12 movement speed\n"..BAD.."-20% blood armor damage absorption\nSprinting grants +40 move speed",
																-6,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_UNBOUND, "Unbound", GOOD.."-60% reduced delay from switching weapons affecting movement speed\n"..BAD.."-4 movement speed",
																-4,			-4,					{}, TREE_SPEEDTREE)
-- Medic Tree
GM:AddSkill(SKILL_SURGEON1, "Surgeon I", GOOD.."-8% medical kit cooldown",
																-4,			6,					{SKILL_NONE, SKILL_SURGEON2}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEON2, "Surgeon II", GOOD.."-9% medical kit cooldown",
																-3,			3,					{SKILL_WORTHINESS4, SKILL_SURGEON3}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEON3, "Surgeon III", GOOD.."-10% medical kit cooldown",
																-2,			0,					{SKILL_U_MEDICCLOUD, SKILL_SURGEONIV}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEONIV, "Surgeon IV", GOOD.."-11% medical kit cooldown",
																-2,			-3,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYI, "Biology I", GOOD.."+8% medic tool effectiveness",
																4,			6,					{SKILL_NONE, SKILL_BIOLOGYII}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYII, "Biology II", GOOD.."+9% medic tool effectiveness",
																3,			3,					{SKILL_BIOLOGYIII, SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYIII, "Biology III", GOOD.."+10% medic tool effectiveness",
																2,			0,					{SKILL_U_MEDICCLOUD, SKILL_U_ANTITODESHOT, SKILL_BIOLOGYIV}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYIV, "Biology IV", GOOD.."+11% medic tool effectiveness",
																2,			-3,					{}, TREE_SUPPORTTREE)
--GM:AddSkill(SKILL_D_FRAIL, "Debuff: Frail", GOOD.."+15 starting Worth\n"..GOOD.."+5 starting points\n"..BAD.."Cannot be healed above 25% health",
--																-4,			-2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_MEDICCLOUD, "Unlock: Medic Cloud Bomb", GOOD.."Unlocks purchasing the Medic Cloud Bomb\nSlowly heals all humans inside the cloud",
																0,			-2,					{SKILL_DISPERSION}, TREE_SUPPORTTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_SMARTTARGETING, "Smart Targeting", GOOD.."Medical weapon darts lock onto targets with right click",
																0,			2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_RECLAIMSOL, "Recoverable Solution", GOOD.."50% of wasted medical dart ammo is returned to you\n"..BAD.."Cannot speed boost full health players",
																0,			4,					{SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_STRENGTHSHOT, "Unlock: Strength Shot Gun", GOOD.."Unlocks purchasing the Strength Shot Gun\nTarget damage +25% for 10 seconds\nExtra damage is given to you as points\nTarget is not healed",
																0,			0,					{SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
--GM:AddSkill(SKILL_WORTHINESS4, "Worthiness IV", GOOD.."+5 starting worth",
--																-5,			2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_ANTITODESHOT, "Unlock: Antidote Handgun", GOOD.."Unlocks purchasing the Antidote Handgun\nFires piercing blasts that heal poison greatly\nCleanses statuses from targets with a small point gain\nDoes not heal health",
																4,			-2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_DISPERSION, "Dispersion", GOOD.."+15% cloud bomb radius",
																0,			-4,					{}, TREE_SUPPORTTREE)															
-- GM:AddSkill(SKILL_U_NANITECLOUD, "Unlock: Nanite Cloud Bomb", GOOD.."Unlocks purchasing the Nanite Cloud Bomb\nSlowly repairs all props and deployables inside the cloud",
																-- 3,			1,					{SKILL_HAMMERDISCIPLINE}, TREE_BUILDINGTREE)
-- .AlwaysActive = true																										
-- GM:AddSkill(SKILL_TECH_OFFENSE_DEP_ZAPPER_ARC, "Unlock: Arc Zapper", GOOD.."Unlocks purchasing the Arc Zapper\nZaps zombies that get nearby, and jumps in an arc\nMid tier deployable and long cooldown\nRequires a steady upkeep of pulse ammo",
																-- 6,			2,					{SKILL_FIELDAMP, SKILL_TECHNICIAN}, TREE_BUILDINGTREE)
-- .AlwaysActive = true													8,			1,					{}, TREE_BUILDINGTREE)														-7,			2,					{}, TREE_BUILDINGTREE)

-- Gunnery Tree
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE1, "Trigger Discipline I", GOOD.."+2% weapon reload speed\n"..GOOD.."+2% weapon draw speed",
																-5,			6,					{SKILL_TRIGGER_DISCIPLINE2, SKILL_NONE}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE2, "Trigger Discipline II", GOOD.."+3% weapon reload speed\n"..GOOD.."+3% weapon draw speed",
																-4,			3,					{SKILL_TRIGGER_DISCIPLINE3, SKILL_EQUIPPED}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE3, "Trigger Discipline III", GOOD.."+4% weapon reload speed\n"..GOOD.."+4% weapon draw speed",
																-3,			0,					{SKILL_QUICKRELOAD, SKILL_QUICKDRAW, SKILL_WORTHINESS1, SKILL_EGOCENTRIC, SKILL_GUNNER1}, TREE_GUNTREE)
--GM:AddSkill(SKILL_D_PALSY, "Debuff: Palsy", GOOD.."+5 starting Worth\n"..GOOD.."-3% resupply delay\n"..BAD.."Aiming ability reduced when health is low",
--																0,			4,					{SKILL_LEVELHEADED}, TREE_GUNTREE)
GM:AddSkill(SKILL_LEVELHEADED, "Level Headed", GOOD.."-5% reduced effect of aim shake effects",
																2,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_QUICKDRAW, "Quick Draw", GOOD.."+65% weapon draw speed\n"..BAD.."-15% weapon reload speed",
																0,			1,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUS, "Focus I", GOOD.."+3% tighter aiming reticule\n"..BAD.."-3% weapon reload speed",
																5,			6,					{SKILL_NONE, SKILL_FOCUSII}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUSII, "Focus II", GOOD.."+4% tighter aiming reticule\n"..BAD.."-4% weapon reload speed",
																4,			3,					{SKILL_FOCUSIII, SKILL_SCAVENGER, SKILL_PITCHER}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUSIII, "Focus III", GOOD.."+5% tighter aiming reticule\n"..BAD.."-5% weapon reload speed",
																3,			0,					{SKILL_EGOCENTRIC, SKILL_WOOISM, SKILL_ORPHICFOCUS, SKILL_SCOURER}, TREE_GUNTREE)
GM:AddSkill(SKILL_QUICKRELOAD, "Quick Reload", GOOD.."+10% weapon reload speed\n"..BAD.."-25% weapon draw speed",
																-5,			1,					{SKILL_SLEIGHTOFHAND}, TREE_GUNTREE)
GM:AddSkill(SKILL_SLEIGHTOFHAND, "Sleight of Hand", GOOD.."+10% weapon reload speed\n"..BAD.."-5% tighter aiming reticule",
																-5,			-1,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_U_CRYGASGREN, "Unlock: Cryo Gas Grenade", GOOD.."Unlocks purchasing the Cryo Gas Grenade\nVariant of the Corrosive Gas Grenade\nCryo gas deals a bit of damage over time\nZombies are slowed in the effect",
																2,			-3,					{SKILL_EGOCENTRIC}, TREE_GUNTREE)
GM:AddSkill(SKILL_SOFTDET, "Soft Detonation", GOOD.."-40% explosive damage taken\n"..BAD.."-10% explosive damage radius",
																0,			-5,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_ORPHICFOCUS, "Orphic Focus", GOOD.."90% spread while ironsighting\n"..GOOD.."+2% tighter aiming reticule\n"..BAD.."110% spread at any other time\n"..BAD.."-6% reload speed",
																5,			-1,					{SKILL_DELIBRATION}, TREE_GUNTREE)
GM:AddSkill(SKILL_DELIBRATION, "Delibration", GOOD.."+1% tighter aiming reticule",
																6,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_EGOCENTRIC, "Egocentric", GOOD.."-35% damage vs. yourself\n"..BAD.."-5 health",
																0,			-1,					{SKILL_BLASTPROOF}, TREE_GUNTREE)
GM:AddSkill(SKILL_BLASTPROOF, "Blast Proof", GOOD.."-45% damage vs. yourself\n"..BAD.."-7% reload speed\n"..BAD.."-12% weapon draw speed",
																0,			-3,					{SKILL_SOFTDET, SKILL_CANNONBALL, SKILL_CONEFFECT}, TREE_GUNTREE)
GM:AddSkill(SKILL_WOOISM, "Zeal", GOOD.."-50% speed reduction from being ironsighted\n"..BAD.."-25% accuracy bonus from ironsighting",
																5,			1,					{SKILL_TRUEWOOISM}, TREE_GUNTREE)
GM:AddSkill(SKILL_SCAVENGER, "Scavenger's Eyes", GOOD.."See nearby weapons, ammo, and items through walls",
																7,			4,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_PITCHER, "Pitcher", GOOD.."+10% object throw and thrown weapon velocity",
																6,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_EQUIPPED, "Alacrity", GOOD.."Your starting item can be a random special trinket",
																-6,			2,					{}, TREE_GUNTREE)
--GM:AddSkill(SKILL_WORTHINESS1, "Worthiness I", GOOD.."+5 starting worth",
--																-2,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_CANNONBALL, "Cannonball", "-25% projectile speed\n"..GOOD.."+3% projectile damage",
																-2,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_SCOURER, "Scourer", GOOD.."Earn end of wave points as scrap\n"..BAD.."Earn no end of wave points",
																4,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_CONEFFECT, "Concentrated Effect", GOOD.."+5% explosive damage\n"..BAD.."-20% explosive damage radius",
																2,			-5,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRUEWOOISM, "Wooism", GOOD.."No accuracy penalty from moving or jumping\n"..BAD.."No accuracy bonus from crouching or ironsighting",
																7,			0,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_GUNNER1, "Gunner I", GOOD.."+3% Bullet Damage",
																-4,			-3,					{SKILL_GUNNER2}, TREE_GUNTREE)
GM:AddSkill(SKILL_GUNNER2, "Gunner II", GOOD.."+3% Bullet Damage",
																-4,			-4,					{SKILL_GUNNER3, SKILL_GUNNER4}, TREE_GUNTREE)
GM:AddSkill(SKILL_GUNNER3, "Gunner III", GOOD.."+3% Bullet Damage",
																-3,			-5,					{SKILL_GUNNER5}, TREE_GUNTREE)																
GM:AddSkill(SKILL_GUNNER4, "Gunner IV", GOOD.."+3% Bullet Damage",
																-5,			-5,					{SKILL_GUNNER5}, TREE_GUNTREE)
GM:AddSkill(SKILL_GUNNER5, "Gunner V", GOOD.."+3% Bullet Damage",
																-4,			-6,					{}, TREE_GUNTREE)																
																
-- Melee Tree
--GM:AddSkill(SKILL_WORTHINESS2, "Worthiness II", GOOD.."+5 starting worth",
--																-4,			-2,					{SKILL_BATTLER2}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER1, "Battler I", GOOD.."+3% melee damage",
																-6,			0,					{SKILL_NONE}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER2, "Battler II", GOOD.."+3% melee damage",
																-4,			0,					{SKILL_BATTLER1}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER3, "Battler III", GOOD.."+3% melee damage",
																-2,			0,					{SKILL_BATTLER2}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER4, "Battler IV", GOOD.."+3% melee damage",
																0,			0,					{SKILL_BATTLER3}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER5, "Battler V", GOOD.."+3% melee damage",
																2,			0,					{SKILL_BATTLER4}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER6, "Battler VI", GOOD.."+3% Melee Damage\n"..GOOD.."+5 Maximum Health",
																4,			0,					{SKILL_BATTLER5}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER7, "Battler VII", GOOD.."+3% Melee Damage\n"..GOOD.."+5 Maximum Health",
																0,			-4,					{SKILL_BATTLER4}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER8, "Battler VIII", GOOD.."+3% Melee Damage\n"..GOOD.."+5 Maximum Health",
																0,			4,					{SKILL_BATTLER4}, TREE_MELEETREE)																
GM:AddSkill(SKILL_LASTSTAND, "Last Stand", GOOD.."Double melee damage when below 25% health\n"..BAD.."0.85x melee weapon damage at any other time",
																2,			-2,					{SKILL_BATTLER5}, TREE_MELEETREE)
--GM:AddSkill(SKILL_D_CLUMSY, "Debuff: Clumsy", GOOD.."+15 starting Worth\n"..GOOD.."+5 starting points\n"..BAD.."Very easy to be knocked down",
--																-2,			2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_CHEAPKNUCKLE, "Cheap Tactics", GOOD.."Slow targets when striking with a melee weapon from behind\n"..BAD.."-10% melee range",
																0,			-6,					{SKILL_BATTLER7}, TREE_MELEETREE)
GM:AddSkill(SKILL_CRITICALKNUCKLE, "Critical Knuckle", GOOD.."Knockback when using unarmed strikes\n"..BAD.."-25% unarmed strike damage\n"..BAD.."+25% time before next unarmed strike",
																4,			-4,					{SKILL_KNUCKLEMASTER}, TREE_MELEETREE)
GM:AddSkill(SKILL_KNUCKLEMASTER, "Knuckle Master", GOOD.."+75% unarmed strike damage\n"..GOOD.."Movement speed is no longer slower when using unarmed strikes\n"..BAD.."+35% time before next unarmed strike",
																2,			-4,					{SKILL_BATTLER7}, TREE_MELEETREE)
GM:AddSkill(SKILL_COMBOKNUCKLE, "Combo Knuckle", GOOD.."Next unarmed strike is 2x faster if hitting something\n"..BAD.."Next unarmed attack is 2x slower if not hitting something",
																2,			-6,					{SKILL_KNUCKLEMASTER}, TREE_MELEETREE)
GM:AddSkill(SKILL_HEAVYSTRIKES, "Heavy Strikes", GOOD.."+100% melee knockback\n"..BAD.."8% of melee damage dealt is reflected back to you\n"..BAD.."100% reflected if using unarmed strikes",
																-2,			2,					{SKILL_BATTLER3}, TREE_MELEETREE)
GM:AddSkill(SKILL_JOUSTER, "Jouster", GOOD.."+15% melee damage\n"..BAD.."-100% melee knockback",
																0,			6,					{SKILL_BATTLER8}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKY, "Lanky I", GOOD.."+10% melee range\n"..BAD.."-4 Maximum Blood Armor",
																-2,			4,					{SKILL_BATTLER8}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKYII, "Lanky II", GOOD.."+10% melee range\n"..BAD.."-4 Maximum Blood Armor",
																-4,			6,					{SKILL_LANKY}, TREE_MELEETREE)														
GM:AddSkill(SKILL_MASTERCHEF, "Master Chef", GOOD.."Zombies hit by culinary weapons in the past three second have a 12.5% chance to drop food items on death",
																-4,			2,					{SKILL_BATTLER2}, TREE_MELEETREE)
GM:AddSkill(SKILL_LIGHTWEIGHT, "Lightweight", GOOD.."+6 movement speed with a melee weapon equipped\n"..BAD.."-20% melee damage",
																-2,			-2,					{SKILL_BATTLER3}, TREE_MELEETREE)
--GM:AddSkill(SKILL_BLOODLUST, "Bloodlust", "Gain phantom health equal to half the damage taken from zombies\nLose phantom health equal to any healing received\nPhantom health decreases by 5 per second\n"..GOOD.."Heal 25% of damage done with melee from remaining phantom health\n"..BAD.."-50% healing received",
--																-2,			4,					{SKILL_LASTSTAND}, TREE_MELEETREE)
GM:AddSkill(SKILL_BRASH, "Brash", GOOD.."-16% melee swing impact delay\n"..BAD.."-15 speed on melee kill for 10 seconds",
																-2,			-4,					{SKILL_BATTLER7}, TREE_MELEETREE)
GM:AddSkill(SKILL_BRUTE1, "Brute I", GOOD.."+15% Blood Armor Gained On Melee Kill\n" .. GOOD .. "+1 Blood Armor Gained On Melee Kill",
																2,			4,					{SKILL_BATTLER8}, TREE_MELEETREE)
GM:AddSkill(SKILL_BRUTE2, "Brute II", GOOD.."+15% Blood Armor Gained On Melee Kill\n" .. GOOD .. "+1 Blood Armor Gained On Melee Kill",
																4,			6,					{SKILL_BRUTE1}, TREE_MELEETREE)	
GM:AddSkill(SKILL_WARRIOR1, "Warrior I", GOOD.."+5% Melee Damage\n"..GOOD.."+15% Blood Armor Generated\n"..BAD.."-15 Maximum Health",
																6,			0,					{SKILL_BATTLER6}, TREE_MELEETREE)
GM:AddSkill(SKILL_WARRIOR2, "Warrior II", GOOD.."+5% Melee Damage\n"..GOOD.."+15% Blood Armor Generated\n"..BAD.."-15 Maximum Health",
																8,			0,					{SKILL_WARRIOR1}, TREE_MELEETREE)			
GM:AddSkill(SKILL_ASSASSIN1, "Assassin I", GOOD.."+5% Melee Damage\n"..GOOD.."+4 Movement Speed\n"..BAD.."-3 Blood Armor\n"..BAD.."-8% Gun Damage",
																4,			2,					{SKILL_BATTLER6}, TREE_MELEETREE)
GM:AddSkill(SKILL_ASSASSIN2, "Assassin II", GOOD.."+5% Melee Damage\n"..GOOD.."+4 Movement Speed\n"..BAD.."-3 Blood Armor\n"..BAD.."-8% Gun Damage",
																6,			3,					{SKILL_ASSASSIN1}, TREE_MELEETREE)	
GM:AddSkill(SKILL_ASSASSIN3, "Assassin III", GOOD.."+10% Melee Damage\n"..GOOD.."+7 Movement Speed\n"..BAD.."-4 Blood Armor\n"..BAD.."-8% Gun Damage",
																8,			4,					{SKILL_ASSASSIN2}, TREE_MELEETREE)
GM:AddSkill(SKILL_GLADIATOR1, "Gladiator I", GOOD.."+5% Melee Damage\n"..GOOD.."+4 Blood Armor\n"..BAD.."-5 Movement Speed\n"..BAD.."-7% Phasing Speed",
																4,			-2,					{SKILL_BATTLER6}, TREE_MELEETREE)	
GM:AddSkill(SKILL_GLADIATOR2, "Gladiator II", GOOD.."+5% Melee Damage\n"..GOOD.."+4 Blood Armor\n"..BAD.."-5 Movement Speed\n"..BAD.."-7% Phasing Speed",
																6,			-3,					{SKILL_GLADIATOR1}, TREE_MELEETREE)		
GM:AddSkill(SKILL_GLADIATOR3, "Gladiator III", GOOD.."+10% Melee Damage\n"..GOOD.."+7 Blood Armor\n"..BAD.."-5 Movement Speed\n"..BAD.."-6% Phasing Speed",
																8,			-4,					{SKILL_GLADIATOR2}, TREE_MELEETREE)																		

GM:SetSkillModifierFunction(SKILLMOD_SPEED, function(pl, amount)
	pl.SkillSpeedAdd = amount
end)

GM:SetSkillModifierFunction(SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, function(pl, amount)
	pl.MedicHealMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MEDKIT_COOLDOWN_MUL, function(pl, amount)
	pl.MedicCooldownMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_WORTH, function(pl, amount)
	pl.ExtraStartingWorth = amount + math.min(math.floor(pl:GetZSLevel() / 1), 100)
end)

GM:SetSkillModifierFunction(SKILLMOD_FALLDAMAGE_THRESHOLD_MUL, function(pl, amount)
	pl.FallDamageThresholdMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL, function(pl, amount)
	pl.FallDamageSlowDownMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FOODEATTIME_MUL, function(pl, amount)
	pl.FoodEatTimeMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_JUMPPOWER_MUL, function(pl, amount)
	pl.JumpPowerMul = math.Clamp(amount + 1.0, 0.0, 10.0)

	if SERVER then
		pl:ResetJumpPower()
	end
end)

GM:SetSkillModifierFunction(SKILLMOD_DEPLOYSPEED_MUL, function(pl, amount)
	pl.DeploySpeedMultiplier = math.Clamp(amount + 1.0, 0.05, 100.0)

	for _, wep in pairs(pl:GetWeapons()) do
		GAMEMODE:DoChangeDeploySpeed(wep)
	end
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR, function(pl, amount)
	local oldarmor = pl:GetBloodArmor()
	local oldcap = pl.MaxBloodArmor or 8
	local new = 8 + math.Clamp(amount, -20, 1000)

	pl.MaxBloodArmor = new

	if SERVER then
		if oldarmor > oldcap then
			local overcap = oldarmor - oldcap
			pl:SetBloodArmor(pl.MaxBloodArmor + overcap)
		else
			pl:SetBloodArmor(pl:GetBloodArmor() / oldcap * new)
		end
	end
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplier = math.Clamp(amount + 1.0, 0.05, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_DAMAGE_MUL, function(pl, amount)
	pl.MeleeDamageMultiplier = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BULLET_DAMAGE_MUL, function(pl, amount)
	pl.BulletDamageMultiplier = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_SELF_DAMAGE_MUL, function(pl, amount)
	pl.SelfDamageMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_KNOCKBACK_MUL, function(pl, amount)
	pl.MeleeKnockbackMultiplier = math.Clamp(amount + 1.0, 0.0, 10000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_UNARMED_DAMAGE_MUL, function(pl, amount)
	pl.UnarmedDamageMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_UNARMED_SWING_DELAY_MUL, function(pl, amount)
	pl.UnarmedDelayMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BARRICADE_PHASE_SPEED_MUL, function(pl, amount)
	pl.BarricadePhaseSpeedMul = math.Clamp(amount + 1.0, 0.05, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_HAMMER_SWING_DELAY_MUL, function(pl, amount)
	pl.HammerSwingDelayMul = math.Clamp(amount + 1.0, 0.01, 1.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_REPAIRRATE_MUL, function(pl, amount)
	pl.RepairRateMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_AIMSPREAD_MUL, function(pl, amount)
	pl.AimSpreadMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MEDGUN_FIRE_DELAY_MUL, function(pl, amount)
	pl.MedgunFireDelayMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MEDGUN_RELOAD_SPEED_MUL, function(pl, amount)
	pl.MedgunReloadSpeedMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DRONE_GUN_RANGE_MUL, function(pl, amount)
	pl.DroneGunRangeMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_HEALING_RECEIVED, function(pl, amount)
	pl.HealingReceived = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_PISTOL_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierPISTOL = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_SMG_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierSMG1 = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_ASSAULT_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierAR2 = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_SHELL_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierBUCKSHOT = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_RIFLE_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplier357 = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_XBOW_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierXBOWBOLT = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_PULSE_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierPULSE = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_EXP_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierIMPACTMINE = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_ATTACKER_DMG_REFLECT, function(pl, amount)
	pl.BarbedArmor = math.Clamp(amount, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PULSE_WEAPON_SLOW_MUL, function(pl, amount)
	pl.PulseWeaponSlowMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.MeleeDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_POISON_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.PoisonDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.BleedDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_SWING_DELAY_MUL, function(pl, amount)
	pl.MeleeSwingDelayMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_REGENERATION_MUL, function(pl, amount)
	pl.BloodArmorRegeneration = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_MELEEKILL_MUL, function(pl, amount)
	pl.BloodArmorMeleeKillMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_MELEEKILL, function(pl, amount)
	pl.BloodArmorMeleeKill = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, function(pl, amount)
	pl.MeleeMovementSpeedOnKill = math.Clamp(amount, -15, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_POWERATTACK_MUL, function(pl, amount)
	pl.MeleePowerAttackMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_KNOCKDOWN_RECOVERY_MUL, function(pl, amount)
	pl.KnockdownRecoveryMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_RANGE_MUL, function(pl, amount)
	pl.MeleeRangeMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_SLOW_EFF_TAKEN_MUL, function(pl, amount)
	pl.SlowEffTakenMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_EXP_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.ExplosiveDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FIRE_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.FireDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PROP_CARRY_CAPACITY_MUL, function(pl, amount)
	pl.PropCarryCapacityMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PROP_THROW_STRENGTH_MUL, function(pl, amount)
	pl.ObjectThrowStrengthMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PHYSICS_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.PhysicsDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_VISION_ALTER_DURATION_MUL, function(pl, amount)
	pl.VisionAlterDurationMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DIMVISION_EFF_MUL, function(pl, amount)
	pl.DimVisionEffMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PROP_CARRY_SLOW_MUL, function(pl, amount)
	pl.PropCarrySlowMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BLEED_SPEED_MUL, function(pl, amount)
	pl.BleedSpeedMul = math.Clamp(amount + 1.0, 0.1, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_LEG_DAMAGE_ADD, function(pl, amount)
	pl.MeleeLegDamageAdd = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_SIGIL_TELEPORT_MUL, function(pl, amount)
	pl.SigilTeleportTimeMul = math.Clamp(amount + 1.0, 0.1, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, function(pl, amount)
	pl.BarbedArmorPercent = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_POISON_SPEED_MUL, function(pl, amount)
	pl.PoisonSpeedMul = math.Clamp(amount + 1.0, 0.1, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DROP_CHANCE_MUL, function(pl, amount)
	pl.DropChance = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_COLLECT_CHANCE_MUL, function(pl, amount)
	pl.CollectChance = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_AMMOTOCACHE_CHANCE_MUL, function(pl, amount)
	pl.AmmoToCacheChance = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FIRE_ADDED_DAMAGE, function(pl, amount)
	pl.AddedDamageFire = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FIRE_ADDED_DURATION, function(pl, amount)
	pl.FireAddedDuration = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FIRE_INCREASED_CHANCE, function(pl, amount)
	pl.FireIncreasedChance = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RES_THRESHOLD_MUL, function(pl, amount)
	pl.ResThresholdMul = math.Clamp(amount + 1.0, 0.0001, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RESCAS_DAM, function(pl, amount)
	pl.ResCasIncreasedDamage = math.Clamp(amount + 1.0, 0.0001, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RESCAS_RAD, function(pl, amount)
	pl.ResCasIncreasedRadius = math.Clamp(amount + 1.0, 0.0001, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DEPLOYABLE_LIMIT, function(pl, amount)
	pl.DeployableLimit = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_CADE_REPAIR_CAPACITY, function(pl, amount)
	pl.RepairCapacity = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_CADE_DOOR_DAMAGE, function(pl, amount)
	pl.IncreasedDoorDamage = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_CADE_RFE_EFFICIENCY, function(pl, amount)
	pl.DeployableRepairEfficiency = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_CADE_OFFENSE_EFFICIENCY, function(pl, amount)
	pl.DeployableOffenseEfficiency = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DEPLOYABLE_MAXAMMO, function(pl, amount)
	pl.DeployableMaxAmmo = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_GRENADE_MAX_TICKS, function(pl, amount)
	pl.GrenadeTicks = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RESUPPLY_AMMO_MUL, function(pl, amount)
	pl.ResupplyAmmoMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL, GM:MkGenericMod("ProjDamageTakenMul"))
GM:SetSkillModifierFunction(SKILLMOD_EXP_DAMAGE_RADIUS, GM:MkGenericMod("ExpDamageRadiusMul"))
GM:SetSkillModifierFunction(SKILLMOD_WEAPON_WEIGHT_SLOW_MUL, GM:MkGenericMod("WeaponWeightSlowMul"))
GM:SetSkillModifierFunction(SKILLMOD_FRIGHT_DURATION_MUL, GM:MkGenericMod("FrightDurationMul"))
GM:SetSkillModifierFunction(SKILLMOD_IRONSIGHT_EFF_MUL, GM:MkGenericMod("IronsightEffMul"))
GM:SetSkillModifierFunction(SKILLMOD_MEDDART_EFFECTIVENESS_MUL, GM:MkGenericMod("MedDartEffMul"))

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_DMG_REDUCTION, function(pl, amount)
	pl.BloodArmorDamageReductionAdd = amount
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_MUL, function(pl, amount)
	local mul = math.Clamp(amount + 1.0, 0.0, 1000.0)

	pl.MaxBloodArmorMul = mul

	local oldarmor = pl:GetBloodArmor()
	local oldcap = pl.MaxBloodArmor or 20
	local new = pl.MaxBloodArmor * mul

	pl.MaxBloodArmor = new

	if SERVER then
		if oldarmor > oldcap then
			local overcap = oldarmor - oldcap
			pl:SetBloodArmor(pl.MaxBloodArmor + overcap)
		else
			pl:SetBloodArmor(pl:GetBloodArmor() / oldcap * new)
		end
	end
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_GAIN_MUL, GM:MkGenericMod("BloodarmorGainMul"))
GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_GAIN, GM:MkGenericMod("BloodarmorGain"))
GM:SetSkillModifierFunction(SKILLMOD_LOW_HEALTH_SLOW_MUL, GM:MkGenericMod("LowHealthSlowMul"))
GM:SetSkillModifierFunction(SKILLMOD_PROJ_SPEED, GM:MkGenericMod("ProjectileSpeedMul"))

GM:SetSkillModifierFunction(SKILLMOD_ENDWAVE_POINTS, function(pl,amount)
	pl.EndWavePointsExtra = math.Clamp(amount, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_ARSENAL_DISCOUNT, GM:MkGenericMod("ArsenalDiscount"))
GM:SetSkillModifierFunction(SKILLMOD_CLOUD_RADIUS, GM:MkGenericMod("CloudRadius"))
GM:SetSkillModifierFunction(SKILLMOD_CLOUD_TIME, GM:MkGenericMod("CloudTime"))
GM:SetSkillModifierFunction(SKILLMOD_EXP_DAMAGE_MUL, GM:MkGenericMod("ExplosiveDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_PROJECTILE_DAMAGE_MUL, GM:MkGenericMod("ProjectileDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_TURRET_RANGE_MUL, GM:MkGenericMod("TurretRangeMul"))
GM:SetSkillModifierFunction(SKILLMOD_AIM_SHAKE_MUL, GM:MkGenericMod("AimShakeMul"))

GM:AddSkillModifier(SKILL_SPEED1, SKILLMOD_SPEED, 0.5)
GM:AddSkillModifier(SKILL_SPEED2, SKILLMOD_SPEED, 0.75)
GM:AddSkillModifier(SKILL_SPEED3, SKILLMOD_SPEED, 1)
GM:AddSkillModifier(SKILL_SPEED4, SKILLMOD_SPEED, 1.25)
GM:AddSkillModifier(SKILL_SPEED5, SKILLMOD_SPEED, 1.50)

--GM:AddSkillModifier(SKILL_ASDF, SKILLMOD_SPEED, 0.5)

GM:AddSkillModifier(SKILL_STOIC1, SKILLMOD_HEALTH, 5)
GM:AddSkillModifier(SKILL_STOIC2, SKILLMOD_HEALTH, 5)
GM:AddSkillModifier(SKILL_STOIC3, SKILLMOD_HEALTH, 5)
GM:AddSkillModifier(SKILL_STOIC4, SKILLMOD_HEALTH, 5)
GM:AddSkillModifier(SKILL_STOIC5, SKILLMOD_HEALTH, 5)

GM:AddSkillModifier(SKILL_GUNNER1, SKILLMOD_BULLET_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_GUNNER2, SKILLMOD_BULLET_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_GUNNER3, SKILLMOD_BULLET_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_GUNNER4, SKILLMOD_BULLET_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_GUNNER5, SKILLMOD_BULLET_DAMAGE_MUL, 0.03)

GM:AddSkillModifier(SKILL_VITALITY1, SKILLMOD_HEALTH, 8)
GM:AddSkillModifier(SKILL_VITALITY2, SKILLMOD_HEALTH, 8)
GM:AddSkillModifier(SKILL_VITALITY3, SKILLMOD_HEALTH, 14)

GM:AddSkillModifier(SKILL_MOTIONI, SKILLMOD_SPEED, 1)
GM:AddSkillModifier(SKILL_MOTIONI, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.03)

GM:AddSkillModifier(SKILL_MOTIONII, SKILLMOD_SPEED, 1)
GM:AddSkillModifier(SKILL_MOTIONII, SKILLMOD_RELOADSPEED_MUL, -0.03)


GM:AddSkillModifier(SKILL_MOTIONIII, SKILLMOD_SPEED, 1)
GM:AddSkillModifier(SKILL_MOTIONIII, SKILLMOD_SIGIL_TELEPORT_MUL, -0.03)

GM:AddSkillModifier(SKILL_FOCUS, SKILLMOD_AIMSPREAD_MUL, -0.03)
GM:AddSkillModifier(SKILL_FOCUS, SKILLMOD_RELOADSPEED_MUL, -0.03)

GM:AddSkillModifier(SKILL_FOCUSII, SKILLMOD_AIMSPREAD_MUL, -0.04)
GM:AddSkillModifier(SKILL_FOCUSII, SKILLMOD_RELOADSPEED_MUL, -0.04)

GM:AddSkillModifier(SKILL_FOCUSIII, SKILLMOD_AIMSPREAD_MUL, -0.05)
GM:AddSkillModifier(SKILL_FOCUSIII, SKILLMOD_RELOADSPEED_MUL, -0.05)

GM:AddSkillModifier(SKILL_ORPHICFOCUS, SKILLMOD_RELOADSPEED_MUL, -0.06)
GM:AddSkillModifier(SKILL_ORPHICFOCUS, SKILLMOD_AIMSPREAD_MUL, -0.02)

GM:AddSkillModifier(SKILL_DELIBRATION, SKILLMOD_AIMSPREAD_MUL, -0.01)

GM:AddSkillModifier(SKILL_WOOISM, SKILLMOD_IRONSIGHT_EFF_MUL, -0.25)

GM:AddSkillModifier(SKILL_GLUTTON, SKILLMOD_HEALTH, -5)

GM:AddSkillModifier(SKILL_TANKER, SKILLMOD_HEALTH, 25)
GM:AddSkillModifier(SKILL_TANKER, SKILLMOD_BLOODARMOR, 4)

GM:AddSkillModifier(SKILL_ULTRANIMBLE, SKILLMOD_HEALTH, -10)
GM:AddSkillModifier(SKILL_ULTRANIMBLE, SKILLMOD_SPEED, 7)

GM:AddSkillModifier(SKILL_EGOCENTRIC, SKILLMOD_SELF_DAMAGE_MUL, -0.35)
GM:AddSkillModifier(SKILL_EGOCENTRIC, SKILLMOD_HEALTH, -5)

GM:AddSkillModifier(SKILL_BLASTPROOF, SKILLMOD_SELF_DAMAGE_MUL, -0.45)
GM:AddSkillModifier(SKILL_BLASTPROOF, SKILLMOD_RELOADSPEED_MUL, -0.07)
GM:AddSkillModifier(SKILL_BLASTPROOF, SKILLMOD_DEPLOYSPEED_MUL, -0.12)

GM:AddSkillModifier(SKILL_SURGEON1, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.08)
GM:AddSkillModifier(SKILL_SURGEON2, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.09)
GM:AddSkillModifier(SKILL_SURGEON3, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.10)
GM:AddSkillModifier(SKILL_SURGEONIV, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.11)

GM:AddSkillModifier(SKILL_BIOLOGYI, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.08)
GM:AddSkillModifier(SKILL_BIOLOGYII, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.09)
GM:AddSkillModifier(SKILL_BIOLOGYIII, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.1)
GM:AddSkillModifier(SKILL_BIOLOGYIV, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.11)

GM:AddSkillModifier(SKILL_D_SLOW, SKILLMOD_WORTH, 0)
GM:AddSkillModifier(SKILL_D_SLOW, SKILLMOD_ENDWAVE_POINTS, 1)
GM:AddSkillModifier(SKILL_D_SLOW, SKILLMOD_SPEED, -33.75)

GM:AddSkillModifier(SKILL_GOURMET, SKILLMOD_FOODRECOVERY_MUL, 0.15)

GM:AddSkillModifier(SKILL_SUGARRUSH, SKILLMOD_FOODRECOVERY_MUL, -0.35)

GM:AddSkillModifier(SKILL_BATTLER1, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER2, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER3, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER4, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER5, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)

GM:AddSkillModifier(SKILL_BATTLER6, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER6, SKILLMOD_HEALTH, 5)
GM:AddSkillModifier(SKILL_BATTLER7, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER7, SKILLMOD_HEALTH, 5)
GM:AddSkillModifier(SKILL_BATTLER8, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER8, SKILLMOD_HEALTH, 5)

GM:AddSkillModifier(SKILL_JOUSTER, SKILLMOD_MELEE_DAMAGE_MUL, 0.15)
GM:AddSkillModifier(SKILL_JOUSTER, SKILLMOD_MELEE_KNOCKBACK_MUL, -1.0)

GM:AddSkillModifier(SKILL_QUICKDRAW, SKILLMOD_DEPLOYSPEED_MUL, 0.65)
GM:AddSkillModifier(SKILL_QUICKDRAW, SKILLMOD_RELOADSPEED_MUL, -0.15)

GM:AddSkillModifier(SKILL_QUICKRELOAD, SKILLMOD_RELOADSPEED_MUL, 0.10)
GM:AddSkillModifier(SKILL_QUICKRELOAD, SKILLMOD_DEPLOYSPEED_MUL, -0.25)

GM:AddSkillModifier(SKILL_SLEIGHTOFHAND, SKILLMOD_RELOADSPEED_MUL, 0.10)
GM:AddSkillModifier(SKILL_SLEIGHTOFHAND, SKILLMOD_AIMSPREAD_MUL, -0.05)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE1, SKILLMOD_RELOADSPEED_MUL, 0.02)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE1, SKILLMOD_DEPLOYSPEED_MUL, 0.02)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE2, SKILLMOD_RELOADSPEED_MUL, 0.03)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE2, SKILLMOD_DEPLOYSPEED_MUL, 0.03)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE3, SKILLMOD_RELOADSPEED_MUL, 0.04)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE3, SKILLMOD_DEPLOYSPEED_MUL, 0.04)

GM:AddSkillModifier(SKILL_PHASER, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.05)

GM:AddSkillModifier(SKILL_DRIFT, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.05)

GM:AddSkillModifier(SKILL_WARP, SKILLMOD_SIGIL_TELEPORT_MUL, -0.08)

GM:AddSkillModifier(SKILL_SAFEFALL, SKILLMOD_FALLDAMAGE_DAMAGE_MUL, -0.4)
GM:AddSkillModifier(SKILL_SAFEFALL, SKILLMOD_FALLDAMAGE_RECOVERY_MUL, -0.5)
GM:AddSkillModifier(SKILL_SAFEFALL, SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL, 0.4)

GM:AddSkillModifier(SKILL_BACKPEDDLER, SKILLMOD_SPEED, -7)
GM:AddSkillFunction(SKILL_BACKPEDDLER, function(pl, active)
	pl.NoBWSpeedPenalty = active
end)

GM:AddSkillModifier(SKILL_D_CLUMSY, SKILLMOD_WORTH, 0)
GM:AddSkillModifier(SKILL_D_CLUMSY, SKILLMOD_POINTS, 5)
GM:AddSkillFunction(SKILL_D_CLUMSY, function(pl, active)
	pl.IsClumsy = active
end)

GM:AddSkillModifier(SKILL_D_NOODLEARMS, SKILLMOD_WORTH, 0)
GM:AddSkillModifier(SKILL_D_NOODLEARMS, SKILLMOD_SCRAP_START, 1)
GM:AddSkillFunction(SKILL_D_NOODLEARMS, function(pl, active)
	pl.NoObjectPickup = active
end)

GM:AddSkillModifier(SKILL_D_PALSY, SKILLMOD_WORTH, 0)
GM:AddSkillModifier(SKILL_D_PALSY, SKILLMOD_RESUPPLY_DELAY_MUL, -0.03)
GM:AddSkillFunction(SKILL_D_PALSY, function(pl, active)
	pl.HasPalsy = active
end)

GM:AddSkillModifier(SKILL_D_HEMOPHILIA, SKILLMOD_WORTH, 0)
GM:AddSkillModifier(SKILL_D_HEMOPHILIA, SKILLMOD_SCRAP_START, 3)
GM:AddSkillFunction(SKILL_D_HEMOPHILIA, function(pl, active)
	pl.HasHemophilia = active
end)

GM:AddSkillModifier(SKILL_D_LATEBUYER, SKILLMOD_WORTH, 0)
GM:AddSkillModifier(SKILL_D_LATEBUYER, SKILLMOD_ARSENAL_DISCOUNT, -0.05)

GM:AddSkillModifier(SKILL_HAEMOSTASIS, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.10)

GM:AddSkillModifier(SKILL_D_WEAKNESS, SKILLMOD_WORTH, 0)
GM:AddSkillModifier(SKILL_D_WEAKNESS, SKILLMOD_ENDWAVE_POINTS, 1)
GM:AddSkillModifier(SKILL_D_WEAKNESS, SKILLMOD_HEALTH, -35)

GM:AddSkillModifier(SKILL_D_WIDELOAD, SKILLMOD_WORTH, 0)
GM:AddSkillModifier(SKILL_D_WIDELOAD, SKILLMOD_RESUPPLY_DELAY_MUL, -0.05)
GM:AddSkillFunction(SKILL_D_WIDELOAD, function(pl, active)
	pl.NoGhosting = active
end)

GM:AddSkillFunction(SKILL_WOOISM, function(pl, active)
	pl.Wooism = active
end)

GM:AddSkillFunction(SKILL_ORPHICFOCUS, function(pl, active)
	pl.Orphic = active
end)

--GM:AddSkillModifier(SKILL_WORTHINESS1, SKILLMOD_WORTH, 5)
--GM:AddSkillModifier(SKILL_WORTHINESS2, SKILLMOD_WORTH, 5)
--GM:AddSkillModifier(SKILL_WORTHINESS3, SKILLMOD_WORTH, 5)
--GM:AddSkillModifier(SKILL_WORTHINESS4, SKILLMOD_WORTH, 5)
--GM:AddSkillModifier(SKILL_WORTHINESS5, SKILLMOD_WORTH, 5)
--GM:AddSkillModifier(SKILL_WORTHINESS6, SKILLMOD_WORTH, 5)

GM:AddSkillModifier(SKILL_KNUCKLEMASTER, SKILLMOD_UNARMED_SWING_DELAY_MUL, 0.35)
GM:AddSkillModifier(SKILL_KNUCKLEMASTER, SKILLMOD_UNARMED_DAMAGE_MUL, 0.75)

GM:AddSkillModifier(SKILL_CRITICALKNUCKLE, SKILLMOD_UNARMED_DAMAGE_MUL, -0.25)
GM:AddSkillModifier(SKILL_CRITICALKNUCKLE, SKILLMOD_UNARMED_SWING_DELAY_MUL, 0.25)

--GM:AddSkillModifier(SKILL_SMARTTARGETING, SKILLMOD_MEDDART_EFFECTIVENESS_MUL, -0.15)

GM:AddSkillModifier(SKILL_RECLAIMSOL, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, 1.5)
GM:AddSkillModifier(SKILL_RECLAIMSOL, SKILLMOD_MEDGUN_RELOAD_SPEED_MUL, -0.4)

GM:AddSkillModifier(SKILL_LANKY, SKILLMOD_MELEE_RANGE_MUL, 0.10)
GM:AddSkillModifier(SKILL_LANKY, SKILLMOD_BLOODARMOR, -4)

GM:AddSkillModifier(SKILL_LANKYII, SKILLMOD_MELEE_RANGE_MUL, 0.10)
GM:AddSkillModifier(SKILL_LANKYII, SKILLMOD_BLOODARMOR, -4)

GM:AddSkillModifier(SKILL_D_FRAIL, SKILLMOD_WORTH, 15)
GM:AddSkillModifier(SKILL_D_FRAIL, SKILLMOD_POINTS, 5)
GM:AddSkillFunction(SKILL_D_FRAIL, function(pl, active)
	pl:SetDTBool(DT_PLAYER_BOOL_FRAIL, active)
end)

GM:AddSkillModifier(SKILL_LIGHTWEIGHT, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)

GM:AddSkillModifier(SKILL_AGILEI, SKILLMOD_JUMPPOWER_MUL, 0.04)
GM:AddSkillModifier(SKILL_AGILEI, SKILLMOD_SPEED, -2)

GM:AddSkillModifier(SKILL_AGILEII, SKILLMOD_JUMPPOWER_MUL, 0.05)
GM:AddSkillModifier(SKILL_AGILEII, SKILLMOD_SPEED, -3)

GM:AddSkillModifier(SKILL_AGILEIII, SKILLMOD_JUMPPOWER_MUL, 0.06)
GM:AddSkillModifier(SKILL_AGILEIII, SKILLMOD_SPEED, -4)

GM:AddSkillModifier(SKILL_SOFTDET, SKILLMOD_EXP_DAMAGE_RADIUS, -0.10)
GM:AddSkillModifier(SKILL_SOFTDET, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, -0.4)

--GM:AddSkillModifier(SKILL_IRONBLOOD, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.50)
--GM:AddSkillModifier(SKILL_IRONBLOOD, SKILLMOD_SPEED, -10)

GM:AddSkillModifier(SKILL_BLOODLETTER, SKILLMOD_BLOODARMOR_REGENERATION_MUL, 0.2)

GM:AddSkillModifier(SKILL_SURESTEP, SKILLMOD_SPEED, -4)
GM:AddSkillModifier(SKILL_SURESTEP, SKILLMOD_SLOW_EFF_TAKEN_MUL, -0.35)

GM:AddSkillModifier(SKILL_INTREPID, SKILLMOD_SPEED, -4)
GM:AddSkillModifier(SKILL_INTREPID, SKILLMOD_LOW_HEALTH_SLOW_MUL, -0.35)

GM:AddSkillModifier(SKILL_UNBOUND, SKILLMOD_SPEED, -4)

GM:AddSkillModifier(SKILL_CHEAPKNUCKLE, SKILLMOD_MELEE_RANGE_MUL, -0.1)

GM:AddSkillModifier(SKILL_HEAVYSTRIKES, SKILLMOD_MELEE_KNOCKBACK_MUL, 1)

GM:AddSkillModifier(SKILL_CANNONBALL, SKILLMOD_PROJ_SPEED, -0.25)
GM:AddSkillModifier(SKILL_CANNONBALL, SKILLMOD_PROJECTILE_DAMAGE_MUL, 0.03)

GM:AddSkillModifier(SKILL_CONEFFECT, SKILLMOD_EXP_DAMAGE_RADIUS, -0.2)
GM:AddSkillModifier(SKILL_CONEFFECT, SKILLMOD_EXP_DAMAGE_MUL, 0.05)

GM:AddSkillModifier(SKILL_CARDIOTONIC, SKILLMOD_SPEED, -12)
GM:AddSkillModifier(SKILL_CARDIOTONIC, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.2)

GM:AddSkillFunction(SKILL_SCOURER, function(pl, active)
	pl.Scourer = active
end)

GM:AddSkillModifier(SKILL_DISPERSION, SKILLMOD_CLOUD_RADIUS, 0.15)

GM:AddSkillModifier(SKILL_BRASH, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.16)
GM:AddSkillModifier(SKILL_BRASH, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, -15)

GM:AddSkillModifier(SKILL_CIRCULATION, SKILLMOD_BLOODARMOR, 2)

GM:AddSkillModifier(SKILL_SANGUINE, SKILLMOD_BLOODARMOR, 5)
GM:AddSkillModifier(SKILL_SANGUINE, SKILLMOD_HEALTH, -10)

GM:AddSkillModifier(SKILL_ANTIGEN, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.05)

GM:AddSkillModifier(SKILL_LEVELHEADED, SKILLMOD_AIM_SHAKE_MUL, -0.05)

GM:AddSkillModifier(SKILL_ROBUST, SKILLMOD_WEAPON_WEIGHT_SLOW_MUL, -0.06)

GM:AddSkillFunction(SKILL_TRUEWOOISM, function(pl, active)
	pl.TrueWooism = active
end)

GM:AddSkillModifier(SKILL_GLADIATOR1, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
GM:AddSkillModifier(SKILL_GLADIATOR1, SKILLMOD_BLOODARMOR, 4)
GM:AddSkillModifier(SKILL_GLADIATOR1, SKILLMOD_SPEED, -5)
GM:AddSkillModifier(SKILL_GLADIATOR1, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, -0.07)

GM:AddSkillModifier(SKILL_GLADIATOR2, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
GM:AddSkillModifier(SKILL_GLADIATOR1, SKILLMOD_BLOODARMOR, 4)
GM:AddSkillModifier(SKILL_GLADIATOR2, SKILLMOD_SPEED, -5)
GM:AddSkillModifier(SKILL_GLADIATOR2, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, -0.07)

GM:AddSkillModifier(SKILL_GLADIATOR3, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
GM:AddSkillModifier(SKILL_GLADIATOR1, SKILLMOD_BLOODARMOR, 7)
GM:AddSkillModifier(SKILL_GLADIATOR3, SKILLMOD_SPEED, -5)
GM:AddSkillModifier(SKILL_GLADIATOR3, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, -0.06)

GM:AddSkillModifier(SKILL_ASSASSIN1, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_ASSASSIN1, SKILLMOD_SPEED, 4)
GM:AddSkillModifier(SKILL_ASSASSIN1, SKILLMOD_BLOODARMOR, -3)
GM:AddSkillModifier(SKILL_ASSASSIN1, SKILLMOD_BULLET_DAMAGE_MUL, -0.08)

GM:AddSkillModifier(SKILL_ASSASSIN2, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_ASSASSIN2, SKILLMOD_SPEED, 4)
GM:AddSkillModifier(SKILL_ASSASSIN2, SKILLMOD_BLOODARMOR, -3)
GM:AddSkillModifier(SKILL_ASSASSIN2, SKILLMOD_BULLET_DAMAGE_MUL, -0.08)

GM:AddSkillModifier(SKILL_ASSASSIN3, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_ASSASSIN3, SKILLMOD_SPEED, 7)
GM:AddSkillModifier(SKILL_ASSASSIN3, SKILLMOD_BLOODARMOR, -4)
GM:AddSkillModifier(SKILL_ASSASSIN3, SKILLMOD_BULLET_DAMAGE_MUL, -0.08)

GM:AddSkillModifier(SKILL_BRUTE1, SKILLMOD_BLOODARMOR_MELEEKILL_MUL, 0.15)
GM:AddSkillModifier(SKILL_BRUTE1, SKILLMOD_BLOODARMOR_MELEEKILL, 1)

GM:AddSkillModifier(SKILL_BRUTE2, SKILLMOD_BLOODARMOR_MELEEKILL_MUL, 0.15)
GM:AddSkillModifier(SKILL_BRUTE2, SKILLMOD_BLOODARMOR_MELEEKILL, 1)

GM:AddSkillModifier(SKILL_WARRIOR1, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
GM:AddSkillModifier(SKILL_WARRIOR1, SKILLMOD_BLOODARMOR_REGENERATION_MUL, 0.15)
GM:AddSkillModifier(SKILL_WARRIOR1, SKILLMOD_HEALTH, -15)

GM:AddSkillModifier(SKILL_WARRIOR2, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
GM:AddSkillModifier(SKILL_WARRIOR2, SKILLMOD_BLOODARMOR_REGENERATION_MUL, 0.15)
GM:AddSkillModifier(SKILL_WARRIOR2, SKILLMOD_HEALTH, -15)
