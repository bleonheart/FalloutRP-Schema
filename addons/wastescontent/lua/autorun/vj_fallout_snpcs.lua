------------------ Addon Information ------------------
local PublicAddonName = "[VJ] Fallout SNPCs"
local AddonName = "[VJ] Fallout SNPCs"
local AddonType = "SNPCs"
local AutorunFile = "autorun/vj_as_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Fallout" -- Category, you can also set a category individually by replacing the vCat with a string value
	
	VJ.AddNPC("Giant Ant","vj_fallout_ant",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Deathclaw","vj_fallout_deathclaw",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Feral Dog","vj_fallout_dog",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Gecko","vj_fallout_gecko",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Feral Ghoul","vj_fallout_ghoul",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Mirelurk","vj_fallout_mirelurks",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Molerat","vj_fallout_molerat",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Giant Rat","vj_fallout_rat",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Radroach","vj_fallout_roach",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Radscorpion","vj_fallout_scorps",vCat) -- Adds a NPC to the spawnmenu
	VJ.AddNPC("Yao Guai","vj_fallout_yaoguai",vCat) -- Adds a NPC to the spawnmenu

-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end