ENT.Base 			= "npc_vj_creature_base" -- Full list of bases is in the base, or go back to this link and read the list: https://saludos.sites.google.com/site/vrejgaming/makingvjbaseaddon
ENT.Type 			= "ai"
ENT.PrintName 		= "Blowfly"
ENT.Author 			= ""
ENT.Contact 		= ""
ENT.Purpose 		= ""
ENT.Instructions 	= ""
ENT.Category		= "Fallout 3"

if (CLIENT) then
	local Name = "Blowfly"
	local LangName = "npc_blowfly"
	language.Add(LangName, Name)
	killicon.Add(LangName,"hud/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"hud/killicons/default",Color(255,80,0,255))
end