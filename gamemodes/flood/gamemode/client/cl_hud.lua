surface.CreateFont( "Flood_HUD_Small", {
	 font = "Tehoma",
	 size = 14,
	 weight = 500,
	 antialias = true
})

surface.CreateFont( "Flood_HUD", {
	 font = "Tehoma",
	 size = 16,
	 weight = 500,
	 antialias = true
})

surface.CreateFont( "Flood_HUD_Large", {
	 font = "Tehoma",
	 size = 30,
	 weight = 500,
	 antialias = true
})

surface.CreateFont( "Flood_HUD_B", {
	 font = "Tehoma",
	 size = 18,
	 weight = 600,
	 antialias = true
})

-- Hud Stuff
local color_grey = Color(120, 120, 120, 100)
local color_black = Color(0, 0, 0, 200)
local active_color = Color(24, 24, 24, 255)
local outline_color = Color(0, 0, 0, 255)
local x = ScrW()
local y = ScrH()

-- Timer Stuff
local GameState = 0
local BuildTimer = -1
local FloodTimer = -1
local FightTimer = -1
local ResetTimer = -1

local xPos = x * 0.0025
local yPos = y * 0.005

-- Hud Positioning
local Spacer = y * 0.006
local xSize = x * 0.2
local ySize = y * 0.04
local bWidth = Spacer + xSize + Spacer
local bHeight = Spacer + ySize + Spacer

net.Receive("RoundState", function(len)
	GameState = net.ReadFloat()
	BuildTimer = net.ReadFloat()
	FloodTimer = net.ReadFloat()
	FightTimer = net.ReadFloat()
	ResetTimer = net.ReadFloat()
end)

function GM:HUDPaint()

	if BuildTimer and FloodTimer and FightTimer and ResetTimer then
		if GameState == 0 then
			draw.RoundedBoxEx(6, xPos, y * 0.005, x * 0.175,  x * 0.018, active_color, true, true, false, false)
			
			draw.SimpleText("Waiting for players.", "Flood_HUD", x * 0.01, y * 0.01, color_white, 0, 0)
			draw.SimpleText("Build a boat.", "Flood_HUD", x * 0.01, y * 0.044, color_grey, 0, 0)
			draw.SimpleText("Get on your boat!", "Flood_HUD", x * 0.01, y * 0.078, color_grey, 0, 0)
			draw.SimpleText("Destroy enemy boats!", "Flood_HUD", x * 0.01, y * 0.115, color_grey, 0, 0)
			draw.SimpleText("Restarting the round.", "Flood_HUD", x * 0.01, y * 0.151, color_grey, 0, 0)
		else
			draw.RoundedBoxEx(6, xPos, y * 0.005, x * 0.175,  x * 0.018, color_grey, true, true, false, false)
		end
		
		if GameState == 1 then
			draw.RoundedBox(0, xPos, yPos + (Spacer * 6), x * 0.175,  x * 0.018, active_color)
			draw.SimpleText(BuildTimer, "Flood_HUD", x * 0.15, y * 0.044, color_white, 0, 0)

			draw.SimpleText("Waiting for players.", "Flood_HUD", x * 0.01, y * 0.01, color_grey, 0, 0)
			draw.SimpleText("Build a boat.", "Flood_HUD", x * 0.01, y * 0.044, color_white, 0, 0)
			draw.SimpleText("Get on your boat!", "Flood_HUD", x * 0.01, y * 0.078, color_grey, 0, 0)
			draw.SimpleText("Destroy enemy boats!", "Flood_HUD", x * 0.01, y * 0.115, color_grey, 0, 0)
			draw.SimpleText("Restarting the round.", "Flood_HUD", x * 0.01, y * 0.151, color_grey, 0, 0)
		else
			draw.RoundedBox(0, xPos, yPos + (Spacer * 6), x * 0.175,  x * 0.018, color_grey)
			draw.SimpleText(BuildTimer, "Flood_HUD", x * 0.15, y * 0.044, color_grey, 0, 0)
		end

		if GameState == 2 then
			draw.RoundedBox(0, xPos, yPos + (Spacer * 12), x * 0.175,  x * 0.018, active_color)
			draw.SimpleText(FloodTimer, "Flood_HUD", x * 0.15, y * 0.078, color_white, 0, 0)

			draw.SimpleText("Waiting for players.", "Flood_HUD", x * 0.01, y * 0.01, color_grey, 0, 0)
			draw.SimpleText("Build a boat.", "Flood_HUD", x * 0.01, y * 0.044, color_grey, 0, 0)
			draw.SimpleText("Get on your boat!", "Flood_HUD", x * 0.01, y * 0.078, color_white, 0, 0)
			draw.SimpleText("Destroy enemy boats!", "Flood_HUD", x * 0.01, y * 0.115, color_grey, 0, 0)
			draw.SimpleText("Restarting the round.", "Flood_HUD", x * 0.01, y * 0.151, color_grey, 0, 0)
		else
			draw.RoundedBox(0, xPos, yPos + (Spacer * 12), x * 0.175,  x * 0.018, color_grey)
			draw.SimpleText(FloodTimer, "Flood_HUD", x * 0.15, y * 0.078, color_grey, 0, 0)
		end
		
		if GameState == 3 then
			draw.RoundedBox(0, xPos, yPos + (Spacer * 18), x * 0.175,  x * 0.018, active_color)

			draw.SimpleText(FightTimer, "Flood_HUD", x * 0.15, y * 0.115, color_white, 0, 0)
			draw.SimpleText("Waiting for players.", "Flood_HUD", x * 0.01, y * 0.01, color_grey, 0, 0)
			draw.SimpleText("Build a boat.", "Flood_HUD", x * 0.01, y * 0.044, color_grey, 0, 0)
			draw.SimpleText("Get on your boat!", "Flood_HUD", x * 0.01, y * 0.078, color_grey, 0, 0)
			draw.SimpleText("Destroy enemy boats!", "Flood_HUD", x * 0.01, y * 0.115, color_white, 0, 0)
			draw.SimpleText("Restarting the round.", "Flood_HUD", x * 0.01, y * 0.151, color_grey, 0, 0)
		else
			draw.RoundedBox(0, xPos, yPos + (Spacer * 18), x * 0.175,  x * 0.018, color_grey)
			draw.SimpleText(FightTimer, "Flood_HUD", x * 0.15, y * 0.115, color_grey, 0, 0)
		end

		if GameState == 4 then
			draw.RoundedBoxEx(6, xPos, yPos + (Spacer * 24), x * 0.175,  x * 0.018, active_color, false, false, true, true)
			
			draw.SimpleText(ResetTimer, "Flood_HUD", x * 0.15, y * 0.151, color_white, 0, 0)
			draw.SimpleText("Waiting for players.", "Flood_HUD", x * 0.01, y * 0.01, color_grey, 0, 0)
			draw.SimpleText("Build a boat.", "Flood_HUD", x * 0.01, y * 0.044, color_grey, 0, 0)
			draw.SimpleText("Get on your boat!", "Flood_HUD", x * 0.01, y * 0.078, color_grey, 0, 0)
			draw.SimpleText("Destroy enemy boats!", "Flood_HUD", x * 0.01, y * 0.115, color_grey, 0, 0)
			draw.SimpleText("Restarting the round.", "Flood_HUD", x * 0.01, y * 0.151, color_white, 0, 0)
		else
			draw.RoundedBoxEx(6,xPos, yPos + (Spacer * 24), x * 0.175,  x * 0.018, color_grey, false, false, true, true)
			draw.SimpleText(ResetTimer, "Flood_HUD", x * 0.15, y * 0.151, color_grey, 0, 0)
		end
	end

	-- Display Prop's Health
	local tr = util.TraceLine(util.GetPlayerTrace(LocalPlayer()))
	if tr.Entity:IsValid() and not tr.Entity:IsPlayer() then
		if tr.Entity:GetNWFloat("CurrentPropHealth") == "" or tr.Entity:GetNWFloat("CurrentPropHealth") == nil or tr.Entity:GetNWFloat("CurrentPropHealth") == NULL then
			draw.SimpleText("Fetching Health", "Flood_HUD_Small", x * 0.5, y * 0.5 - 25, color_white, 1, 1)
		else
			draw.SimpleText("Health: " .. tr.Entity:GetNWFloat("CurrentPropHealth"), "Flood_HUD_Small", x * 0.5, y * 0.5 - 25, color_white, 1, 1)
		end
	end

	-- Display Player's Health and Name
	if tr.Entity:IsValid() and tr.Entity:IsPlayer() then
		draw.SimpleText("Name: " .. tr.Entity:GetName(), "Flood_HUD_Small", x * 0.5, y * 0.5 - 75, color_white, 1, 1)
		draw.SimpleText("Health: " .. tr.Entity:Health(), "Flood_HUD_Small", x * 0.5, y * 0.5 - 60, color_white, 1, 1)
	end
	
	local elementNo = 0
	local elementCount = 4
	local elementColor = {}
	local elementHeight = 40
	local elementWidth = 360
	local elementYSpacing
	local elementXSpacing

	-- Bottom left HUD Stuff
	if LocalPlayer():Alive() and IsValid(LocalPlayer()) then
		draw.RoundedBox(6, 4, y - (4 * (elementCount + 2)) - (40 * (elementCount)), elementWidth, (4 * (elementCount + 1)) + (40 * elementCount), Color(24, 24, 24, 175))
		
		local pHealth = LocalPlayer():Health()
		local pHealthClamp = math.Clamp(pHealth / 100, 0, 1)
		
		--Health
		elementColor[1] = Color(0, 0, 0, 255)
		--Ammo
		elementColor[2] = Color(255, 180, 0, 255)
		--Money
		elementColor[3] = Color(200, 0, 50, 255)
		--Experience
		elementColor[4] = Color(0, 0, 0, 255)
		
		local elementList = {}
		for i = 1, 4 do
			draw.RoundedBox(4, 8, y - (4 * (6 - i)) - (40 * (5 - i)), elementWidth - 8, 40, elementColor[i])
		end
		
		--Health 
		elementNo = 1
		
		local r = math.Clamp((100 - pHealth) * 255 / 50, 0, 255)
		local g = math.Clamp(pHealth * 255 / 50, 0, 255)
		
		draw.RoundedBox(4, 8, y - (4 * (6 - elementNo)) - (40 * (5 - elementNo)), math.Round(elementWidth * pHealthClamp, 0) - 8, 40, Color(r or 255, g or 25, 50, 255))
		draw.SimpleText(math.Max(pHealth, 0).." HP","Flood_HUD_B", (elementWidth / 2) + 8, y - (4 * (6 - elementNo)) - (40 * (4.5 - elementNo)), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
		--Ammo
		elementNo = 2
		if IsValid(LocalPlayer():GetActiveWeapon()) then
			if LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()) > 0 or LocalPlayer():GetActiveWeapon():Clip1() > 0 then
				local wBulletCount = (LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()) + LocalPlayer():GetActiveWeapon():Clip1()) + 1
				local wBulletClamp = math.Clamp(wBulletCount / 100, 0, 1)
				local wBulletWidth = (xSize - bWidth) * wBulletClamp

				draw.SimpleText(wBulletCount.." Bullets", "Flood_HUD_B", (elementWidth / 2) + 8, y - (4 * (6 - elementNo)) - (40 * (4.5 - elementNo)), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText("Doesn't Use Ammo", "Flood_HUD_B", (elementWidth / 2) + 8, y - (4 * (6 - elementNo)) - (40 * (4.5 - elementNo)), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		else
			draw.SimpleText("No Ammo", "Flood_HUD_B", (elementWidth / 2) + 8, y - (4 * (6 - elementNo)) - (40 * (4.5 - elementNo)), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		
		--Money
		elementNo = 3
		
		local pCash = LocalPlayer():GetNWFloat("flood_cash") or 0
		local pCashClamp = math.Clamp(pCash / 5000, 0, xSize)
		
		draw.SimpleText("$"..pCash, "Flood_HUD_B", (elementWidth / 2) + 8, y - (4 * (6 - elementNo)) - (40 * (4.5 - elementNo)), WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		
		--Experience/Level
		elementNo = 4
		
		local XP = ExtraExp(LocalPlayer())
		local XPNextLevel = ExpForLevel(LocalPlayer())
		local LVL = CalculateLevel(LocalPlayer())
		local XPRatio = math.Clamp(XP / XPNextLevel, 0, 1) 
		
		draw.RoundedBox(4, 8, y - (4 * (6 - elementNo)) - (40 * (5 - elementNo)), math.floor(elementWidth * XPRatio, 0) - 8, 40, Color(0, 225, 255, 255))
		draw.SimpleText("Level " .. LVL .. ", " .. math.floor(XP) .. " / " .. XPNextLevel .. " Exp", "Flood_HUD_B", (elementWidth / 2) + 8, y - (4 * (6 - elementNo)) - (40 * (4.5 - elementNo)), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function hidehud(name)
	for k, v in pairs{"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"} do 
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "hidehud", hidehud) 